package com.ez.gw.reman.model;

import java.security.Timestamp;

import lombok.Data;

@Data
public class RemanVO {  //자원관리
	private int remanNo; //자원번호
	private String category; //자원분류
	private String name; //자원명
	private String discription; //자원설명
	private Timestamp regdate; //자원등록일
	private int state; //자원상태
}
