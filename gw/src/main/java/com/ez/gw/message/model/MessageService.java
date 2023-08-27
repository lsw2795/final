package com.ez.gw.message.model;

import com.ez.gw.messagecontent.model.MessageViewVO;

public interface MessageService {
	int insertMessage(MessageVO vo);
	int updateDelFlagOrDelete(MessageViewVO vo);
	int newMessage(int reader);
}
