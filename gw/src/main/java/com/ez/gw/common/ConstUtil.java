package com.ez.gw.common;

import java.util.Date;

public interface ConstUtil {
	//게시판 페이징 처리 관련 상수
	public static final int RECORD_COUNT=10;
	public static final int MARKET_COUNT=5;
	public static final int CONFIRM_RECORD_COUNT=10;
	public static final int ADMIN_RECORD_COUNT=7;
	int BLOCK_SIZE=10;
	int MARKET_BLOCK_SIZE=5;
	int ADMIN_FORMLIST_BLOCK_SIZE=5;
	
	//파일 업로드 처리 관련 상수
	String FILE_UPLOAD_TYPE = "test";
	//String FILE_UPLOAD_TYPE = "deploy";
	
	//전자결재 파일 저장 경로
	String CONFIRMFILE_UPLOAD_PATH = "confirmfile_upload";
	String CONFIRMFILE_UPLOAD_PATH_TEST = "confirmfile_upload";
	
	//자료실 파일 저장 경로
	String FILE_UPLOAD_PATH = "pds_upload";
	
	//중고거래 파일 저장 경로
	String MARKET_UPLOAD_PATH="upload";
	String MARKET_UPLOAD_PATH_TEST="/market/upload";
	
	//동호회 파일 저장 경로
	String CLUB_UPLOAD_PATH="pds_upload";
	
	//집
	//String FILE_UPLOAD_PATH_TEST = "C:\\Users\\pc\\git\\final\\gw\\src\\main\\webapp\\pds_upload";
	//String FILE_UPLOAD_PATH_TEST = "C:\\Users\\Desktop\\git\\final4\\gw\\src\\main\\webapp\\pds_upload";
	//String FILE_UPLOAD_PATH_TEST = "C:\\Users\\wkdqh\\git\\final\\gw\\src\\main\\webapp\\pds_upload"; 
	
	//학원
	//String FILE_UPLOAD_PATH_TEST = "C:\\Users\\ezen\\git\\final\\gw\\src\\main\\webapp\\pds_upload";
	String FILE_UPLOAD_PATH_TEST = "pds_upload";
	
	//관리자 페이지 - 사원 이미지 저장 경로
	String IMAGE_FILE_UPLOAD_PATH = "images";
	//String IMAGE_FILE_UPLOAD_PATH_TEST = "D:\\lecture\\workspace_list\\sp_final_ws\\final\\gw\\src\\main\\webapp\\images";
	//String IMAGE_FILE_UPLOAD_PATH_TEST="C:\\Users\\Desktop\\git\\final4\\gw\\src\\main\\webapp\\images";
	String IMAGE_FILE_UPLOAD_PATH_TEST = "images";
	//String IMAGE_FILE_UPLOAD_PATH_TEST="C:\\Users\\Desktop\\git\\final4\\gw\\src\\main\\webapp\\images";
	//String IMAGE_FILE_UPLOAD_PATH_TEST = "C:\\Users\\ezen\\git\\final\\gw\\src\\main\\webapp\\images";
	//String IMAGE_FILE_UPLOAD_PATH_TEST = "D:\\lecture\\workspace_list\\final_ws\\final\\gw\\src\\main\\webapp\\images";  채영
	
	//관리자 페이지 - 공지사항 자료실 이용한 파일 저장 경로
	String NOTICE_FILE_UPLOAD_PATH="pds_upload";
	//String NOTICE_FILE_UPLOAD_PATH_TEST="D:\\lecture\\workspace_list\\sp_final_ws\\final\\gw\\src\\main\\webapp\\pds_upload";
	//String NOTICE_FILE_UPLOAD_PATH_TEST="C:\\Users\\Desktop\\git\\final4\\gw\\src\\main\\webapp\\pds_upload";
	String NOTICE_FILE_UPLOAD_PATH_TEST="pds_upload";
	//String NOTICE_FILE_UPLOAD_PATH_TEST="D:\\lecture\\workspace_list\\sp_final_ws\\final\\gw\\src\\main\\webapp\\pds_upload";
	//String NOTICE_FILE_UPLOAD_PATH_TEST="C:\\Users\\Desktop\\git\\final4\\gw\\src\\main\\webapp\\pds_upload";
	
	
	//자료실 업로드인지, 상품 등록시 업로드인지 구분값
	int UPLOAD_FILE_FLAG = 1;  //자료실 업로드
	int UPLOAD_IMAGE_FLAG = 2; //사원 등록시 이미지 업로드
	int CONFIRMFILE_FLAG = 3;  //전자결재 업로드
	int UPLOAD_NOTICE_FLAG = 4; //관리자 - 공지사항 자료실 이용 업로드
	
	//전자결재
	Date date = new Date();
	int MY_CONFIRM_LIST = 0;
	int CONFIRM_STAY = 1;
	int AGREE_LIST = 2;
	int COMPLETE_LIST = 3;
	int REFER_LIST = 4;
	int RETURN_LIST= 5;
	int ADMIN = 6;
	
	//자원예약
	int BOOK_NOTOK = 1;	//조회시간에 예약 있는 경우
	int BOOK_OK = 2;	//예약 가능
	int ADMIN_ASK = 3; //관리자 문의
	int REMAN_NOTOK = 4; //자원 문제 있음
	
}
