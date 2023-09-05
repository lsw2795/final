package com.ez.gw.club.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class ClubVO {
	private int clubNo; //동호회 번호
	private String title; //동호회명
	private String manager; //동호회장
	private String introduce; //소개
	private String secflag; //공개여부
	private Timestamp regdate; //등록일
	private String memLimitflag; //멤버제한 수 여부
	private int memLimit; //제한인원
	private int empNo; //사원 번호
	
}
