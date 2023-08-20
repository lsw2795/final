package com.ez.gw.deptagree.model;

import lombok.Data;

@Data
public class DeptagreeVO { //부서합의
	private int agreementNo; //부서합의번호 NOT NULL(PK)       
	private String deptagreeDate; //부서합의일 
	private int agreementStage; //부서합의상태 NOT NULL(0:예정 1:대기 2:승인 3:반려)       
	private String confirmDocumentNo; //결재문서번호 (CONFIRM FK)       
	private int deptNo; //부서번호 (DEPT FK)
}
