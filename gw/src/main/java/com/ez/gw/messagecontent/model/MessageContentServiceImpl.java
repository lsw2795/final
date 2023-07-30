package com.ez.gw.messagecontent.model;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MessageContentServiceImpl implements MessageContentService{
	private final MessageContentDAO messageContentDao;
	
	
}
