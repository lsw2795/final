package com.ez.gw.pds.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class PdsVO {
	private int pdsNo; /* 자료번호 */
	private String path; /* 자료파일경로 */
	private Timestamp regdate; /* 자료등록일 */
	private String fileName; /* 업로드파일명 */
	private long fileSize; /* 파일사이즈 */
	private String originalFileName; /* 원본파일명 */
	private String fileExtension; /* 파일확장자 */
	private int downloadCount; /* 다운로드수 */
	private String titleImage; /* 대표 이미지 */
	private int boardListNo; /* 게시판번호 */
	private int boardNo; /* 게시글번호 */
	
	
	private int clubBoardNo; /* 동호회 게시글 번호 */
}
