package com.ez.gw.calendar.model;

import lombok.Data;

@Data
public class CalendarVO { //캘린더
	private int calendarNo; //캘린더 번호
	private String title; //캘린더 제목
	private String begindate; //시작일
	private String enddate; //종료일
	private String begintime; //시작시간
	private String endtime; //종료시간
	private String alldayFlag; //종일여부
	private String place; //장소
	private String content; //내용
	private int categoryNo; //카테고리 번호
	private int empNo; //사원번호

}
