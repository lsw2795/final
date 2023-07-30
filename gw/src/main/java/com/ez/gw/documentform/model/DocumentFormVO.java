package com.ez.gw.documentform.model;

import lombok.Data;

@Data
public class DocumentFormVO {
	private int documentNo; /* 문서양식 번호 */
	private String formName; /* 양식명 */
	private String securityLevel; /* 보안수준 */
	private String deadline; /* 보존기한 */
}
