package com.ez.gw.confirmLine.model;

import lombok.Data;

@Data
public class ConfirmLineVO {	//결재라인
	private int confirmLineNo; //결재라인번호 NOT NULL(PK) 
	private int cofirmOrder; //결재순서 NOT NULL 
	private int empNo; //결재자(사원번호) (EMPLOYEE FK)    
	private int confirmDocumentNo; //결재문서 번호 (CONFIRM FK)
	
}
