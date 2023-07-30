package com.ez.gw.annual.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ez.gw.annual.model.AnnualService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("")
public class AnnualController {
	private static final Logger logger = LoggerFactory.getLogger(AnnualController.class);
	private final AnnualService annualService; 
	
	
}
