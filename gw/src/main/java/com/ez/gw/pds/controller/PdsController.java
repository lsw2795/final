package com.ez.gw.pds.controller;

import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
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
import org.springframework.web.servlet.ModelAndView;

import com.ez.gw.board.model.BoardService;
import com.ez.gw.board.model.BoardVO;
import com.ez.gw.common.ConstUtil;
import com.ez.gw.common.FileUploadUtil;
import com.ez.gw.common.PaginationInfo;
import com.ez.gw.common.SearchVO;
import com.ez.gw.common.Utility;
import com.ez.gw.employee.model.EmployeeService;
import com.ez.gw.employee.model.EmployeeVO;
import com.ez.gw.pds.model.PdsService;
import com.ez.gw.pds.model.PdsVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/pds")
public class PdsController {
	private static final Logger logger=LoggerFactory.getLogger(PdsController.class);
	private final PdsService pdsService;
	private final BoardService boardService;
	private final FileUploadUtil fileUploadUtil;
	private final EmployeeService employeeService;
	

	@RequestMapping("/list")
	public String list(@ModelAttribute SearchVO searchVo ,Model model) {
		//1
		logger.info("자료실 메인페이지 파라미터 searchVo={}", searchVo);
		
		//2
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(ConstUtil.BLOCK_SIZE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);

		//[2]SearchVo에 입력되지 않은 두 개의 변수에 값 셋팅
		searchVo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		List<Map<String, Object>> list = pdsService.selectPdsAll(searchVo);
		logger.info("자료실 전체조회, list.size={}", list.size());
		
		for (Map<String, Object> map : list) {
		    BigDecimal boardNoDecimal = (BigDecimal) map.get("BOARD_NO");
		    int boardNo = boardNoDecimal.intValue(); // BigDecimal을 int로 변환
		    int fileCount = pdsService.selectIsFile(boardNo); // 파일 첨부 여부 조회
		    map.put("fileCount", fileCount);
		    map.put("timeNew", Utility.displayNew((Date)map.get("REGDATE")));
		    
		}
		
		int totalRecord = pdsService.getTotalRecord(searchVo);
		logger.info("글 목록 전체 조회 - totalRecord={}", totalRecord);
		pagingInfo.setTotalRecord(totalRecord);

		//3
		model.addAttribute("list", list);
		model.addAttribute("pagingInfo", pagingInfo);

		//4
		return "pds/list";

		
	}

	@GetMapping("/write")
	public String write(HttpSession session, Model model) {
		int empNo = (int)session.getAttribute("empNo");
		//1
		logger.info("자료실 등록 페이지");
		
		//2
		EmployeeVO vo = employeeService.selectByEmpNo(empNo);
		
		//3
		model.addAttribute("vo", vo);
		
		//4
		return "pds/write";
	}

	@PostMapping("/write")
	public String write_post(@ModelAttribute BoardVO boardVo, @ModelAttribute PdsVO pdsVo,
			HttpSession session,HttpServletRequest request, Model model) {
		//1
		int empNo = (int)session.getAttribute("empNo");
		boardVo.setEmpNo(empNo);
		logger.info("자료실 등록, 파라미터 vo={}", boardVo);

		//2
		//파일 업로드 처리
		String fileName="", originalFileName="", filePath = "";
		long fileSize = 0;

		int cnt = pdsService.insertPds(boardVo);
		logger.info("자료실-게시글 등록 결과, cnt={}", cnt);

		List<Map<String, Object>> fileList;
		try {
			fileList = fileUploadUtil.fileupload(request, ConstUtil.UPLOAD_FILE_FLAG);
			for(Map<String, Object> map : fileList) {
				fileName = (String) map.get("fileName");
				originalFileName = (String) map.get("originalFileName");
				fileSize = (long) map.get("fileSize");
				filePath = (String) map.get("uploadPath") + File.separator + fileName;

				logger.info("파일명:{}", fileName);
				pdsVo.setBoardListNo(3000); //게시판 번호
				pdsVo.setBoardNo(boardVo.getBoardNo()); //게시글 번호
				pdsVo.setFileExtension(originalFileName.substring(originalFileName.indexOf(".")+1)); // 확장자
				pdsVo.setFileName(fileName); //서버저장 파일명
				pdsVo.setFileSize(fileSize); //파일크기
				pdsVo.setOriginalFileName(originalFileName); //원본 파일명
				pdsVo.setPath(filePath); //파일 경로

				if(originalFileName!=null && !originalFileName.isEmpty()) { //원본 파일명이 있을때만 db에 파일 데이터 저장
					int result = pdsService.insertFiles(pdsVo); //pds 테이블에 파일 db 저장
					logger.info("다중 파일 등록 결과 result = {}", result);
				}
			}//for
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}


		String msg = "자료 등록 실패", url ="/pds/write";
		if(cnt>0) {
			msg = "자료 등록 성공";
			url = "/pds/list";
		}
		//3
		model.addAttribute("url", url);
		model.addAttribute("msg", msg);

		//4
		return "common/message";
	}

