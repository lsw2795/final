package com.ez.gw.messagecontent.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ez.gw.messagecontent.model.MessageContentService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping()
public class MessageContentController {
	private static final Logger logger=LoggerFactory.getLogger(MessageContentController.class);
	private final MessageContentService messageContentService;
	
	
}
