package com.ez.gw.commute.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ez.gw.commute.model.CommuteService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping
public class CommuteController {
	private static final Logger logger = LoggerFactory.getLogger(CommuteController.class);
	private final CommuteService commuteService;
}
