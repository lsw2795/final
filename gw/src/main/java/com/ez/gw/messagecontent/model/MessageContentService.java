package com.ez.gw.messagecontent.model;

import java.util.List;

public interface MessageContentService {
	int insertMessage(MessageContentVO vo);
	List<Integer> selectAllReader(int empNo);
	MessageViewVO selectLastMessageByReader(MessageViewVO mViewVo);
	List<MessageViewVO> selectLastMessage(int empNo);
	List<MessageViewVO> selectAllMyMessage(MessageViewVO mViewVo);
	int updateReadDate(MessageViewVO vo);
	int updateDelFlagOrDelete(MessageViewVO vo);
	List<MessageViewVO> selectLastMessage5(int empNo);
	List<Integer> searchSendMessageNo(MessageViewVO vo);
	List<Integer> searchReadMessageNo(MessageViewVO vo);
}
