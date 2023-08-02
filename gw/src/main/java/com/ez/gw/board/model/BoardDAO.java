package com.ez.gw.board.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BoardDAO {
	int insertQna(BoardVO vo); //Qna 글등록 메서드
	List<BoardVO> selectQnaAll(); //Qna 글 리스트 목록 조회 메서드
	BoardVO selectQna(int boardNo); //qna 글 1개 디테일 조회 메서드
 
}
