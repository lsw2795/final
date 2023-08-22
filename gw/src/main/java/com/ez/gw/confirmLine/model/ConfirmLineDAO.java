package com.ez.gw.confirmLine.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ConfirmLineDAO {
	int insertConfirmLine(ConfirmLineVO vo);
	List<Map<String, Object>> selectByEmpNo(int empNo);
	int deleteLine(int confirmLineNo);
	ConfirmLineVO selectByConfirmLineNo(int confirmLineNo);
}
