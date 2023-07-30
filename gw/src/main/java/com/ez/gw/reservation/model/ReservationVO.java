package com.ez.gw.reservation.model;

import java.security.Timestamp;

import lombok.Data;

@Data
public class ReservationVO { //자원예약
	private int reservationNo; //자원예약번호
	private int remanNo; //자원번호
	private String beginDate; //자원예약시작일
	private String endDate; //자원예약종료일
	private String content; //자원예약내용
	private String agreeFlag; //자원승인여부
	private Timestamp regdate; //자원예약일
	private int empNo; //사원번호
	private int deptNo; //부서번호
}