	@GetMapping("/edit")
	public String edit(@RequestParam(defaultValue = "0") int boardNo, Model model) {
		//1
		logger.info("자료실 수정 페이지");
		if(boardNo==0) {
			model.addAttribute("msg", "잘못된 경로입니다.");
			model.addAttribute("url", "/pds/list");

			return "common/message";
		}

		//2
		Map<String, Object> map = pdsService.selectPds(boardNo);
		logger.info("자료실 자료 상세조회, map={}", map);
		
		List<PdsVO> fileList = pdsService.selectFilesByBoardNo(boardNo);
		logger.info("자료실 자료 상세조회 - 파일 조회 fileList.size={}", fileList.size());
		
		//3
		model.addAttribute("map", map);
		model.addAttribute("fileList", fileList);
		//4
		return "pds/edit";
	}

	@PostMapping("/edit")
	public String edit_post(BoardVO vo, Model model) {
		//1
		logger.info("자료실 수정 파라미터, vo={}", vo);

		//2
		int cnt = pdsService.updatePds(vo);
		logger.info("자료 수정 결과, cnt={}", cnt);
		

		//3
		String msg = "자료 수정 실패", url = "/pds/edit?boardNo=" + vo.getBoardNo();
		if(cnt>0) {
			msg = "자료가 수정되었습니다.";
			url = "/pds/detail?boardNo=" + vo.getBoardNo();
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		//4
		return "common/message";
	}


	@RequestMapping("/detail")
	public String detail(@RequestParam(defaultValue = "0") int boardNo, Model model) {
		//1
		logger.info("자료실 상세보기 페이지");
		if(boardNo==0) {
			model.addAttribute("msg", "잘못된 경로입니다.");
			model.addAttribute("url", "/pds/list");

			return "common/message";
		}

		//2
		int cnt = boardService.updateReadcount(boardNo);
		logger.info("조회수 증가 결과, cnt={}", cnt);

		Map<String, Object> map = pdsService.selectPds(boardNo);
		logger.info("자료실 자료 상세조회, map={}", map);
		
		List<PdsVO> fileList = pdsService.selectFilesByBoardNo(boardNo);
		logger.info("자료실 자료 상세조회 - 파일 조회 fileList.size={}", fileList.size());
		
		List<String> fileInfoArr = new ArrayList<>(); 
		for(PdsVO vo : fileList) {
			long fileSize = vo.getFileSize();
			String fileName = vo.getOriginalFileName();
			fileInfoArr.add(Utility.getFileInfo(fileSize, fileName));
		}

		//3
		model.addAttribute("map", map);
		model.addAttribute("fileList", fileList);
		model.addAttribute("fileInfoArr", fileInfoArr);

		//4
		return "pds/detail";
	}

	@RequestMapping("/delete")
	public String delete(@RequestParam(defaultValue = "0") int boardNo,
			HttpServletRequest request, Model model) {
		//1
		logger.info("자료 삭제 파라미터, boardNo={}", boardNo);
		if(boardNo==0) {
			model.addAttribute("msg", "잘못된 경로입니다.");
			model.addAttribute("url", "/pds/list");

			return "common/message";
		}
		//2
		
		
		List<PdsVO> fileList = pdsService.selectFilesByBoardNo(boardNo);
		logger.info("게시글 삭제 - 파일 삭제 전 파일 갯수 조회 fileList.size={}", fileList.size());
		
		String msg = "자료 삭제 실패하였습니다.", url = "/pds/detail?boardNo=" + boardNo;
		
		if(fileList.size()>0) {
			for(PdsVO vo : fileList) {
				String fileName = vo.getFileName();
				if(fileName!=null && !fileName.isEmpty()) { //파일 삭제
					File f = new File(fileUploadUtil.getUploadPath(request, ConstUtil.UPLOAD_FILE_FLAG), fileName);
					logger.info("컨트롤러 파일 f={}", f);
					if(f.exists()) {
						boolean result = f.delete();
						logger.info("글 삭제 - 파일 삭제 여부 : {}", result);
					}
				}//if
			}//for
		}
		
		int cnt = pdsService.deletePds(boardNo);
		logger.info("게시글 삭제 결과 cnt={}", cnt);
		
		if(cnt>0) {
			msg = "자료가 삭제 되었습니다.";
			url = "/pds/list";
			
		}

		//3
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		//4
		return "common/message";

	}


	
	@RequestMapping("/download")
	public ModelAndView download(@RequestParam(defaultValue = "0") int boardNo,
			@RequestParam String fileName, HttpServletRequest request) {
		//1
		logger.info("파일 다운로드 처리, 파라미터 no={}, fileName={}", boardNo, fileName);

		//2
		int cnt = pdsService.updateDownloadCount(boardNo);
		logger.info("다운로드 수 증가, 결과 cnt={}", cnt);

		//3
		//4
		//강제 다운로드 처리를 위한 뷰페이지로 보내준다

		Map<String, Object> map = new HashMap<>();
		String upPath 
		= fileUploadUtil.getUploadPath(request, ConstUtil.UPLOAD_FILE_FLAG);
		File file = new File(upPath, fileName);
		map.put("file", file);

		//ModelAndView(String viewName, Map<String, ?> model)
		ModelAndView mav = new ModelAndView("pdsDownloadView", map); //첫글자 소문자
		return mav;

	}

}



