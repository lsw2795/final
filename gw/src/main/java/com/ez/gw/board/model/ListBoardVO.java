package com.ez.gw.board.model;

import java.util.List;

import lombok.Data;

/*
 * 게시글 다중삭제를 위한 클래스
 */
@Data
public class ListBoardVO {
	private List<BoardVO> boardItems;
}
