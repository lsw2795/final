package com.ez.gw.employee.model;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class EmployeeServiceImpl implements EmployeeService{
	private final EmployeeDAO employeeDao;

	@Override
	public EmployeeVO selectByEmpNo(int empNo) {
		return selectByEmpNo(empNo);
	}
	
	
}
