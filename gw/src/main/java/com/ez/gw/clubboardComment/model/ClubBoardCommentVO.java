package com.ez.gw.clubboardComment.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class ClubBoardCommentVO {
	private int commentNo; //댓글번호
	private String content; //댓글 번호
	private Timestamp regdate ; //댓글 등록일
	private int groupNo; //그룹번호
	private int step; //댓글단계
	private int sortNo; //정렬순서
	private int secflag; //댓글 공개여부
	private int empNo; //사원번호
	private int boardNo; //게시글 번호
	private int clubNo; // 동호회 번호
}
