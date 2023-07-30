package com.ez.gw.agreement.model;

import lombok.Data;

@Data
public class AgreementVO { //전자문서합의
	private int agreementNo; //합의번호
	private int agreementState; //합의상태
	private String agreementDate; //합의일
	private String agreementContent; //합의내용
	private int confirmDocumentNo; //결재문서번호
	private int empNo; //합의자(사원번호)

}
