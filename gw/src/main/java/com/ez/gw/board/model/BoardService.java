package com.ez.gw.board.model;

import java.util.List;

public interface BoardService {
	int insertQna(BoardVO vo);
	List<BoardVO> selectQnaAll();
	BoardVO selectQna(int boardNo);
}
