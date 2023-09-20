package com.ez.gw.board.controller;

import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ez.gw.board.model.BoardService;
import com.ez.gw.board.model.BoardVO;
import com.ez.gw.boardlist.model.BoardListService;
import com.ez.gw.boardlist.model.BoardListVO;
import com.ez.gw.comments.model.CommentsService;
import com.ez.gw.comments.model.CommentsVO;
import com.ez.gw.common.ConstUtil;
import com.ez.gw.common.EmpSearchVO;
import com.ez.gw.common.FileUploadUtil;
import com.ez.gw.common.PaginationInfo;
import com.ez.gw.common.Utility;
import com.ez.gw.employee.model.EmployeeService;
import com.ez.gw.employee.model.EmployeeVO;
import com.ez.gw.pds.model.PdsService;
import com.ez.gw.pds.model.PdsVO;
import com.ez.gw.secondhandTradeLike.model.SecondhandTradeLikeService;
import com.ez.gw.secondhandTradeLike.model.SecondhandTradeLikeVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class DeptBoardController {
	private static final Logger logger = LoggerFactory.getLogger(DeptBoardController.class);
	private final BoardService boardService;
	private final BoardListService boardListService;
	private final PdsService pdsService;
	private final FileUploadUtil fileuploadUtil;
	private final EmployeeService employeeService;
	private final CommentsService comService;
	private final SecondhandTradeLikeService likeService;
	
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
		for(Map<String, Object> map : boardList) {
			int boardNo=Integer.parseInt(String.valueOf(map.get("BOARD_NO")));
			int commentCount=comService.selCountDeptBoardReply(boardNo);
			int likeCount=likeService.deptBoardLikeCount(boardNo);
			map.put("timeNew", Utility.displayNew((Date)map.get("REGDATE")));
			map.put("commentCount", commentCount);
			map.put("likeCount", likeCount);
		}
		
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
		logger.info("부서게시판 글 등록 결과, cnt={}", cnt);
		
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
				
				pdsVo.setBoardListNo(vo.getBoardlistNo());
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
	public String Detail(HttpSession session,
			@ModelAttribute BoardVO vo, 
			@ModelAttribute EmpSearchVO searchVo,
			@ModelAttribute SecondhandTradeLikeVO likeVo2,Model model) {
		int empNo=(int)session.getAttribute("empNo");
		likeVo2.setEmpNo(empNo);
		logger.info("부서 게시글 상세보기 파라미터 vo={}",vo);
		//[1] PaginationInfo 객체 생성
		PaginationInfo pagingInfo=new PaginationInfo();
		pagingInfo.setBlockSize(ConstUtil.BLOCK_SIZE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		//[2] SearchVo에 입력되지 않은 두 개의 변수에 값 셋팅
		searchVo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		int totalRecord=comService.gTRCommentCount(searchVo);
		pagingInfo.setTotalRecord(totalRecord);
		Map<String, Object> map=boardService.selectdeptBoard(vo);
		Map<String, Object> prevMap=boardService.selPrevDeptBoard(vo);
		Map<String, Object> nextMap=boardService.selNextDeptBoard(vo);
		BoardListVO boardlistVo=boardListService.boardListByboardlistNo(vo.getBoardlistNo());
		List<PdsVO> pdsList=pdsService.selFilesByDeptBoard(vo);
		EmployeeVO empVo=employeeService.selectByEmpNo(empNo);
		List<Map<String, Object>> comList=comService.selectDeptBoardCM(searchVo);
		SecondhandTradeLikeVO likeVo=likeService.selectLikeFlag(likeVo2);
		
		logger.info("부서 게시글 상세보기 결과 map={}, boardlistVo={}", map, boardlistVo);
		logger.info("부서 게시글 등록한 파일 리스트 조회 pdsList.size()={}", pdsList.size());
		logger.info("부서 게시글 상세보기 댓글 조회 결과 comList.size()={}",comList.size());
		logger.info("부서 게시글 상세보기 좋아요 체크 여부 확인결과 likeVo={}", likeVo);
		
		List<String> fileInfoArr=new ArrayList<>();
		for(PdsVO pdsVo: pdsList) {
			long fileSize=pdsVo.getFileSize();
			String fileName=pdsVo.getOriginalFileName();
			fileInfoArr.add(Utility.getFileInfo(fileSize, fileName));
		}
		
		model.addAttribute("map", map);
		model.addAttribute("prevMap", prevMap);
		model.addAttribute("nextMap", nextMap);
		model.addAttribute("boardlistVo", boardlistVo);
		model.addAttribute("pdsList", pdsList);
		model.addAttribute("empVo", empVo);
		model.addAttribute("comList", comList);
		model.addAttribute("fileInfoArr",fileInfoArr);
		model.addAttribute("pagingInfo", pagingInfo);
		model.addAttribute("likeVo", likeVo);
		return "board/deptBoardDetail";
	}
	
	@GetMapping("/board/deptBoardEdit")
	public String deptBoardEdit_get(@RequestParam(defaultValue = "0") int boardNo, 
			@RequestParam(defaultValue = "0")int boardlistNo,
			@ModelAttribute BoardVO vo,Model model) {
		//1
		vo.setBoardlistNo(boardlistNo);
		vo.setBoardNo(boardNo);
		logger.info("부서 게시판 - 글 수정페이지 보여주기, 파라미터 vo={}", vo);
		
		if(boardNo==0) {
			model.addAttribute("msg", "잘못된 경로입니다.");
			model.addAttribute("url", "/admin/board/noticeList");
			
			return "common/message";
		}
		
		//2
		Map<String, Object> map=boardService.selectdeptBoard(vo);
		BoardListVO boardlistVo=boardListService.boardListByboardlistNo(boardlistNo);
		List<PdsVO> pdsList=pdsService.selFilesByDeptBoard(vo);
		logger.info("부서 게시판 - 글 수정페이지 조회 결과, map={}, boardlistVo={}", map, boardlistVo);
		logger.info("기존 등록한 파일 리스트 조회 pdsList.size()={}", pdsList.size());
		
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
		
		return "board/deptBoardWrite";
	}
	
	@PostMapping("/board/deptBoardEdit")
	public String deptBoardEdit_post(@ModelAttribute BoardVO vo,
			@ModelAttribute PdsVO pdsVo, HttpServletRequest request,
			Model model) {
		//1
		logger.info("부서 게시판 - 글 수정, 파라미터 vo={}, pdsVo={}", vo, pdsVo);
		
		//2
		//다중파일 업로드 처리
		String fileName="", originalFileName="",filePath = "";
		long fileSize=0;
		int cnt = boardService.updateDeptBoard(vo);
		logger.info("부서 게시판 - 글 수정 결과, cnt={}", cnt);
		
		//3
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
		
		String msg = "게시글 수정에 실패했습니다.", url = "/board/deptBoardEdit?boardlistNo="+vo.getBoardlistNo()+"&boardNo=" + vo.getBoardNo();
		if(cnt>0) { //파일 등록을 안할 수도 있으니까 result>0 뺌
			msg = "게시글 수정이 완료되었습니다.";
			url = "/board/deptBoardDetail?boardlistNo="+vo.getBoardlistNo()+"&boardNo=" + vo.getBoardNo();
		}
		//3
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		//4
		return "common/message";
	}
	
	@RequestMapping("/board/ajaxDeptBoardFileDelete")
	@ResponseBody
	public int noticeDelPdsFile(@RequestParam (defaultValue = "0")int pdsNo,
			@RequestParam(required = false) String oldFileName,
			HttpServletRequest request) {
		logger.info("ajax이용 - 삭제할 파일 자료실번호 파라미터 pdsNo={}", pdsNo);

		String upPath = fileuploadUtil.getUploadPath(request, ConstUtil.UPLOAD_NOTICE_FLAG);
		File file = new File(upPath, oldFileName);
		logger.info("file={}, file.exists()={}", file, file.exists());
		
		if (file.exists()) {
			boolean bool = file.delete();
			logger.info("기존 파일 삭제 여부 bool={}", bool);
		}
		int cnt=pdsService.editDeptBoardFile(pdsNo);
		logger.info("ajax이용 - 자료실 파일 삭제 결과 cnt={}", cnt);
		
		return cnt;
	}
	
	@RequestMapping("board/deptBoardDelete")
	public String deptBoardDelete(@RequestParam(defaultValue = "0") int boardNo,
			@RequestParam(defaultValue = "0") int boardlistNo,
			@ModelAttribute BoardVO boardVo,
			HttpServletRequest request, Model model) {
		//1
		logger.info("부서게시판 삭제 파라미터, boardNo={}", boardNo);
		
		if(boardNo==0) {
			model.addAttribute("msg", "잘못된 경로입니다.");
			model.addAttribute("url", "/board/deptBoard?boardlist"+boardlistNo);

			return "common/message";
		}
		
		//2
		boardVo.setBoardlistNo(boardlistNo);
		boardVo.setBoardNo(boardNo);
		List<PdsVO> fileList = pdsService.selFilesByDeptBoard(boardVo);
		logger.info("게시글 삭제 - 파일 삭제 전 파일 갯수 조회 fileList.size={}", fileList.size());
		
		if(fileList.size()>0) {
			for(PdsVO pdsVo : fileList) {
				String fileName = pdsVo.getFileName();
				if(fileName!=null && !fileName.isEmpty()) { //파일 삭제
					File f = new File(fileuploadUtil.getUploadPath(request, ConstUtil.UPLOAD_NOTICE_FLAG), fileName);
					logger.info("컨트롤러 파일 f={}", f);
					if(f.exists()) {
						boolean result = f.delete();
						logger.info("글 삭제 - 파일 삭제 여부 : {}", result);
					}
				}//if
			}//for
		}
		
		int cnt = boardService.deleteDeptBoard(boardVo);
		String msg = "게시글 삭제에 실패했습니다.", 
			url = "/board/deptBoardEdit?boardlistNo="+boardlistNo+"&boardNo=" + boardNo;
		if(cnt>0) {
			msg = "게시글 삭제가 완료되었습니다.";
			url = "/board/deptBoard?boardlistNo="+boardlistNo;
		}
		
		//3
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		//4
		return "common/message";
	}
	
	@ResponseBody
	@RequestMapping("/board/ajaxInsertBoardCM")
	public int insertCM(@ModelAttribute CommentsVO cmVo) {
		logger.info("ajax - 부서게시판 댓글등록 파라미터 cmVo={}", cmVo);
		int cnt=comService.insertDeptBoardCM(cmVo);
		logger.info("ajax - 부서게시판 댓글등록 결과 cnt={}", cnt);
		return cnt;
	}
	
	@ResponseBody
	@RequestMapping("/board/ajaxUpdateBoardCM")
	public int updateCM(@ModelAttribute CommentsVO cmVo) {
		logger.info("ajax - 부서게시판 댓글수정 파라미터 cmVo={}", cmVo);
		int cnt=comService.updateDeptBoardCM(cmVo);
		logger.info("ajax - 부서게시판 댓글수정 결과 cnt={}", cnt);
		return cnt;
	}
	
	@ResponseBody
	@RequestMapping("/board/ajaxDeleteBoardCM")
	public int deleteCM(@ModelAttribute CommentsVO cmVo) {
		logger.info("ajax - 부서게시판 댓글삭제 파라미터 cmVo={}", cmVo);
		int cnt=comService.deleteDeptBoardCM(cmVo);
		logger.info("ajax - 부서게시판 댓글삭제 결과 cnt={}", cnt);
		return cnt;
	}
	
	@ResponseBody
	@RequestMapping("/board/ajaxReplyRCM")
	public int reply(@ModelAttribute CommentsVO cmVo){
		logger.info("ajax - 부서게시판 답글등록 파라미터 cmVo={}", cmVo);
		int cnt=comService.reply2(cmVo);
		logger.info("ajax - 부서게시판 답글등록 결과 cnt={}", cnt);
		return cnt;
	}
	
	@ResponseBody
	@RequestMapping("/board/ajaxInsertDeptBoardLike")
	public int deptBoardLike(@ModelAttribute SecondhandTradeLikeVO likeVo) {
		logger.info("ajax - 부서게시판 좋아요 누르기 파라미터 likeVo={}", likeVo);
		int cnt=likeService.insertDeptBoardLike(likeVo);
		logger.info("ajax - 부서게시판 좋아요 누르기 결과 cnt={}", cnt);
		int result=0;
		if(cnt>0) {
			result=boardService.likeCountUp(likeVo.getBoardNo());
			logger.info("ajax - 게시판 likeCountUp 결과 result={}", result);
		}
		return result;
	}
	
	@ResponseBody
	@RequestMapping("/board/ajaxUpdateDeptBoardLikeOff")
	public int deptBoardLikeOff(@ModelAttribute SecondhandTradeLikeVO likeVo) {
		logger.info("ajax - 부서게시판 좋아요 취소 파라미터 likeVo={}", likeVo);
		int cnt=likeService.updateLikeOff(likeVo);
		logger.info("ajax - 부서게시판 좋아요 취소 결과 cnt={}", cnt);
		int result=0;
		if(cnt>0) {
			result=boardService.likeCountDown(likeVo.getBoardNo());
			logger.info("ajax - 게시판 likeCountDown 결과 result={}", result);
		}
		return result;
	}
	
	@ResponseBody
	@RequestMapping("/board/ajaxUpdateDeptBoardLikeOn")
	public int deptBoardLikeOn(@ModelAttribute SecondhandTradeLikeVO likeVo) {
		logger.info("ajax - 부서게시판 좋아요 다시누르기 파라미터 likeVo={}", likeVo);
		int cnt=likeService.updateLikeOn(likeVo);
		logger.info("ajax - 부서게시판 좋아요 다시누르기 결과 cnt={}", cnt);
		int result=0;
		if(cnt>0) {
			result=boardService.likeCountUp(likeVo.getBoardNo());
			logger.info("ajax - 게시판 likeCountUp 결과 result={}", result);
		}
		return result;
	}
	
	@ResponseBody
	@RequestMapping("/board/updateReadCount")
	public int updateReadCount(@RequestParam (defaultValue = "0")int boardNo) {
		logger.info("게시판 조회수 증가 파라미터 boardNo={}", boardNo);
		int cnt=boardService.updateReadcount(boardNo);
		logger.info("게시판 조회수 증가 결과 cnt={}", cnt);
		return cnt;
	}
	
	
}
