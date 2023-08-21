package com.ez.gw.commute.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ez.gw.commute.model.CommuteService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/commute")
public class CommuteController {
	private static final Logger logger = LoggerFactory.getLogger(CommuteController.class);
	private final CommuteService commuteService;
	
	@GetMapping("/status")
	public String CommutingStatus() {
		//1
		logger.info("근태관리 - 출/퇴근 현황 페이지");
		
		return "commute/commutingStatus";
	}
	
	
	
	
	
}
