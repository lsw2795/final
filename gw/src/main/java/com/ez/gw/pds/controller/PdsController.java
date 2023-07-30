package com.ez.gw.pds.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ez.gw.pds.model.PdsService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping()
public class PdsController {
	private static final Logger logger=LoggerFactory.getLogger(PdsController.class);
	private final PdsService pdsService;
	
}
