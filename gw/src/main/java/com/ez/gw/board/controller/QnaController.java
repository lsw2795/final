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
import com.ez.gw.common.SearchVO;
import com.ez.gw.employee.model.EmployeeService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/qna")
public class QnaController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	private final BoardService boardService;
	private final EmployeeService employeeService;
	
	@RequestMapping("/list")
	public String qnaList(@ModelAttribute SearchVO searchVo, Model model) {
		//1
		logger.info("qna 목록 페이지");
		
		//2
		List<Map<String, Object>> list = boardService.selectQnaAll(searchVo);
		logger.info("qna 전체 조회 결과, list.size={}", list.size());
		
		//3
		model.addAttribute("list", list);
		//4
		return "qna/list";
	}
	
	@GetMapping("/write")
	public String qnaWrite_get() {
		//1 
		logger.info("qna 등록 페이지");
		//2
		//3
		
		//4
		return "qna/write";
	}
	
	@PostMapping("/write")
	public String qnaWrite_post(@ModelAttribute BoardVO vo, Model model) {
		//1
		logger.info("qna 등록, 파라미터 vo={}", vo);
		//2
		int cnt = boardService.insertQna(vo);
		logger.info("qna 등록 결과, cnt={}", cnt);
		
		String msg = "질문 등록에 실패하였습니다.", url = "/qna/list";
		if(cnt>0) {
			msg = "질문이 등록되었습니다.";
		}
		//3
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		//4
		return "common/message";
		
	}
	
	@RequestMapping("/detail")
	public String qnaDetail(@RequestParam(defaultValue = "0") int boardNo, Model model) {
		//1
		logger.info("qna 글 상세보기 페이지, 파라미터 boardNo={}", boardNo);
		
		if(boardNo==0) {
			model.addAttribute("msg", "잘못된 경로입니다.");
			model.addAttribute("url", "/qna/list");
			
			return "common/message";
		}
		
		//2
		boardService.updateReadcount(boardNo); //조회수 증가
		
		Map<String, Object> map = boardService.selectQna(boardNo);
		logger.info("qna 글 상세조회 결과, map={}", map);
		
		//3
		model.addAttribute("map", map);
		
		//4
		return "qna/detail";
	}
	
}
