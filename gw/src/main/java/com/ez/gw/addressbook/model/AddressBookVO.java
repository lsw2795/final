package com.ez.gw.addressbook.model;

import lombok.Data;

@Data
public class AddressBookVO {
	private int addrbookNo; /* 주소록번호 */
	private String addrbookName; /* 주소록이름 */
	private String addrbookComname; /* 회사명 */
    private String addrbookTel;  /* 전화번호 */
    private String addrbookEmail; /* 이메일 */
    private int empNo; /* 사원번호 */
	private String addrbookDept; /* 부서 */
	private String addrbookRank; /* 직급 */
}
