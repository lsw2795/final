package com.ez.gw.employee.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ez.gw.employee.model.EmployeeService;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/login")
public class LoginController {
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	private final EmployeeService empService;
	
	@RequestMapping("/empLogin")
	public String loginEmp() {
		//1.
		logger.info("사원 로그인 페이지");
		return "/login/empLogin";
	}

	@RequestMapping("/empForgotPwd")
	public String pwdForgot() {
		//1.
		logger.info("사원 비밀번호 찾기 페이지");
		return "/login/empForgotPwd";
	}
	
	@PostMapping("/empLogin")
	public String logiEmp_post(@RequestParam int empNo, @RequestParam String pwd, 
			@RequestParam(required = false)String split_checkbox,
			HttpServletRequest request, HttpServletResponse response, Model model) {
		//1.
		logger.info("로그인 처리 페이지,파라미터 empNo={},pwd={},split_checkbox={}",empNo,pwd,split_checkbox);
		
		//2.
		int result=empService.loginCheck(pwd, empNo);
		logger.info("로그인 결과 result={}",result);
		
		String msg="로그인 처리 실패", url="/login/empLogin"; 
		if(result==EmployeeService.LOGIN_OK) {
			msg=empNo+"님이 로그인 하셨습니다";
			url="/";
			
			//session
			HttpSession session=request.getSession();
			session.setAttribute("empNo", empNo);
			
			//cookie
			String empNo2=Integer.toString(empNo);
			Cookie ck = new Cookie("ck_empNo", empNo2);
			ck.setPath("/");
			
			if(split_checkbox!=null) { //쿠키 저장한 경우
				ck.setMaxAge(1000*24*60*60); //1000일
				response.addCookie(ck);
			}else {
				ck.setMaxAge(0); //쿠키 제거
				response.addCookie(ck);
			}
			
		}else if(result==EmployeeService.PWD_DISAGREE) {
			msg="비밀번호가 일치하지 않습니다.";
		}else if(result==EmployeeService.EMPNO_NONE){
			msg="해당 사원번호는 존재하지 않습니다.";
		}
		
		//3.
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		//4.
		return "common/message";
		
	}
	
	
	
	
}
