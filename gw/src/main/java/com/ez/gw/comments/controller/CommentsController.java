package com.ez.gw.comments.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ez.gw.comments.model.CommentsService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping
public class CommentsController {
	 private static final Logger logger = LoggerFactory.getLogger(CommentsController.class);
	 private final CommentsService commentsService;
}
