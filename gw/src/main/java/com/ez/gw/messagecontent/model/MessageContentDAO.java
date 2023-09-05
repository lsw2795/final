package com.ez.gw.messagecontent.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MessageContentDAO {
	int insertMessage(MessageContentVO vo);
	List<Integer> selectAllReader(int empNo);
	MessageViewVO selectLastMessageByReader(MessageViewVO mViewVo);
	List<MessageViewVO> selectLastMessage(int empNo);
	List<MessageViewVO> selectAllMyMessage(MessageViewVO mViewVo);
	int updateReadDate(MessageViewVO vo);
	int updateSendDelFlag(MessageViewVO vo);
	int searchDeleteMessage(MessageViewVO vo);
	int deleteMessage(int messageNo);
	List<MessageViewVO> selectLastMessage5(int empNo);
	List<Integer> searchSendMessageNo(MessageViewVO vo);
	List<Integer> searchReadMessageNo(MessageViewVO vo);
}
