package com.ez.gw.common;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class EmpSearchVO extends SearchVO{
	private int empNo; //사원번호 
	private int boardlistNo; //게시판 번호
	private int boardNo; //게시글 번호
	private String startDate; //조회 시작일자
	private String lastDate; //조회 끝일자
	
	@Override
	public String toString() {
		return "EmpSearchVO [empNo=" + empNo + ", boardlistNo=" + boardlistNo + ", boardNo=" + boardNo + ", startDate="
				+ startDate + ", lastDate=" + lastDate + ", toString()=" + super.toString() + "]";
	}
	
}
