package com.ez.gw.boardlist.controller;

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

import com.ez.gw.boardlist.model.BoardListService;
import com.ez.gw.boardlist.model.BoardListVO;
import com.ez.gw.common.ConstUtil;
import com.ez.gw.common.PaginationInfo;
import com.ez.gw.common.SearchVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class BoardListController {
	private static final Logger logger = LoggerFactory.getLogger(BoardListController.class);
	private final BoardListService boardListService;
	
	@RequestMapping("/admin/board/manageBoards")
	public String manageBoardList(@ModelAttribute SearchVO searchVo, 
			Model model) {
	//[1] PaginationInfo 객체 생성
	PaginationInfo pagingInfo=new PaginationInfo();
	pagingInfo.setBlockSize(ConstUtil.BLOCK_SIZE);
	pagingInfo.setCurrentPage(searchVo.getCurrentPage());
	pagingInfo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
	//[2] SearchVo에 입력되지 않은 두 개의 변수에 값 셋팅
	searchVo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
	searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());

	int totalRecord=boardListService.gTRSearchBoardList(searchVo);
	pagingInfo.setTotalRecord(totalRecord);
	List<BoardListVO> boardList=boardListService.selAdminBoardList(searchVo);
	logger.info("관리자 - 게시판관리 boardList.size()={}", boardList.size());
	
	model.addAttribute("boardList",boardList);
	model.addAttribute("pagingInfo",pagingInfo);
		
		return "admin/board/manageBoards";
	}
	
	@ResponseBody
	@RequestMapping("/admin/board/ajaxInsertBoardList")
	public int insertBoardList(@ModelAttribute BoardListVO boardListVo) {
		logger.info("ajax 이용 - 게시판 등록 파라미터, boardListVo={}", boardListVo);
		int cnt=boardListService.insertBoardList(boardListVo);
		logger.info("ajax 이용 - 게시판 등록 결과, cnt={}", cnt);
		return cnt;
	}
	
	@ResponseBody
	@GetMapping("/admin/board/ajaxSelectBoardList")
	public BoardListVO selectBoardList(@RequestParam (defaultValue = "0")int boardlistNo) {
		logger.info("ajax 이용 - 게시판 상세 정보 조회 파라미터, boardlistNo={}", boardlistNo);
		BoardListVO boardlistVo=boardListService.boardListByboardlistNo(boardlistNo);
		logger.info("ajax 이용 - 게시판 상세 정보 조회 결과, boardlistVo={}", boardlistVo);
		
		return boardlistVo;
	}
	
	@ResponseBody
	@RequestMapping("/admin/board/ajaxUpdateBoardList")
	public int updateBoardList(@ModelAttribute BoardListVO boardlistVo) {
		logger.info("ajax 이용 - 게시판 수정처리 파라미터, boardlistVo={}", boardlistVo);
		int cnt=boardListService.updateBoardList(boardlistVo);
		logger.info("ajax 이용 - 게시판 수정처리 결과, cnt={}", cnt);
		return cnt;
	}
	
	
}
