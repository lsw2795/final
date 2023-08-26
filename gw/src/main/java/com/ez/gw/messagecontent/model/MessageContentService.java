package com.ez.gw.messagecontent.model;

import java.util.List;

public interface MessageContentService {
	int insertMessage(MessageContentVO vo);
	List<Integer> selectAllReader(int empNo);
	MessageViewVO selectLastMessageByReader(MessageViewVO mViewVo);
}
