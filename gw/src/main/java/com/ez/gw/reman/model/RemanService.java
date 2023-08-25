package com.ez.gw.reman.model;

import java.util.List;

public interface RemanService {
	int insertOfficeProduct(RemanVO remanVo);
	List<RemanVO> selectOfficeProductByCategory(String category);
	int multiDelReman(List<RemanVO> remanList);
	RemanVO selectRemanByNo(int remanNo);
	int updateReman(RemanVO remanVo);
}
