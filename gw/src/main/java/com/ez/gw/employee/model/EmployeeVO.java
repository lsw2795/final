package com.ez.gw.employee.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class EmployeeVO {
	private int empNo; /* 사원번호 */
	private String name; /* 사원이름 */
	private String ename; /* 사원영문이름 */
	private String jumin; /* 주민번호 */
	private String email; /* 이메일 */
	private String pwd; /* 비밀번호 */
	private String extensionNo; /* 내선번호 */
	private String tel; /* 전화번호 */
	private String address; /* 주소 */
	private String married; /* 결혼여부 */
	private Timestamp hiredate; /* 입사일 */
	private Timestamp retiredate; /* 퇴사일 */
	private String authority; /* 권한 */
	private int annualSalary; /* 연봉 */
	private String image; /* 이미지 */
	private int positionNo; /* 직위/직책코드 */
	private int deptNo; /* 부서번호 */
	private int clubNo; /* 동호회번호 */
	private int annualYear; /* 근속 년수 */
}
