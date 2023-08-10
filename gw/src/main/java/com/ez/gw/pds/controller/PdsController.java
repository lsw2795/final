package com.ez.gw.pds.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ez.gw.pds.model.PdsService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/pds")
public class PdsController {
	private static final Logger logger=LoggerFactory.getLogger(PdsController.class);
	private final PdsService pdsService;
	
	@RequestMapping("/")
	public String main() {
		//1
		logger.info("자료실 메인페이지");
		//4
		return "pds/main";
		
	}
	
	@RequestMapping("/detail")
	public String detail() {
		//1
		logger.info("자료실 상세보기 페이지");
		//4
		return "pds/detail";
	}
}
