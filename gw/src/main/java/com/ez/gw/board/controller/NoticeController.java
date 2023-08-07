package com.ez.gw.board.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.ez.gw.board.model.BoardService;
import com.ez.gw.board.model.BoardVO;
import com.ez.gw.employee.model.EmployeeService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class NoticeController {
	private static final Logger logger=LoggerFactory.getLogger(NoticeController.class);
	
	private final BoardService boardService;
	private final EmployeeService employeeService;
	
	@GetMapping("/admin/board/noticeWrite")
	public String noticeWrite_get() {
		logger.info("공지사항 글쓰기 페이지 보여주기");
		
		return "admin/board/noticeWrite";
	}
	
	@PostMapping("/admin/board/noticeWrite")
	public String noticeWrite_post(@ModelAttribute BoardVO vo, Model model) {
		//1
		logger.info("공지사항 글쓰기 페이지, 파라미터 vo={}", vo);
		
		//2
		int cnt=boardService.insertNotice(vo);
		String msg="공지사항 등록에 실패했습니다.",url="/admin/board/noticeWrite";
		if(cnt>0) {
			msg="공지사항 등록이 완료되었습니다.";
			url="/admin/board/noticeDetail";
		}
		//3
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		//4
		return "common/message";
	}
	
}
