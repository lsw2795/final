package com.ez.gw.report.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class ReportVO { /* 신고 */
	private int reportNo; /* 신고번호 */
	private Timestamp reportDate; /* 신고일 */
	private int reportStatus; /* 처리상태 0:대기 1:처리 */
	private int empNo; /* 신고자(사원번호) */
	private int boardListNo; /* 게시판 번호 */
	private int boardNo; /* board의 게시글 번호 null이나 0*/
	private int commentNo; /* 댓글 번호 */
	private int clubNo; /* 동호회 번호 */
	
	private int clubBoardNo; /* clubboard의 게시글 번호 */
}
