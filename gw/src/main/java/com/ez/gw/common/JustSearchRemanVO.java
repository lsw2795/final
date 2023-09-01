package com.ez.gw.common;

import lombok.Data;

@Data
public class JustSearchRemanVO {
	/**검색 조건*/
	private String searchCondition = "";
	
	/**검색 키워드*/
	private String searchKeyword = "";
	
	/** 검색 사용여부 */
	private String searchUseYn = "";
	
	/**카테고리*/
	private String category="";
	/**
	 * 
	 * @param bean 검색 조건
	 */
	public void setJustSearchVo(JustSearchRemanVO bean) {
		this.searchCondition = bean.searchCondition;
		this.searchKeyword = bean.searchKeyword;
		this.searchUseYn = bean.searchUseYn;
		this.category = bean.category;
	}
}
