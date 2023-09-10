package com.ez.gw.report.model;

import com.ez.gw.common.SearchVO;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class ReportVO extends SearchVO { /* 신고 */
	private int reportNo; /* 신고번호 */
	private String reportDate; /* 신고일 */
	private int reportStatus; /* 처리상태 0:대기 1:처리 */
	private int empNo; /* 신고자(사원번호) */
	private int boardListNo; /* 게시판 번호 */
	private int boardNo; /* board의 게시글 번호 null이나 0*/
	private int commentNo; /* 댓글 번호 */
	private int clubNo; /* 동호회 번호 */
	
	private int clubBoardNo; /* clubboard의 게시글 번호 */
	
	private int tradeNo; /*tradeNo 번호*/
	
	

	@Override
	public String toString() {
		return "ReportVO [reportNo=" + reportNo + ", reportDate=" + reportDate + ", reportStatus=" + reportStatus
				+ ", empNo=" + empNo + ", boardListNo=" + boardListNo + ", boardNo=" + boardNo + ", commentNo="
				+ commentNo + ", clubNo=" + clubNo + ", clubBoardNo=" + clubBoardNo + ", toString()=" + super.toString()
				+ "]";
	}

}
