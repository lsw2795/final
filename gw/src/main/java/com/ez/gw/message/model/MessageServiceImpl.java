package com.ez.gw.message.model;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MessageServiceImpl implements MessageService{
	private final MessageDAO messageDao;
	
	@Override
	public int insertMessage(MessageVO vo) {
		return messageDao.insertMessage(vo);
	}
}
