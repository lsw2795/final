package com.ez.gw.pds.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class PdsVO {
	private int pdsNo; /* 자료번호 */
	private String path; /* 자료파일경로 */
	private Timestamp regdate; /* 자료등록일 */
	private String filename; /* 업로드파일명 */
	private int filesize; /* 파일사이즈 */
	private String originalfilename; /* 원본파일명 */
	private String fileExtension; /* 파일확장자 */
	private int downloadcount; /* 다운로드수 */
	private String titleImage; /* 대표 이미지 */
	private int boardlistNo; /* 게시판번호 */
	private int boardNo; /* 게시글번호 */
}
