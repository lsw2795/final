package com.ez.gw.employee.model;

public interface EmployeeService {
	//로그인 처리 관련 상수
	int LOGIN_OK=1; //로그인 성공
	int PWD_DISAGREE=2; //비밀번호 불일치
	int	USERID_NONE=3; //존재하지 않는 아이디
	
	EmployeeVO selectByEmpNo(int empNo); //사원번호로 사원정보 조회 메서드
	
}
