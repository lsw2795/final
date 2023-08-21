package com.ez.gw.commute.model;

import lombok.Data;

@Data
public class CommuteVO {
	private int commuteNo; //근태관리 번호
	private String workIn; //출근시간
	private String workOut; //퇴근시간
	private int commuteState; //근태 상태
	private int empNo; //사원번호
	
	
}
