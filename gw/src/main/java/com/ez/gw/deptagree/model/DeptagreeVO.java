package com.ez.gw.deptagree.model;

import lombok.Data;

@Data
public class DeptagreeVO {
	private int agreementNo; //AGREEMENT_NO        NOT NULL NUMBER       
	private int agreementStaage; //AGREEMENT_STATE     NOT NULL NUMBER       
	private String deptagreeDate; //DEPTAGREE_DATE               VARCHAR2(50) 
	private int confirmDocumentNo; //CONFIRM_DOCUMENT_NO          NUMBER       
	private int deptNo; //DEPT_NO             NOT NULL NUMBER
}
