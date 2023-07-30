package com.ez.gw.confirmFile.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ez.gw.confirmFile.model.ConfirmFileService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping
@RequiredArgsConstructor
public class ConfirmFileController {
	private static final Logger logger = LoggerFactory.getLogger(ConfirmFileController.class);
	private final ConfirmFileService confirmFileService;
}
