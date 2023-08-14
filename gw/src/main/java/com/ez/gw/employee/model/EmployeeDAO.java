package com.ez.gw.employee.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface EmployeeDAO {
	EmployeeVO selectByEmpNo(int empNo); //사원번호로 사원정보 조회 메서드
	List<EmployeeVO> selectAllEmp();
	String selectPwd(int empNo); //로그인 성공여부
	String selctAuthority(int empNo); //관리자 로그인여부
	int insertEmp(EmployeeVO vo); //관리자 - 사원 등록 메서드
	
}
