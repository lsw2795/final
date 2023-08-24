package com.ez.gw.commute.model;

import lombok.Data;

@Data
public class CommuteVO {
	private int commuteNo; //근태관리 번호
	private String workIn; //출근시간
	private String workOut; //퇴근시간
	private int commuteState; //근태상태 0:정상출근 1:지각 2:연차 3:반차 4:외출 5:조퇴 6:출장
	private int empNo; //사원번호
	
	
}
