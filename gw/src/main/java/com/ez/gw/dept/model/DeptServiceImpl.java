package com.ez.gw.dept.model;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.ez.gw.employee.model.EmployeeDAO;

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

	@Override
	public List<Map<String, Object>> selectEmpByDeptNo(int deptVo) {
		return deptDao.selectEmpByDeptNo(deptVo);
	}

	@Override
	public List<DeptAllVO> selectAllDept2(DeptVO deptVo) {
		return deptDao.selectAllDept2(deptVo);
	}

	@Override
	public int insertDept(DeptVO deptVo) {
		return deptDao.insertDept(deptVo);
	}

}
