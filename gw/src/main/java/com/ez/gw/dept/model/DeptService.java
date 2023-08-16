package com.ez.gw.dept.model;

import java.util.List;
import java.util.Map;

public interface DeptService {
	DeptVO deptByNo(int empNo);
	List<DeptVO> selectAllDept();
	List<Map<String, Object>> selectEmpByDeptNo(int deptVo);
}
