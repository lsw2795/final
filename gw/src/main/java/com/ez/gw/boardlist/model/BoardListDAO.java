package com.ez.gw.boardlist.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BoardListDAO {
	List<BoardListVO> selectBoardList(); //게시판 목록 조회
}
