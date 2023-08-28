package com.ez.gw.board.controller;

import java.util.List;

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

import com.ez.gw.board.model.BoardService;
import com.ez.gw.board.model.BoardVO;
import com.ez.gw.common.ConstUtil;
import com.ez.gw.common.PaginationInfo;
import com.ez.gw.common.SearchVO;

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
	
	
}
