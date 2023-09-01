package com.ez.gw.reman.model;

import java.util.List;

import com.ez.gw.common.JustSearchRemanVO;

public interface RemanService {
	int insertOfficeProduct(RemanVO remanVo);
	List<RemanVO> selectOfficeProductByCategory(JustSearchRemanVO searchRemanVo);
	int multiDelReman(List<RemanVO> remanList);
	RemanVO selectRemanByNo(int remanNo);
	int updateReman(RemanVO remanVo);
	List<RemanVO> selectAllReman();
}
