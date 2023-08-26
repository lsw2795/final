package com.ez.gw.messagecontent.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MessageContentDAO {
	int insertMessage(MessageContentVO vo);
	List<Integer> selectAllReader(int empNo);
	MessageViewVO selectLastMessageByReader(MessageViewVO mViewVo);
}
