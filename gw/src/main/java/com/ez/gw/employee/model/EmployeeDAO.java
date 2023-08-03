package com.ez.gw.employee.model;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface EmployeeDAO {
	EmployeeVO selectByEmpNo(int empNo); //사원번호로 사원정보 조회 메서드
}
