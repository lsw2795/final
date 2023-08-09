package com.ez.gw.clubboard.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ez.gw.clubboard.model.ClubBoardService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/club")
public class ClubBoardController {
	private static final Logger logger = LoggerFactory.getLogger(ClubBoardController.class);
	private final ClubBoardService clubBoardService;
	
	@RequestMapping("/createClub")
	public String clubWrite() {
		logger.info("동호회 개설 페이지");
		return "club/createClub";
	}
	
	
	
	
	
}

























