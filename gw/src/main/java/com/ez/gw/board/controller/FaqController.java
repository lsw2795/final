package com.ez.gw.board.controller;

import java.io.IOException;
import java.util.List;

import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
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
import org.springframework.web.multipart.MultipartFile;

import com.ez.gw.board.model.BoardService;
import com.ez.gw.board.model.BoardVO;
import com.ez.gw.board.model.ListBoardVO;
import com.ez.gw.boardlist.model.BoardListVO;
import com.ez.gw.common.ConstUtil;
import com.ez.gw.common.PaginationInfo;
import com.ez.gw.common.SearchVO;
import com.ez.gw.commute.model.CommuteVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class FaqController {
	private static final Logger logger = LoggerFactory.getLogger(FaqController.class);
	private final BoardService boardService;
	
	@GetMapping("/admin/board/faqWrite")
	public String insertFaq_get() {
		logger.info("관리자 FAQ 등록 페이지");
		return "admin/board/faqWrite";
	}
	
	@ResponseBody
	@RequestMapping("/admin/board/ajaxInsertFAQ")
	public int insertFaq(@ModelAttribute BoardVO boardVo,
			HttpSession session) {
		int empNo=(int)session.getAttribute("empNo");
		boardVo.setEmpNo(empNo);
		logger.info("ajax 이용 - 관리자 FAQ 등록 처리 파라미터 boardVo={}", boardVo);
		int cnt=boardService.insertFAQ(boardVo);
		logger.info("ajax 이용 - 관리자 FAQ 등록 처리 결과 cnt={}", cnt);
		return cnt;
	}
	
	@RequestMapping("/admin/board/faqList")
	public String faqList(@ModelAttribute SearchVO searchVo,Model model) {
		logger.info("관리자 - FAQ 목록 조회 파라미터 searchVo={}", searchVo);
		//[1] PaginationInfo 객체 생성
		PaginationInfo pagingInfo=new PaginationInfo();
		pagingInfo.setBlockSize(ConstUtil.BLOCK_SIZE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		//[2] SearchVo에 입력되지 않은 두 개의 변수에 값 셋팅
		searchVo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		int totalRecord=boardService.gTRsearchFAQ(searchVo);
		pagingInfo.setTotalRecord(totalRecord);
		//2
		List<BoardVO> faqList=boardService.selectFAQ(searchVo);
		logger.info("관리자 - FAQ 목록 페이지당 레코드 결과, faqList.size()={}", faqList.size());
		//3
		model.addAttribute("faqList", faqList);
		model.addAttribute("pagingInfo", pagingInfo);
		return "admin/board/faqList";
	}
	
	@GetMapping("/admin/board/faqEdit")
	public String updateFaq_get(@RequestParam (defaultValue = "0")int boardNo,Model model) {
		logger.info("관리자 - 수정 페이지 보여주기 파라미터 boardNo={}", boardNo);
		BoardVO boardVo=boardService.selectFAQByBoardNo(boardNo);
		logger.info("관리자 - 수정 페이지 결과 boardVo={}", boardVo);
		model.addAttribute("boardVo",boardVo);
		return "admin/board/faqWrite";
	}
	
	@ResponseBody
	@RequestMapping("/admin/board/ajaxUpdateFAQ")
	public int updateFaq(@ModelAttribute BoardVO boardVo) {
		logger.info("관리자 - 수정 처리 파라미터 boardVo={}", boardVo);
		int cnt=boardService.updateFAQ(boardVo);
		logger.info("관리자 - 수정 처리 결과 cnt={}", cnt);
		return cnt;
	}
	
	@RequestMapping("/admin/board/faqDeleteMulti")
	public String deleteFaqMulti(@ModelAttribute ListBoardVO listVo,Model model) {
		logger.info("관리자 - 선택한 FAQ 게시글 멀티삭제, 파라미터 listVo={}", listVo);
		List<BoardVO> list = listVo.getBoardItems();
		int cnt = boardService.faqDeleteMulti(list);
		logger.info("관리자 - FAQ 게시글 멀티삭제 결과, cnt={}", cnt);
		String msg="FAQ 게시글 삭제에 실패했습니다.",url="/admin/board/faqList";
		if(cnt>0) {
			msg="FAQ 게시글 삭제에 성공했습니다.";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		//4
		return "common/message";
	}

	@RequestMapping("/board/faqList")
	public String faqList2(@ModelAttribute SearchVO searchVo,Model model) {
		logger.info("사원 - FAQ 목록 조회 파라미터 searchVo={}", searchVo);
		//[1] PaginationInfo 객체 생성
		PaginationInfo pagingInfo=new PaginationInfo();
		pagingInfo.setBlockSize(ConstUtil.BLOCK_SIZE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		//[2] SearchVo에 입력되지 않은 두 개의 변수에 값 셋팅
		searchVo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		int totalRecord=boardService.gTRsearchFAQ(searchVo);
		pagingInfo.setTotalRecord(totalRecord);
		//2
		List<BoardVO> faqList=boardService.selectFAQ(searchVo);
		logger.info("사원 - FAQ 목록 페이지당 레코드 결과, faqList.size()={}", faqList.size());
		//3
		model.addAttribute("faqList", faqList);
		model.addAttribute("pagingInfo", pagingInfo);
		return "board/faqList";
	}
	
	@PostMapping("/admin/board/importFromExcel")
	public String importFromExcel(@RequestParam("file") MultipartFile file,
			HttpSession session) throws IOException {
	    
		// 원본 파일명이 .xlsx로 끝나지 않으면 
	    if (!file.getOriginalFilename().endsWith(".xlsx")) {
	        return "redirect:/admin/board/faqList";
	    }

	    // Create a new Excel workbook from the uploaded file
	    Workbook workbook = new XSSFWorkbook(file.getInputStream());
	    Sheet sheet = workbook.getSheetAt(0); // Assuming the data is in the first sheet

	    // Iterate through rows and insert data into the database
	    for (Row row : sheet) {
	        // Skip the header row
	        if (row.getRowNum() == 0) {
	            continue;
	        }
	        
	        String title = row.getCell(0).getStringCellValue();
	        String content = row.getCell(1).getStringCellValue();
	        int empNo=(int)session.getAttribute("empNo");
	        
	        if (title == null && content == null) {
	            continue;
	        }

	        BoardVO boardVo = new BoardVO();
	        boardVo.setTitle(title);
	        boardVo.setContent(content);
	        boardVo.setEmpNo(empNo);
	        boardService.insertFAQ(boardVo);
	    }

	    workbook.close();
	    return "redirect:/admin/board/faqList?importSuccess=Data imported successfully";
	}
}
