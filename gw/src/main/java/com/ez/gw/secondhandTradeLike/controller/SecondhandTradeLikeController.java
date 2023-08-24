package com.ez.gw.secondhandTradeLike.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;

import com.ez.gw.secondhandTradeLike.model.SecondhandTradeLikeService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class SecondhandTradeLikeController {
	private static final Logger logger = LoggerFactory.getLogger(SecondhandTradeLikeController.class);
	private final SecondhandTradeLikeService secondLikeService;
	
	 
}
