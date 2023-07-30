package com.ez.gw.club.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ez.gw.club.model.ClubService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping
public class ClubController {
	private static final Logger logger = LoggerFactory.getLogger(ClubController.class);
	private final ClubService clubService;
	
	
}
