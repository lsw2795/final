package com.ez.gw.confirm.model;

import lombok.Data;

@Data
public class ConfirmVO {	//전자결재
	private int confirmDocumentNo; // 결재문서번호 NOT NULL(PK)         
	private String confirmTitle;// 제목 NOT NULL  
	private String confirmContent; // 내용 NOT NULL 
	private String credateDate; // 상신일   
	private String updateDate; // 수정일   
	private String reviewDate; // 검토일   
	private String confirmDate; // 확인일   
	private String completeDate; //결재일    
	private String startDate; //시행일    
	private int confirmState; //결재상태(0:예정 1:대기 2:승인 3:반려)          
	private String endDate; //종료일 
	private char delflag; //삭제여부         
	private int empNo; //기안자(EMPLOYEE FK) 
	private int confirmLineNo; //결재라인번호 
	private int documentNo; // 문서양식번호(DOCUMENT FK)       
}
