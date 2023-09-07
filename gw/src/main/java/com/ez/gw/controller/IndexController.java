package com.ez.gw.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ez.gw.calendar.model.CalendarService;
import com.ez.gw.calendar.model.CalendarVO;
import com.ez.gw.employee.model.EmployeeService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class IndexController {
	private static final Logger logger = LoggerFactory.getLogger(IndexController.class);
	
	private final EmployeeService employeeService;
	private final CalendarService calendarService;
	
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
	
	@RequestMapping("/indexCalendar")
	public ModelAndView index(ModelAndView mv, HttpServletRequest request, HttpSession session) {
		int empNo = (int)session.getAttribute("empNo");
		logger.info("메인화면 달력 보기, 파라미터 empNo={}", empNo);
		String viewpage="calendar/indexCalendar";
		List<CalendarVO> calendarList=null;
		
		try {
			calendarList = calendarService.calendarList(empNo);
			request.setAttribute("calendarList", calendarList);
			logger.info("calendarList.size={}", calendarList.size());
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		mv.setViewName(viewpage);
		return mv;
	}
	
	@GetMapping("/cosmos")
	public String introduce() {
		return "inc/introduceCosmos";
	}
}
