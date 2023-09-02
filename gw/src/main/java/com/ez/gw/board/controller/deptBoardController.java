package com.ez.gw.board.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ez.gw.board.model.BoardService;
import com.ez.gw.board.model.BoardVO;
import com.ez.gw.boardlist.model.BoardListService;
import com.ez.gw.boardlist.model.BoardListVO;
import com.ez.gw.common.ConstUtil;
import com.ez.gw.common.EmpSearchVO;
import com.ez.gw.common.FileUploadUtil;
import com.ez.gw.common.PaginationInfo;
import com.ez.gw.common.Utility;
import com.ez.gw.pds.model.PdsService;
import com.ez.gw.pds.model.PdsVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class deptBoardController {
	private static final Logger logger = LoggerFactory.getLogger(deptBoardController.class);
	private final BoardService boardService;
	private final BoardListService boardListService;
	private final PdsService pdsService;
	private final FileUploadUtil fileuploadUtil;
	
	@RequestMapping("/board/deptBoard")
	public String deptBoardList(@ModelAttribute EmpSearchVO searchVo,Model model){
		logger.info("ajax 이용, 부서 게시판 검색- 파라미터 searchVo={}", searchVo);
		//[1] PaginationInfo 객체 생성
		PaginationInfo pagingInfo=new PaginationInfo();
		pagingInfo.setBlockSize(ConstUtil.BLOCK_SIZE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		//[2] SearchVo에 입력되지 않은 두 개의 변수에 값 셋팅
		searchVo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		BoardListVO boardlistVo=boardListService.boardListByboardlistNo(searchVo.getBoardlistNo());
		List<BoardListVO> deptBoardList=boardListService.seldeptBoard();
		List<Map<String, Object>> boardList=boardService.searchDeptBoard(searchVo);
		int totalRecord = boardService.gTRCountDeptBoard(searchVo);
		pagingInfo.setTotalRecord(totalRecord);
		logger.info("부서게시판 검색 결과 - deptBoardList.size()={}", deptBoardList.size());

		model.addAttribute("deptBoardList", deptBoardList);
		model.addAttribute("boardList", boardList);
		model.addAttribute("pagingInfo", pagingInfo);
		model.addAttribute("boardlistVo", boardlistVo);

		return "board/deptBoard";
	}
	
	@GetMapping("/board/deptBoardWrite")
	public String deptBoardWrite_get(@RequestParam(defaultValue = "0") int boardlistNo,Model model) {
		logger.info("부서 게시판 글쓰기 파라미터 boardlistNo={}", boardlistNo);
		BoardListVO boardlistVo=boardListService.boardListByboardlistNo(boardlistNo);
		logger.info("부서 게시판 글쓰기 ,boardlsitVo={}",boardlistVo);
		model.addAttribute("boardlistVo", boardlistVo);
		return "board/deptBoardWrite";
	}
	
	@PostMapping("/board/deptBoardWrite")
	public String deptBoardWrite_post(HttpSession session,
			HttpServletRequest request,@ModelAttribute PdsVO pdsVo,
			@ModelAttribute BoardVO vo, Model model) {
		int empNo=(int)session.getAttribute("empNo");
		vo.setEmpNo(empNo);
		logger.info("부서 게시판 글쓰기 처리 파라미터 vo={}", vo);
		int cnt=boardService.insertDeptBoard(vo);
		logger.info("부서 게시판 글쓰기 처리 결과 cnt={}", cnt);
		
		//2
		//다중파일 업로드 처리
		String fileName="", originalFileName="",filePath = "";
		long fileSize=0;
		logger.info("관리자 - 공지사항 글 등록 결과, cnt={}", cnt);
		
		int result=0;
		try {
			List<Map<String, Object>> list
			=fileuploadUtil.fileupload(request,ConstUtil.UPLOAD_NOTICE_FLAG);
			
			for(Map<String, Object> map:list) {
				fileName=(String) map.get("fileName");
				originalFileName=(String) map.get("originalFileName");
				fileSize=(long) map.get("fileSize");
				filePath = (String) map.get("uploadPath") + File.separator + fileName;
				
				logger.info("파일명:{}", fileName);
				
				pdsVo.setBoardListNo(vo.getBoardlistNo()); //공지사항 게시판 번호임
				pdsVo.setBoardNo(vo.getBoardNo()); //게시글 번호
				pdsVo.setFileExtension(originalFileName.substring(originalFileName.indexOf(".")+1)); // 확장자
				pdsVo.setFileName(fileName); //서버저장 파일명
				pdsVo.setFileSize(fileSize); //파일크기
				pdsVo.setOriginalFileName(originalFileName); //원본 파일명
				pdsVo.setPath(filePath); //파일 경로
				
				if(originalFileName!=null && !originalFileName.isEmpty()) { //원본 파일명이 있을때만 db에 파일 데이터 저장
					result = pdsService.insertFiles(pdsVo); //pds 테이블에 파일 db 저장
					logger.info("다중 파일 등록 결과 result = {}", result);
				}
			}//for
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		String msg="게시글 등록에 실패했습니다.",url="/board/deptBoardWrite?"+vo.getBoardlistNo();
		if(cnt>0) {
			msg="게시글 등록을 완료했습니다.";
			url="/board/deptBoardDetail?boardlistNo="+vo.getBoardlistNo()+"&boardNo="+vo.getBoardNo();
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		return "common/message"; 
	}
	
	@RequestMapping("/board/deptBoardDetail")
	public String Detail(@ModelAttribute BoardVO vo,Model model) {
		logger.info("부서 게시글 상세보기 파라미터 vo={}",vo);
		Map<String, Object> map=boardService.selectdeptBoard(vo);
		BoardListVO boardlistVo=boardListService.boardListByboardlistNo(vo.getBoardlistNo());
		List<PdsVO> pdsList=pdsService.selFilesByDeptBoard(vo);
		
		logger.info("부서 게시글 상세보기 결과 map={}, boardlistVo={}", map, boardlistVo);
		logger.info("부서 게시글 등록한 파일 리스트 조회 pdsList.size()={}", pdsList.size());
		
		List<String> fileInfoArr=new ArrayList<>();
		for(PdsVO pdsVo: pdsList) {
			long fileSize=pdsVo.getFileSize();
			String fileName=pdsVo.getOriginalFileName();
			fileInfoArr.add(Utility.getFileInfo(fileSize, fileName));
		}
		
		model.addAttribute("map", map);
		model.addAttribute("boardlistVo", boardlistVo);
		model.addAttribute("pdsList", pdsList);
		model.addAttribute("fileInfoArr",fileInfoArr);
		
		return "board/deptBoardDetail";
	}
	
}
