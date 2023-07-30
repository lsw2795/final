package com.ez.gw.comment.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ez.gw.comment.model.CommentService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping
public class CommentController {
	 private static final Logger logger = LoggerFactory.getLogger(CommentController.class);
	 private final CommentService commentService;
}
