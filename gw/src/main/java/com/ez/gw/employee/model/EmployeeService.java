package com.ez.gw.employee.model;

import java.util.List;
import java.util.Map;

public interface EmployeeService {
	EmployeeVO selectByEmpNo(int empNo); //사원번호로 사원정보 조회 메서드
	List<EmployeeVO> selectAllEmp();
}
