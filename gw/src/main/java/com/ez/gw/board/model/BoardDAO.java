package com.ez.gw.board.model;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BoardDAO {
	int insertQna(BoardVO vo); //Qna 글등록 메서드
 
}
