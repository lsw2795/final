package com.ez.gw.boardlist.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ez.gw.boardlist.model.BoardListService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("")
public class BoardListController {
	private static final Logger logger = LoggerFactory.getLogger(BoardListController.class);
	private final BoardListService boardListService;
	
}
