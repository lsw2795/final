package com.ez.gw.confirmLine.model;

import lombok.Data;

@Data
public class ConfirmLineVO {
	private int confirmLineNo; //CONFIRM_LINE_NO     NOT NULL NUMBER 
	private int cofirmOrder; //COFIRM_ORDER        NOT NULL NUMBER 
	private int empNo; //EMP_NO                       NUMBER 
	private int confirmDocumentNo; //CONFIRM_DOCUMENT_NO          NUMBER 
}
