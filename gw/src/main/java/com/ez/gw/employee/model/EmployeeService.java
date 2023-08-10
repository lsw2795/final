package com.ez.gw.employee.model;

import java.util.List;
import java.util.Map;

public interface EmployeeService {
	//로그인 처리 관련 상수
	int LOGIN_OK=1; //로그인 성공
	int PWD_DISAGREE=2; //비밀번호 불일치
	int	EMPNO_NONE=3; //존재하지 않는 사원번호
	
	EmployeeVO selectByEmpNo(int empNo); //사원번호로 사원정보 조회 메서드
	List<EmployeeVO> selectAllEmp();
	int loginCheck(String pwd,int empNo); //로그인 성공여부
	String selctAuthority(int empNo); 
}
