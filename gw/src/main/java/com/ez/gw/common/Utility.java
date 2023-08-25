package com.ez.gw.common;

import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
public class Utility {
	private static final Logger logger = LoggerFactory.getLogger(Utility.class);
	
	public static String getFileInfo(long fileSize,String originalFileName) {
		String result="";
		double size=fileSize/1024.0; //3.15789
		size=Math.round(size*100)/100.0;
		result=originalFileName+"( "+size+" KB)";

		return result;
	}
	
	//24시간 이내 글인지 확인 메서드 24시간 이내일 경우 result:1
	public static int displayNew(Date regdate) {
		Date today = new Date();
		long gap = (today.getTime()-regdate.getTime())/1000;
		gap=gap/(60*60);
		int result=0;
		if(gap<24) {
			result=1;
		}
		return result;
	}
	
}