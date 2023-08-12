package com.ez.gw.dept.model;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class DeptServiceImpl implements DeptService{
	private final DeptDAO deptDao;

	@Override
	public DeptVO deptByNo(int empNo) {
		return deptDao.deptByNo(empNo);
	}

	@Override
	public List<DeptVO> selectAllDept() {
		return deptDao.selectAllDept();
	}
}
