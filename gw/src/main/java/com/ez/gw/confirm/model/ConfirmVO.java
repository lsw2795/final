package com.ez.gw.confirm.model;

import lombok.Data;

@Data
public class ConfirmVO {	//전자결재
	private int confirmDocumentNo; // 결재문서번호 NOT NULL(PK)         
	private String title;// 제목 NOT NULL  
	private String content; // 내용 NOT NULL 
	private String credateDate; // 상신일   
	private String updateDate; // 수정일   
	private char delflag; //삭제여부         
	private int confirmState; //결재상태(0:예정 1:대기 2:승인 3:반려)          
	private String completeDate; //결재일    
	private String startDate; //시행일    
	private String endDate; //종료일 
	private int documentFormNo; // 문서양식번호(DOCUMENT FK)       
	private int empNo; //사원번호(EMPLOYEE FK)                      NUMBER    
}
