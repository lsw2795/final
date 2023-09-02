package com.ez.gw.board.controller;

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
import com.ez.gw.common.PaginationInfo;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class deptBoardController {
	private static final Logger logger = LoggerFactory.getLogger(deptBoardController.class);
	private final BoardService boardService;
	private final BoardListService boardListService;
	
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
			@ModelAttribute BoardVO vo, Model model) {
		int empNo=(int)session.getAttribute("empNo");
		vo.setEmpNo(empNo);
		logger.info("부서 게시판 글쓰기 처리 파라미터 vo={}", vo);
		int cnt=boardService.insertDeptBoard(vo);
		logger.info("부서 게시판 글쓰기 처리 결과 cnt={}", cnt);
		String msg="게시글 등록에 실패했습니다.",url="/board/deptBoardWrite?"+vo.getBoardlistNo();
		if(cnt>0) {
			msg="게시글 등록을 완료했습니다.";
			url="/board/deptBoard"; //디테일뷰 열면 바꾸기
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
		logger.info("부서 게시글 상세보기 결과 map={}, boardlistVo={}", map, boardlistVo);
		model.addAttribute("map", map);
		model.addAttribute("boardlistVo", boardlistVo);
		return "board/deptBoardDetail";
	}
	
}
