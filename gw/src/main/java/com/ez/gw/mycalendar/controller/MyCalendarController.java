package com.ez.gw.mycalendar.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ez.gw.mycalendar.model.MyCalendarService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping()
public class MyCalendarController {
	private static final Logger logger=LoggerFactory.getLogger(MyCalendarController.class);
	private final MyCalendarService myCalendarService;
	
	
}
