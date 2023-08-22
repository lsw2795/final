package com.ez.gw.commute.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CommuteDAO {
	List<CommuteVO> selectCommuteByEmpNo(int empNo);
	
	
}
