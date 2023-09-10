package com.ez.gw.controller;


import java.time.LocalDate;
import java.time.temporal.ChronoField;
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
public class AdminController {
	private static final Logger logger = LoggerFactory.getLogger(IndexController.class);
	private final EmployeeService empService;

	@RequestMapping("/admin/main")
	public String admin(Model model) {
		logger.info("관리자 페이지 화면 확인");
		
		   // 현재 날짜 가져오기
	    LocalDate currentDate = LocalDate.now();

	    // 현재 날짜로부터 연 중의 몇 번째 날인지 계산 (1부터 시작)
	    int dayOfYear = currentDate.get(ChronoField.DAY_OF_YEAR);

	    // 결과 모델에 추가
	    model.addAttribute("currentDayOfYear", dayOfYear);
	    logger.info("오늘이 날짜중 며칠째? currentDayOfYear={}", dayOfYear);

		int avgSalary = empService.selectAvgSalary(); //평균연봉
		logger.info("평균 연봉 avgSalary={}", avgSalary);
		int allEmpCount = empService.selectAllEmployeeCount(); //총 사원수
		logger.info("총 사원수 allEmpCount={}", allEmpCount);
		int retireCount = empService.selectRetireCount(); //퇴사자 수
		logger.info("연간 퇴사자 수 retireCount={}", retireCount);
		int hiredateCount = empService.selectHiredateCount();//올해 입사자수
		logger.info("연간 입사자 수 hiredateCount={}", hiredateCount);

		model.addAttribute("allEmpCount", allEmpCount); //총 사원수
		model.addAttribute("retireCount", retireCount); //퇴사자 수
		model.addAttribute("hiredateCount", hiredateCount); //입사자 수
		model.addAttribute("avgSalary", avgSalary); //평균연봉

		return "admin/adminIndex";
	}

	@RequestMapping("/admin/login")
	public String adminLogin() {
		logger.info("관리자 로그인 페이지");
		return "login/adminLogin";
	}

	@PostMapping("/admin/login")
	public String adminLogin_post(@RequestParam(defaultValue = "0")int empNo,
			@RequestParam String pwd, 
			@RequestParam(required = false)String split_checkbox,
			HttpServletRequest request, HttpServletResponse response,Model model) {
		//1.
		logger.info("관리자 로그인 처리 페이지");
		//2.
		String result=empService.selctAuthority(empNo);
		logger.info("관리자여부 결과 result={}",result);

		Map<String, Object>map=empService.selectEmpByEmpNo(empNo);
		logger.info("로그인 관리자 서열,직급 map={}",map);

		if(result.equals("N")){
			model.addAttribute("msg", "관리자 권한이 없습니다.");
			model.addAttribute("url","/admin/login");

			return "common/message";

		}else {
			int cnt=empService.loginCheck(pwd, empNo);
			logger.info("로그인 결과 result={}",cnt);

			String msg="로그인 처리 실패", url="/admin/login"; 
			if(cnt==EmployeeService.LOGIN_OK) {
				msg = map.get("NAME") +" 님이 로그인 하셨습니다";
				url = "/admin/main";

				//session
				HttpSession session=request.getSession();
				session.setAttribute("empNo", empNo);

				String authority = (String)map.get("AUTHORITY");
				session.setAttribute("authority",authority);

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
			model.addAttribute("msg", msg); 
			model.addAttribute("url", url);
		}

		//3.
		//4.
		return "common/message";
	}

	@RequestMapping("/admin/logout")
	public String logout(HttpSession session) {
		logger.info("로그아웃");

		session.removeAttribute("empNo");
		session.removeAttribute("authority");

		return "redirect:/admin/login";
	}





}




















