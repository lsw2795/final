package com.ez.gw.refer.model;

import lombok.Data;

@Data
public class ReferVO { //전자문서참조
	private int referNo; //참조번호
	private int referState; //참조상태
	private String confirmDocumentNo; //결재문서번호
	private int empNo; //참조자(사원번호)
}
