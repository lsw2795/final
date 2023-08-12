package com.ez.gw.dept.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface DeptDAO {
	DeptVO deptByNo(int empNo);
	List<DeptVO> selectAllDept();
}
