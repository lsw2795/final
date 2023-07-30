package com.ez.gw.shtComment.model;

import java.security.Timestamp;

import lombok.Data;

@Data
public class ShtCommentVO { //중고거래댓글
	private int commentNo; //댓글번호
	private String content; //댓글내용
	private Timestamp regdate; //댓글등록일
	private int groupNo; //그룹번호
	private int step; //댓글단계
	private int sortNo; //정렬순서
	private String secFlag; //댓글공개여부
	private int tradeNo; //중고거래번호
	private int empNo; //사원번호
}
