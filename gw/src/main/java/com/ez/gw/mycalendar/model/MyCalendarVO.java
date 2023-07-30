package com.ez.gw.mycalendar.model;

import lombok.Data;

@Data
public class MyCalendarVO {
	private int categoryNo; /* 카테고리 번호 */
	private String name; /* 카테고리 이름 */
	private String color; /* 카테고리 색 */
	private int empNo; /* 사원번호 */
}
