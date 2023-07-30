package com.ez.gw.clubboard.model;

import lombok.Data;

@Data
public class ClubBoardVO {
	private int boardNo; //게시글 번호
	private int clubNo; //동호회 번호
	private int empNo; //사원 번호
	private String title; //게시글 제목
	private String content; //내용
	private String regdate; //등록일
	private int readcount; //조회수
	private int boardListNo; //게시글목록 번호?
	
}
