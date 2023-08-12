package com.ez.gw.secondhandTradeFile.model;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class SecondhandTradeFileVO {
	 private int fileNo;
	 private String fileName; //업로드파일명 jsp-> Controller 파일 담는 용도
	 private String originalFileName;
	 private long fileSize;
	 private int tradeNo;
}
