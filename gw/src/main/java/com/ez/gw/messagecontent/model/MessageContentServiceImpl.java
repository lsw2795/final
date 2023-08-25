package com.ez.gw.messagecontent.model;

import java.util.List;

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

	@Override
	public List<Integer> selectAllReader(int empNo) {
		return messageContentDao.selectAllReader(empNo);
	}

	@Override
	public MessageViewVO selectLastMessageByReader(MessageViewVO mViewVo) {
		return messageContentDao.selectLastMessageByReader(mViewVo);
	}
	
	
}
