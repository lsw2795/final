package com.ez.gw.confirmLine.model;

import lombok.Data;

@Data
public class ConfirmLineVO {	//결재라인
	private int confirmLineNo; //결재라인번호 NOT NULL(PK) 
	private int confirm1; //검토자(사원번호) 
	private int confirm2; //확인자(사원번호)
	private int confirm3; //승인자(사원번호)
	private int constructor; //결재라인생성자(사원번호)
}
