package com.ez.gw.dept.model;

import java.util.List;

public interface DeptService {
	DeptVO deptByNo(int empNo);
	List<DeptVO> selectAllDept();
}
