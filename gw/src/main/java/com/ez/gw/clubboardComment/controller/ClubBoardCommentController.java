package com.ez.gw.clubboardComment.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ez.gw.clubboardComment.model.ClubBoardCommentService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping
public class ClubBoardCommentController {
	 private static final Logger logger = LoggerFactory.getLogger(ClubBoardCommentController.class);
	 private final ClubBoardCommentService clubboardCommentService;
	 
}
