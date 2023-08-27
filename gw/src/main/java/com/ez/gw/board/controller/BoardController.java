package com.ez.gw.board.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ez.gw.board.model.BoardService;
import com.ez.gw.board.model.BoardVO;
import com.ez.gw.boardlist.model.BoardListService;
import com.ez.gw.boardlist.model.BoardListVO;
import com.ez.gw.common.ConstUtil;
import com.ez.gw.common.EmpSearchVO;
import com.ez.gw.common.PaginationInfo;
import com.ez.gw.common.SearchVO;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class BoardController {	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	private final BoardService boardService;
	private final BoardListService boardListService;
	
	@RequestMapping("/mypage/myWritingList")
	public String myWritingList(@ModelAttribute EmpSearchVO searchVo, 
			HttpSession session,Model model) {
		int empNo=(int)session.getAttribute("empNo");
		logger.info("내가 쓴 게시글 페이지 파라미터 empNo={}", empNo);
		searchVo.setEmpNo(empNo);
		//[1] PaginationInfo 객체 생성
			PaginationInfo pagingInfo=new PaginationInfo();
			pagingInfo.setBlockSize(ConstUtil.BLOCK_SIZE);
			pagingInfo.setCurrentPage(searchVo.getCurrentPage());
			pagingInfo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		//[2] SearchVo에 입력되지 않은 두 개의 변수에 값 셋팅
			searchVo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
			searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		int totalRecord=boardService.gTRSearchBoard(searchVo);
		pagingInfo.setTotalRecord(totalRecord);
		List<BoardListVO> boardListNames=boardListService.selectBoardList();
		
		List<Map<String, Object>> boardList=boardService.selectByEmpNo(searchVo);
		logger.info("내가 쓴 게시글 페이지당 건수 조회 결과 boardList.size()={}", boardList.size());
		
		model.addAttribute("boardList", boardList);
		model.addAttribute("boardListNames",boardListNames);
		model.addAttribute("pagingInfo",pagingInfo);
		
		return "mypage/myWritingList";
	}
	
	
	
}
