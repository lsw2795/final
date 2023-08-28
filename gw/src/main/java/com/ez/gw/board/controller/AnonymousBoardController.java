package com.ez.gw.board.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ez.gw.board.model.BoardService;
import com.ez.gw.boardlist.model.BoardListService;
import com.ez.gw.common.EmpSearchVO;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/anonymous")
public class AnonymousBoardController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	private final BoardService boardService;
	private final BoardListService boardListService;
	
	@RequestMapping("/boardList")
	public String anonymousBoardList() {
		
		return "anonymousBoard/anonymousBoardList";
	}
}
