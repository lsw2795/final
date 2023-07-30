package com.ez.gw.leave.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ez.gw.leave.model.LeaveService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping()
public class LeaveController {
	private static final Logger logger=LoggerFactory.getLogger(LeaveController.class);
	private final LeaveService leaveService;
	
	
}
