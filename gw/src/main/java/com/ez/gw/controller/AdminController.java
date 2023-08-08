package com.ez.gw.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ez.gw.employee.model.EmployeeService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class AdminController {
	private static final Logger logger = LoggerFactory.getLogger(IndexController.class);
	private final EmployeeService empService;
	
	@RequestMapping("/admin")
	public String admin() {
		logger.info("관리자 페이지 화면 확인");
		
		return "admin/adminIndex";
	}
	
	@RequestMapping("/login/adminLogin")
	public String adminLogin() {
		logger.info("관리자 로그인 페이지");
		return "login/adminLogin";
	}
	
	@PostMapping("/login/adminLogin")
	public String adminLogin_post(@RequestParam(defaultValue = "0")int empNo, Model model) {
		//1.
		logger.info("관리자 로그인 처리 페이지");
		//2.
		String result=empService.selctAuthority(empNo);
		logger.info("관리자 로그인 결과 result={}",result);
		
		int cnt=0;
		String msg="관리자 로그인 실패", url="/login/adminLogin";
		if(cnt==EmployeeService.IS_ADMIN) {
			msg=empNo+"님이 로그인 하셨습니다";
			url="/";
			
		}else if(cnt==EmployeeService.NOT_ADMIN) {
			msg="관리자 권한이 없습니다.";
		}else if(cnt==EmployeeService.ADMIN_NONE) {
			msg="해당 번호는 존재하지 않습니다.";
		}
		
		//3.
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		//4.
		return "common/message";
		
	}
	
	
	
	
	
}




















