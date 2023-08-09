package com.ez.gw.employee.model;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class EmployeeServiceImpl implements EmployeeService{
	private final EmployeeDAO employeeDao;

	@Override
	public EmployeeVO selectByEmpNo(int empNo) {
		return employeeDao.selectByEmpNo(empNo);
	}
	
	@Override
	public List<EmployeeVO> selectAllEmp() {
		return employeeDao.selectAllEmp();
	}
	
	
	
}
