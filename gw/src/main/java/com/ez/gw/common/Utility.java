package com.ez.gw.common;

public class Utility {
	public static String getFileInfo(long fileSize,String originalFileName) {
		String result="";
		double size=fileSize/1024.0; //3.15789
		size=Math.round(size*100)/100.0;
		result=originalFileName+"( "+size+" KB)";

		return result;
	}
	
}