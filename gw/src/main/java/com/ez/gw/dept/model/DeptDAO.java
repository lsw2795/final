package com.ez.gw.dept.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface DeptDAO {
	DeptVO deptByNo(int empNo);
	List<DeptVO> selectAllDept();
	List<Map<String, Object>> selectEmpByDeptNo(int deptVo);
	List<DeptAllVO> selectAllDept2(DeptVO deptVo);
}
