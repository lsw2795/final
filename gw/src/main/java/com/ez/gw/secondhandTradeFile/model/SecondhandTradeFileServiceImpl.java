package com.ez.gw.secondhandTradeFile.model;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class SecondhandTradeFileServiceImpl {
	private static final Logger logger = LoggerFactory.getLogger(SecondhandTradeFileServiceImpl.class);
	private final SecondhandTradeFileDAO secondhandTradeFileDao;
	
	
}
