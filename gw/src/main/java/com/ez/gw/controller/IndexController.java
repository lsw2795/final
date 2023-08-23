package com.ez.gw.controller;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ez.gw.employee.model.EmployeeService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class IndexController {
	private static final Logger logger = LoggerFactory.getLogger(IndexController.class);
	
	private final EmployeeService employeeService;
	
	@RequestMapping("/")
	public String index() {
		logger.info("index 페이지 보여주기");
		
		return "login/empLogin";
	}
	
	@RequestMapping("/main")
	public String main(HttpSession session,Model model) {
		logger.info("index 페이지 보여주기");
		int empNo=(int)session.getAttribute("empNo");
		Map<String, Object> empMap = employeeService.selectEmpByEmpNo(empNo);
		
		model.addAttribute("empMap",empMap);
		
		return "indexTest";
	}
}
