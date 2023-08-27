package com.ez.gw.message.model;

import org.apache.ibatis.annotations.Mapper;

import com.ez.gw.messagecontent.model.MessageViewVO;

@Mapper
public interface MessageDAO {
	int insertMessage(MessageVO vo);
	int updateDelFlag(MessageViewVO vo);
	int searchDeleteMessage(MessageViewVO vo);
	int deleteMessage(MessageViewVO vo);
	int newMessage(int reader);
}
