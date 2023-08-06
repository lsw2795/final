package com.ez.gw.calendar.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ez.gw.calendar.model.CalendarService;
import com.ez.gw.calendar.model.CalendarVO;

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
	public String post_schedule(@ModelAttribute CalendarVO calVo) {
		//1
		logger.info("일정 등록 파라미터 calVo = {}", calVo);
		
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

}
