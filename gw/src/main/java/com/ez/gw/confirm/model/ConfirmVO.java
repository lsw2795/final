package com.ez.gw.confirm.model;

import lombok.Data;

@Data
public class ConfirmVO {
	private int confirmDocumentNo; // CONFIRM_DOCUMENT_NO NOT NULL NUMBER         
	private String title;// TITLE               NOT NULL VARCHAR2(100)  
	private String content; //CONTENT             NOT NULL VARCHAR2(2000) 
	private String credateDate; //CREDATE_DATE                 VARCHAR2(50)   
	private String updateDate; //UPDATE_DATE                  VARCHAR2(50)   
	private char delflag; //DELFLAG                      CHAR(1)        
	private int confirmState; //CONFIRM_STATE                NUMBER         
	private String completeDate; //COMPLETE_DATE                VARCHAR2(50)   
	private String startDate; //START_DATE                   VARCHAR2(50)   
	private String endDate; //END_DATE                     VARCHAR2(50)   
	private int documentFormNo; //DOCUMENT_FORM_NO             NUMBER         
	private int empNo; //EMP_NO                       NUMBER    
}
