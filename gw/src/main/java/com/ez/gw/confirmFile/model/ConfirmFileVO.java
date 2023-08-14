package com.ez.gw.confirmFile.model;

import lombok.Data;

@Data
public class ConfirmFileVO { //결재파일
	private int confirmFileNo; //결재파일번호 NOT NULL(PK)        
	private String fileName; //업로드파일명                     
	private long fileSize; //파일 사이즈        
	private String originalFileName; //원본파일명  
	private String confirmDocumentNo; //결재문서번호(CONFIRM FK)  
}
