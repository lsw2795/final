package com.ez.gw.comments.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class CommentsVO {
	private int commentNo; //댓글 번호
	private String content; //댓글 본문
	private Timestamp regdate; //댓글 등록일
	private int groupNo; //그룹번호
	private int step; //댓글 단계
	private int sortNo; //정렬순서
	private String secflag; //댓글 공개여부
	private int empNo; //사원번호
	private int boardlistNo; //게시판번호
	private int boardNo; //게시글번호
	private int reportStatus; //신고상태
}
