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

	@Override
	public List<Map<String, Object>> selectManager() {
		return deptDao.selectManager();
	}

	@Override
	public int checkDeptName(String name) {
		return deptDao.checkDeptName(name);
	}

	@Override
	public int updateDept(DeptVO deptVo) {
		return deptDao.updateDept(deptVo);
	}

	@Override
	public int deptEmpCount(int deptNo) {
		return deptDao.deptEmpCount(deptNo);
	}

	@Override
	public int deleteDept(int deptNo) {
		return deptDao.deleteDept(deptNo);
	}



}
