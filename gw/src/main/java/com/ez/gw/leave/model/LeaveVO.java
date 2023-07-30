package com.ez.gw.leave.model;

import java.sql.Timestamp;

import lombok.Data;
@Data
public class LeaveVO {
	private int useno; /* 연차사용번호 */
	private Timestamp usedate; /* 연차사용일 */
	private int type; /* 연차 유형 */
	private String reason; /* 연차사유 */
	private int annualNo; /* 연차번호 */
	private int remainLeavecount; /* 남은연차 */
	private int empNo; /* 사원번호 */
}
