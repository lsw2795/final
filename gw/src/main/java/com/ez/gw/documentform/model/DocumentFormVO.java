package com.ez.gw.documentform.model;

import com.ez.gw.common.SearchVO;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class DocumentFormVO extends SearchVO {
	private int documentNo; /* 문서양식 번호 */
	private String formName; /* 양식명 */
	private String securityLevel; /* 보안수준 */
	private String deadline; /* 보존기한 */
	private String formDelFlag;
}
