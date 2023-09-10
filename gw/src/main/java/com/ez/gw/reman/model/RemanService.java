package com.ez.gw.reman.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.ez.gw.common.JustSearchRemanVO;

public interface RemanService {
	int insertOfficeProduct(RemanVO remanVo);
	List<RemanVO> selectOfficeProductByCategory(JustSearchRemanVO searchRemanVo);
	int multiDelReman(List<RemanVO> remanList);
	RemanVO selectRemanByNo(int remanNo);
	int updateReman(RemanVO remanVo);
	List<RemanVO> selectAllReman();
	List<Map<String, Object>> staticReman(@Param("category")String category, @Param("regdate")String regdate);
}
