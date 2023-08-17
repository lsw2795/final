package com.ez.gw.confirm.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ConfirmDAO {
	int insertConfirm(ConfirmVO vo);
	int selectCountByDate();
	List<Map<String, Object>> selectAllByEmpNo(int empNo);
}
