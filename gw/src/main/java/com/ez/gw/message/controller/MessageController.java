package com.ez.gw.message.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ez.gw.message.model.MessageService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping()
public class MessageController {
	private static final Logger logger=LoggerFactory.getLogger(MessageController.class);
	private final MessageService messageService;
	
}
