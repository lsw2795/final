package com.ez.gw.employee.model;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface EmployeeDAO {
	EmployeeVO selectByEmpNo(int empNo); //사원번호로 사원정보 조회 메서드
	String selectPwd(int empNo); //로그인 성공여부
	String selctAuthority(int empNo); //관리자 로그인여부
}
