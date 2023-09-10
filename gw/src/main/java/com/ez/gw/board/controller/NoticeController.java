package com.ez.gw.board.controller;

import java.io.File;
import java.io.IOException;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ez.gw.board.model.BoardService;
import com.ez.gw.board.model.BoardVO;
import com.ez.gw.board.model.ListBoardVO;
import com.ez.gw.common.ConstUtil;
import com.ez.gw.common.FileUploadUtil;
import com.ez.gw.common.PaginationInfo;
import com.ez.gw.common.SearchVO;
import com.ez.gw.common.Utility;
import com.ez.gw.employee.model.EmployeeService;
import com.ez.gw.pds.model.PdsService;
import com.ez.gw.pds.model.PdsVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class NoticeController {
	private static final Logger logger=LoggerFactory.getLogger(NoticeController.class);
	private final BoardService boardService;
	private final PdsService pdsService;
	private final FileUploadUtil fileuploadUtil;
	
	@GetMapping("/admin/board/noticeWrite")
	public String noticeWrite_get() {
		logger.info("관리자 - 공지사항 글쓰기 페이지 보여주기");
		
		return "admin/board/noticeWrite";
	}
	
	@PostMapping("/admin/board/noticeWrite")
	public String noticeWrite_post(@ModelAttribute BoardVO vo,
			@ModelAttribute PdsVO pdsVo,
			HttpSession session,
			HttpServletRequest request,Model model) {
		//1
		int empNo = (int)session.getAttribute("empNo");
		vo.setEmpNo(empNo);
		//logger.info("관리자 - 공지사항 글쓰기 페이지, 파라미터 vo={}, empNo={}", vo, empNo);
		//2
		//다중파일 업로드 처리
		String fileName="", originalFileName="",filePath = "";
		long fileSize=0;
		int cnt=boardService.insertNotice(vo);
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
				
				//logger.info("파일명:{}", fileName);
				
				pdsVo.setBoardListNo(2000); //공지사항 게시판 번호임
				pdsVo.setBoardNo(vo.getBoardNo()); //게시글 번호
				pdsVo.setFileExtension(originalFileName.substring(originalFileName.indexOf(".")+1)); // 확장자
				pdsVo.setFileName(fileName); //서버저장 파일명
				pdsVo.setFileSize(fileSize); //파일크기
				pdsVo.setOriginalFileName(originalFileName); //원본 파일명
				pdsVo.setPath(filePath); //파일 경로
				
				if(originalFileName!=null && !originalFileName.isEmpty()) { //원본 파일명이 있을때만 db에 파일 데이터 저장
					result = pdsService.insertFiles(pdsVo); //pds 테이블에 파일 db 저장
					//logger.info("다중 파일 등록 결과 result = {}", result);
				}
			}//for
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		String msg="공지사항 등록에 실패했습니다.",url="/admin/board/noticeWrite";
		if(cnt>0) { //파일 등록을 안하고 공지사항 등록을 할 수 있기때문에 result>0 빼기
			msg="공지사항 등록이 완료되었습니다.";
			url="/admin/board/noticeList";
		}
		//3
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		//4
		return "common/message";
	}

	@RequestMapping("/admin/board/noticeList")
	public String noticeList(@ModelAttribute SearchVO searchVo, Model model) {
		//1
		logger.info("관리자 - 공지사항 목록 페이지");
		//[1] PaginationInfo 객체 생성
		PaginationInfo pagingInfo=new PaginationInfo();
		pagingInfo.setBlockSize(ConstUtil.BLOCK_SIZE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		//[2] SearchVo에 입력되지 않은 두 개의 변수에 값 셋팅
		searchVo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		int totalRecord=boardService.gTRSearchNotice(searchVo);
		pagingInfo.setTotalRecord(totalRecord);
		//2
		List<Map<String, Object>> list = boardService.selectNoticeAll(searchVo);
		logger.info("관리자 - 공지사항 전체 조회 결과, list.size={}", list.size());
	
		for(Map<String, Object> map : list) {
			map.put("timeNew", Utility.displayNew((Date)map.get("REGDATE")));
		}
		//3
		model.addAttribute("list", list);
		model.addAttribute("pagingInfo", pagingInfo);
		//4
		return "admin/board/noticeList";
	}
	
	@RequestMapping("/admin/board/noticeDetail")
	public String noticeDetail(@RequestParam(defaultValue = "0") int boardNo, Model model) {
		//1
		logger.info("관리자 - 공지사항 글 상세보기 페이지, 파라미터 boardNo={}", boardNo);
		
		if(boardNo==0) {
			model.addAttribute("msg", "잘못된 경로입니다.");
			model.addAttribute("url", "/admin/board/noticeList");
			
			return "common/message";
		}
		
		//2
		Map<String, Object> map = boardService.selectNotice(boardNo);
		Map<String, Object> prevMap=boardService.selectPrevNotice(boardNo);
		Map<String, Object> nextMap=boardService.selectNextNotice(boardNo);
		List<PdsVO> pdsList=pdsService.selFilesByNotice(boardNo);
		logger.info("관리자 - 공지사항 글 상세조회 결과, map={}", map);
		logger.info("관리자 - 이전글 이동 prevMap={}", prevMap);
		logger.info("관리자 - 다음글 이동 nextMap={}", nextMap);
		logger.info("공지사항 등록한 파일 리스트 조회 pdsList.size()={}", pdsList.size());
		
		List<String> fileInfoArr=new ArrayList<>();
		for(PdsVO pdsVo: pdsList) {
			long fileSize=pdsVo.getFileSize();
			String fileName=pdsVo.getOriginalFileName();
			fileInfoArr.add(Utility.getFileInfo(fileSize, fileName));
		}
		
		//3
		model.addAttribute("map", map);
		model.addAttribute("prevMap",prevMap);
		model.addAttribute("nextMap",nextMap);
		model.addAttribute("pdsList", pdsList);
		model.addAttribute("fileInfoArr",fileInfoArr);
		//4
		return "admin/board/noticeDetail";
	}
	
	@RequestMapping("/board/noticeList")
	public String noticeList2(@ModelAttribute SearchVO searchVo, Model model) {
		//1
		logger.info("사원 - 공지사항 목록 페이지");
		//[1] PaginationInfo 객체 생성
		PaginationInfo pagingInfo=new PaginationInfo();
		pagingInfo.setBlockSize(ConstUtil.BLOCK_SIZE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		//[2] SearchVo에 입력되지 않은 두 개의 변수에 값 셋팅
		searchVo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
	
		int totalRecord=boardService.gTRSearchNotice(searchVo);
		pagingInfo.setTotalRecord(totalRecord);
		//2
		List<Map<String, Object>> list = boardService.selectNoticeAll(searchVo);
		logger.info("사원 - 공지사항 전체 조회 결과, list.size={}", list.size());
		
		for(Map<String, Object> map : list) {
			map.put("timeNew", Utility.displayNew((Date)map.get("REGDATE")));
		}
		//3
		model.addAttribute("list", list);
		model.addAttribute("pagingInfo", pagingInfo);
		//4
		return "board/noticeList";
	}
	
	@RequestMapping("/board/noticeDetail")
	public String noticeDetail2(@RequestParam(defaultValue = "0") int boardNo, Model model) {
		//1
		logger.info("사원 - 공지사항 글 상세보기 페이지, 파라미터 boardNo={}", boardNo);
	
		if(boardNo==0) {
			model.addAttribute("msg", "잘못된 경로입니다.");
			model.addAttribute("url", "/board/noticeList");
			
			return "common/message";
		}
		
		//2
		Map<String, Object> map = boardService.selectNotice(boardNo);
		Map<String, Object> prevMap=boardService.selectPrevNotice(boardNo);
		Map<String, Object> nextMap=boardService.selectNextNotice(boardNo);
		List<PdsVO> pdsList=pdsService.selFilesByNotice(boardNo);
		logger.info("사원 - 공지사항 글 상세조회 결과, map={}", map);
		logger.info("사원 - 이전글 이동 prevMap={}", prevMap);
		logger.info("사원 - 다음글 이동 nextMap={}", nextMap);
		logger.info("공지사항 등록한 파일 리스트 조회 pdsList.size()={}", pdsList.size());
	
		List<String> fileInfoArr=new ArrayList<>();
		for(PdsVO pdsVo: pdsList) {
			long fileSize=pdsVo.getFileSize();
			String fileName=pdsVo.getOriginalFileName();
			fileInfoArr.add(Utility.getFileInfo(fileSize, fileName));
		}
		
		//3
		model.addAttribute("map", map);
		model.addAttribute("prevMap",prevMap);
		model.addAttribute("nextMap",nextMap);
		model.addAttribute("pdsList", pdsList);
		model.addAttribute("fileInfoArr",fileInfoArr);
		
		//4
		return "board/noticeDetail";
	}
	
	@GetMapping("/admin/board/noticeEdit")
	public String noticeEdit_get(@RequestParam(defaultValue = "0") int boardNo, Model model) {
		//1
		logger.info("관리자 - 공지사항 글 수정페이지 보여주기, 파라미터 boardNo={}", boardNo);
		
		if(boardNo==0) {
			model.addAttribute("msg", "잘못된 경로입니다.");
			model.addAttribute("url", "/admin/board/noticeList");
			
			return "common/message";
		}
		
		//2
		Map<String, Object> map = boardService.selectNotice(boardNo);
		List<PdsVO> pdsList=pdsService.selFilesByNotice(boardNo);
		logger.info("관리자 - 공지사항 글 수정페이지 조회 결과, map={}", map);
		logger.info("기존 등록한 파일 리스트 조회 pdsList.size()={}", pdsList.size());
		
		List<String> fileInfoArr=new ArrayList<>();
		for(PdsVO pdsVo: pdsList) {
			long fileSize=pdsVo.getFileSize();
			String fileName=pdsVo.getOriginalFileName();
			fileInfoArr.add(Utility.getFileInfo(fileSize, fileName));
		}
		
		model.addAttribute("map", map);
		model.addAttribute("pdsList", pdsList);
		model.addAttribute("fileInfoArr",fileInfoArr);
		
		return "admin/board/noticeWrite";
	}
	
	@RequestMapping("/admin/board/ajaxNoticeFileDelete")
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
		
		int cnt=pdsService.editNoticeFile(pdsNo);
		logger.info("ajax이용 - 자료실 파일 삭제 결과 cnt={}", cnt);
		
		return cnt;
	}
	
	@PostMapping("/admin/board/noticeEdit")
	public String noticeEdit_post(@ModelAttribute BoardVO vo,
			@ModelAttribute PdsVO pdsVo, HttpServletRequest request,
			Model model) {
		//1
		logger.info("관리자 - 공지사항 수정, 파라미터 vo={}, pdsVo={}", vo, pdsVo);
		
		//2
		//다중파일 업로드 처리
		String fileName="", originalFileName="",filePath = "";
		long fileSize=0;
		int cnt = boardService.updateNotice(vo);
		logger.info("관리자 - 공지사항 수정 결과, cnt={}", cnt);
		
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
				
				pdsVo.setBoardListNo(2000); //공지사항 게시판 번호임
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
		
		String msg = "공지사항 수정에 실패했습니다.", url = "/admin/board/noticeEdit?boardNo=" + vo.getBoardNo();
		if(cnt>0) { //파일 등록을 안할 수도 있으니까 result>0 뺌
			msg = "공지사항 수정이 완료되었습니다.";
			url = "/admin/board/noticeDetail?boardNo=" + vo.getBoardNo();
		}
		//3
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		//4
		return "common/message";
	}
	
	@RequestMapping("/admin/board/noticeDelete")
	public String noticeDelete(@RequestParam(defaultValue = "0") int boardNo,
			HttpServletRequest request, Model model) {
		//1
		logger.info("관리자 - 공지사항 삭제 파라미터, boardNo={}", boardNo);
		
		if(boardNo==0) {
			model.addAttribute("msg", "잘못된 경로입니다.");
			model.addAttribute("url", "/admin/board/noticeList");

			return "common/message";
		}
		
		//2
		List<PdsVO> fileList = pdsService.selFilesByNotice(boardNo);
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
		
		int cnt = boardService.deleteNotice(boardNo);
		String msg = "공지사항 삭제에 실패했습니다.", url = "/admin/board/noticeEdit?boardNo=" + boardNo;
		if(cnt>0) {
			msg = "공지사항 삭제가 완료되었습니다.";
			url = "/admin/board/noticeList";
		}
		
		//3
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		//4
		return "common/message";
	}
	
	@RequestMapping("/notice/download")
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
		= fileuploadUtil.getUploadPath(request, ConstUtil.UPLOAD_NOTICE_FLAG);
		File file = new File(upPath, fileName);
		map.put("file", file);

		//ModelAndView(String viewName, Map<String, ?> model)
		ModelAndView mav = new ModelAndView("pdsDownloadView", map); //첫글자 소문자
		return mav;

	}

	@RequestMapping("/admin/board/noticeDeleteMulti")
	public String deleteFaqMulti(@ModelAttribute ListBoardVO listVo,Model model) {
		logger.info("관리자 - 선택한 공지사항 게시글 멀티삭제, 파라미터 listVo={}", listVo);
		
		List<BoardVO> list = listVo.getBoardItems();
		int cnt = boardService.noticeDeleteMulti(list);
		logger.info("관리자 - 공지사항 게시글 멀티삭제 결과, cnt={}", cnt);
		String msg="공지사항 게시글 삭제에 실패했습니다.",url="/admin/board/noticeList";
		if(cnt>0) {
			msg="공지사항 게시글 삭제에 성공했습니다.";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		//4
		return "common/message";
	}

	@RequestMapping("/board/noticeList5")
	public String selRegdateDesc5(Model model) {
		logger.info("사원 - 메인페이지 공지사항 최신글 5건 조회");
		List<Map<String, Object>> noticeList=boardService.selRegdateDesc5();
		//logger.info("사원 - 메인페이지 공지사항 최신글 5건 조회 결과 noticeList={}", noticeList);
		
		for(Map<String, Object> map : noticeList) {
			map.put("timeNew", Utility.displayNew((Date)map.get("REGDATE")));
		}
		model.addAttribute("noticeList", noticeList);
		
		return "board/noticeList5";
	}
}
