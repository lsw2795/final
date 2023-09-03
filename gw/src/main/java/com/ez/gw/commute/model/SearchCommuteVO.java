package com.ez.gw.commute.model;

import com.ez.gw.common.SearchVO;

import lombok.Data;

@Data
public class SearchCommuteVO extends SearchVO {
	/** 검색조건 */
	private String date1 = "";
	private String date2 = "";
	private String deptNo = "";
	private String emp = "";

}
