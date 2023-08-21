package com.ez.gw.calendar.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndViewDefiningException;

import com.ez.gw.calendar.model.CalendarService;
import com.ez.gw.calendar.model.CalendarVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/calendar")
public class CalendarController {
	private static final Logger logger = LoggerFactory.getLogger(CalendarController.class);
	private final CalendarService calendarService;
	
	@RequestMapping("/viewMySchedule")
	public String get_cal() {
		logger.info("캘린더 내 일정관리 화면 보여주기");
		return "calendar/calendar";
	}
	
	@GetMapping("/addSchedule")
	public String get_schedule() {
		logger.info("일정등록 화면 보여주기");
		return "calendar/addCalendar";
	}
	
	@PostMapping("/addSchedule")
	public String post_schedule(@ModelAttribute CalendarVO calVo, HttpSession session) {
		//1
		int empNo = (int)session.getAttribute("empNo");
		logger.info("일정 등록 파라미터 calVo = {}, empNo={}", calVo, empNo);
		
		String getbegindate = calVo.getBegindate();
		String getenddate = calVo.getEnddate();
		
		String begindate = getbegindate.substring(0,10);
		String begintime = getbegindate.substring(10);
		String enddate = getenddate.substring(0,10);
		String endtime = getenddate.substring(10);
		
		
		calVo.setBegindate(begindate);
		calVo.setBegintime(begintime);
		calVo.setEnddate(enddate);
		calVo.setEndtime(endtime);
		calVo.setEmpNo(empNo);
		
		String alldayFlag = calVo.getAlldayFlag();
		
		if(alldayFlag==null || alldayFlag.isEmpty()) {
			alldayFlag = "N";
		}else {
			alldayFlag = "Y";
		}
		calVo.setAlldayFlag(alldayFlag);
		
		
		logger.info("vo setting 후 파라미터 calVo = {}", calVo);
		
		//2
		int cnt = calendarService.insertCalendar(calVo);
		logger.info("일정 등록 결과, cnt = {}", cnt);
		
		//3
		//4
		return "redirect:/calendar/calendar";
	}
	
	@RequestMapping("/fullCalendar")
	public String calendar() {
		logger.info("캘린더 내 일정관리 화면 보여주기");
		return "calendar/fullCalendar";
	}
	
	@RequestMapping("/mySchedule")
	public ModelAndView getCalendarList(ModelAndView mv, HttpServletRequest request) {
		logger.info("내 스케줄 보기");
		String viewpage="/calendar/fullCalendar";
		List<CalendarVO> calendarList=null;
		
		try {
			calendarList = calendarService.calendarList();
			request.setAttribute("calendarList", calendarList);
			logger.info("calendarList.size={}", calendarList.size());
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		mv.setViewName(viewpage);
		return mv;
	}

}
