package com.ez.gw.employee.controller;

import java.util.List;
import java.util.Map;

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
	
	@PostMapping("/empLogin")
	public String logiEmp_post(@RequestParam int empNo, @RequestParam String pwd, 
			@RequestParam(required = false)String split_checkbox,
			@RequestParam(required = false)String retiredate,
			HttpServletRequest request, HttpServletResponse response, Model model) {
		//1.
		logger.info("로그인 처리 페이지,파라미터 empNo={},pwd={},"
				+ "split_checkbox={}",empNo,pwd,split_checkbox);
		
		//2.
		List<Integer> retireList=empService.selectRetire();
		logger.info("퇴사자 로그인 결과 retireList={}",retireList.size());
		
		for(Integer retireNo : retireList) {
			if(retireNo==empNo) {
				model.addAttribute("msg", "퇴사자입니다.");				
				model.addAttribute("url", "/");				
				return "common/message";
			}
		}
		
		int result=empService.loginCheck(pwd, empNo);
		logger.info("로그인 결과 result={}",result);
		
		Map<String, Object>map=empService.selectEmpByEmpNo(empNo);
		logger.info("로그인 사원 서열,직급 map={}",map);
		
		Integer clubNo=empService.selectByClubNo(empNo);
		logger.info("동호회 가입번호 clubNo={}",clubNo);
		
		if(clubNo==null) {
			clubNo = 0;
		}
		
		String msg="로그인 처리 실패", url="/"; 
		if(result==EmployeeService.LOGIN_OK) {
			msg= map.get("NAME") +" 님이 로그인 하셨습니다";
			url="/main";
			
			//session
			HttpSession session=request.getSession();
			session.setMaxInactiveInterval(-1); // 무제한 세션 유지
			session.setAttribute("empNo", empNo);
			
			//직위,권한 세션 저장
			session.setAttribute("positionRank",map.get("POSITION_RANK"));
			session.setAttribute("clubNo", clubNo); //동호회 번호 저장
			
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
		model.addAttribute("map",map);
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		//4.
		return "common/message";
		
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		logger.info("로그아웃");
		
		String isAuthority=(String)session.getAttribute("authority");
		logger.info("로그아웃시 관리자 여부 조회 isAuthority={}", isAuthority);
		
		String url = "";
		if(isAuthority!=null) {
			session.removeAttribute("authority");
			url = "redirect:/admin/login";
		}else {
			url = "redirect:/"; //사원 로그인 창으로
		}
		
		session.removeAttribute("empNo");
		session.removeAttribute("positionRank");
		
		return url;
	}
	
	
}