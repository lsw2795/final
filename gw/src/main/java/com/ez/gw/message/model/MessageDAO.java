package com.ez.gw.message.model;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MessageDAO {
	int insertMessage(MessageVO vo);
}
