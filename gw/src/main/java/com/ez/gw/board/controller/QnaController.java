package com.ez.gw.board.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ez.gw.board.model.BoardService;
import com.ez.gw.board.model.BoardVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/qna")
public class QnaController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	private final BoardService boardService;
	
	@RequestMapping("/list")
	public String qnaList() {
		//1
		logger.info("qna 목록 페이지");
		//2
		//3
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
	
}
