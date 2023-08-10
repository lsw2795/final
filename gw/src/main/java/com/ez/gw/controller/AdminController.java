package com.ez.gw.controller;

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
	public String adminLogin_post(@RequestParam(defaultValue = "0")int empNo,
			@RequestParam String pwd, 
			@RequestParam(required = false)String split_checkbox,
			HttpServletRequest request, HttpServletResponse response,Model model) {
		//1.
		logger.info("관리자 로그인 처리 페이지");
		//2.
		String result=empService.selctAuthority(empNo);
		logger.info("관리자여부 결과 result={}",result);
		
		if(result.equals("N")){
			model.addAttribute("msg", "관리자 권한이 없습니다.");
			model.addAttribute("url","/login/adminLogin");
			
			return "common/message";
			
		}else {
			int cnt=empService.loginCheck(pwd, empNo);
			logger.info("로그인 결과 result={}",result);
			
			String msg="로그인 처리 실패", url="/login/adminLogin"; 
			if(cnt==EmployeeService.LOGIN_OK) {
				msg=empNo+"님이 로그인 하셨습니다";
				url="/";
				
				//session
				HttpSession session=request.getSession();
				session.setAttribute("empNo", empNo);
				
				//cookie
				String empNo2=Integer.toString(empNo);
				Cookie ck = new Cookie("ck_empNo", empNo2);
				ck.setPath("/admin");
				
				if(split_checkbox!=null) { //쿠키 저장한 경우
					ck.setMaxAge(1000*24*60*60); //1000일
					response.addCookie(ck);
				}else {
					ck.setMaxAge(0); //쿠키 제거
					response.addCookie(ck);
				}
				
			}else if(cnt==EmployeeService.PWD_DISAGREE) {
				msg="비밀번호가 일치하지 않습니다.";
			}else if(cnt==EmployeeService.EMPNO_NONE){
				msg="해당 사원번호는 존재하지 않습니다.";
			}
		}
		
		
		
		
		
		
		
		//3.
		/*
		 * model.addAttribute("msg", msg); model.addAttribute("url", url);
		 */
		//4.
		return "common/message";
		
	}
	
	
	
	
	
}




















