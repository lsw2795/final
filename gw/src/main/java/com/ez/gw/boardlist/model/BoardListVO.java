package com.ez.gw.boardlist.model;

import lombok.Data;

@Data
public class BoardListVO { //게시판 목록
	private int boardlistNo; //게시판 번호
	private String boardName; //게시판 이름
	private String boardType; //게시판 종류
	private String boardLike; //좋아요 허용여부
	private String commentFlag; //댓글 허용여부
	private String uploadFlag; //업로드 허용여부
	private String secflag; //사원공개 여부
	
}
