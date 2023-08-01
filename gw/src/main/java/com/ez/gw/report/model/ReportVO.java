package com.ez.gw.report.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class ReportVO { /* 신고 */
	private int reportNo; /* 신고번호 */
	private String reportType; /* 신고 유형 A.부적절한 내용, B.광고성 */
	private String reportCategory; /* 신고분류 : 게시글, 댓글 */
	private Timestamp reportDate; /* 신고일 */
	private int reportStatus; /* 처리상태 0:대기 1:비활 2:취소 */
	private int empNo; /* 신고자(사원번호) */
	private int boardListNo; /* 게시판 번호 */
	private int boardNo; /* 게시글 번호 */
	private int commentNo; /* 댓글 번호 */

}
