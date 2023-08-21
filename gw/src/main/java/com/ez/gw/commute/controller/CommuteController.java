package com.ez.gw.commute.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ez.gw.commute.model.CommuteService;

import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/commute")
public class CommuteController {
	private static final Logger logger = LoggerFactory.getLogger(CommuteController.class);
	private final CommuteService commuteService;
	
	@GetMapping("/status")
	public ModelAndView CommutingStatus(ModelAndView mv, HttpServletRequest request) {
		//1
		int empNo = (int)request.getSession().getAttribute("empNo");
		
		logger.info("근태관리 - 출/퇴근 현황 페이지");
		
		//일정보기
		String viewpage = "commute/commutingStatus";
		
		List<Map<String, Object>> list = commuteService.selectCommuteByEmpNo(empNo);
		request.setAttribute("calendarList", list);
		
		mv.setViewName(viewpage);
		return mv;
		
	}
	
	
	
	
	
	
}
