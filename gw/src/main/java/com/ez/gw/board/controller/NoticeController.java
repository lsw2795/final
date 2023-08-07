package com.ez.gw.board.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.ez.gw.board.model.BoardService;
import com.ez.gw.employee.model.EmployeeService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class NoticeController {
	private static final Logger logger=LoggerFactory.getLogger(NoticeController.class);
	
	private final BoardService boardService;
	private final EmployeeService employeeService;
	
	@GetMapping
	public String noticeWrite_get() {
		logger.info("공지사항 작성 페이지 보여주기");
		
		return "admin/board/noticeWrite";
	}
	
	
}
