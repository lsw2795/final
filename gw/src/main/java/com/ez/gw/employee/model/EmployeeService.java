package com.ez.gw.employee.model;

import java.util.List;
import java.util.Map;

import com.ez.gw.common.SearchVO;

public interface EmployeeService {
	//로그인 처리 관련 상수
	int LOGIN_OK=1; //로그인 성공
	int PWD_DISAGREE=2; //비밀번호 불일치
	int	EMPNO_NONE=3; //존재하지 않는 사원번호
	
	//관리자 권한 여부 상수
	int IS_ADMIN=1; //관리자 권한 있음
	int NOT_ADMIN=2; //관리자 권한 없음
	int	ADMIN_NONE=3; //해당 관리자 없음
	
	EmployeeVO selectByEmpNo(int empNo); //사원번호로 사원정보 조회 메서드
	List<EmployeeVO> selectAllEmp();
	int loginCheck(String pwd,int empNo); //로그인 성공여부
	String selctAuthority(int empNo); 
	int insertEmp(EmployeeVO vo); //관리자 - 사원 등록 메서드
	List<Map<String, Object>> selectSearchEmp(SearchVO searchVo);//조직도 - 사원 검색 메서드
	Map<String, Object> selectEmpByEmpNo(int empNo); //사원 정보 수정 메서드
}
