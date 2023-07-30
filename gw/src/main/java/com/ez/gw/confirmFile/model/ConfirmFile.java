package com.ez.gw.confirmFile.model;

import lombok.Data;

@Data
public class ConfirmFile {
	private int comfirmFileNo; //CONFRIM_FILE_NO     NOT NULL NUMBER        
	private String fileName; //FILENAME                     VARCHAR2(100) 
	private long fileSize; //FILESIZE                     NUMBER        
	private String originalFileName; //ORIGINALFILENAME             VARCHAR2(100) 
	private int confirmDocumentNo;  //CONFIRM_DOCUMENT_NO          NUMBER 
}
