package com.ez.gw.board.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ez.gw.board.model.BoardService;
import com.ez.gw.board.model.BoardVO;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class BoardController {	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	private final BoardService boardService;
	
	@RequestMapping("/mypage/myWritingList")
	public String myWritingList(HttpSession session,Model model) {
		int empNo=(int)session.getAttribute("empNo");
		logger.info("내가 쓴 게시글 페이지 파라미터 empNo={}", empNo);
		
		List<Map<String, Object>> boardList=boardService.selectByEmpNo(empNo);
		logger.info("내가 쓴 게시글 목록 조회 결과 boardList.size()={}", boardList.size());
		
		model.addAttribute("boardList", boardList);
		return "mypage/myWritingList";
	}
}
