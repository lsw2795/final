package com.ez.gw.confirmLine.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ez.gw.confirm.controller.ConfirmController;
import com.ez.gw.confirmLine.model.ConfirmLineService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping
@RequiredArgsConstructor
public class ConfirmLineController {
	private static final Logger logger = LoggerFactory.getLogger(ConfirmLineController.class);
	private final ConfirmLineService confirmLineService;
}
