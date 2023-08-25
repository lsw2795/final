package com.ez.gw.messagecontent.model;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MessageContentServiceImpl implements MessageContentService{
	private final MessageContentDAO messageContentDao;
	
	@Override
	public int insertMessage(MessageContentVO vo) {
		return messageContentDao.insertMessage(vo);
	}
	
	
}
