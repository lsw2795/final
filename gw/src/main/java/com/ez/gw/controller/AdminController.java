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
@RequestMapping("/admin")
public class AdminController {
	private static final Logger logger = LoggerFactory.getLogger(IndexController.class);
	private final EmployeeService empService;
	
	@RequestMapping("/admin")
	public String admin() {
		logger.info("관리자 페이지 화면 확인");
		
		return "admin/adminIndex";
	}
	
	@RequestMapping("/adminLogin")
	public String adminLogin() {
		logger.info("관리자 로그인 페이지");
		return "admin/adminLogin";
	}
	
	@PostMapping("/adminLogin")
	public String adminLogin_post(@RequestParam(defaultValue = "0")int empNo, Model model) {
		//1.
		logger.info("관리자 로그인 처리 페이지");
		//2.
		String result=empService.selctAuthority(empNo);
		
		//3.
		
		//4.
		return "";
		
		
	}
	
	
}




















