package com.ez.gw.message.model;

import org.springframework.stereotype.Service;

import com.ez.gw.messagecontent.model.MessageViewVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MessageServiceImpl implements MessageService{
	private final MessageDAO messageDao;
	
	@Override
	public int insertMessage(MessageVO vo) {
		return messageDao.insertMessage(vo);
	}

	@Override
	public int updateDelFlagOrDelete(MessageViewVO vo) {
		int delCnt=messageDao.searchDeleteMessage(vo);
		int cnt=0;
		
		if(delCnt==0) {
			cnt=messageDao.deleteMessage(vo);
		}else {
			cnt=messageDao.updateDelFlag(vo);
		}
		return cnt;
	}

	@Override
	public int newMessage(int reader) {
		return messageDao.newMessage(reader);
	}
}
