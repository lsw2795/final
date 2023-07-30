package com.ez.gw.board.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class BoardVO { //게시글목록
	private int boardNo; //게시글번호
	private int empNo; //사원번호
	private int boardlistNo; //게시판번호
	private String title; //게시글제목
	private String content; //게시글본문
	private int readcount; //조회수
	private Timestamp regdate; //게시글 등록일
	private String delflag; //삭제여부
	private int groupNo; //그룹번호
	private int step; //게시글단계
	private int sortNo; //정렬순서
}
