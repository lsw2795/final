package com.ez.gw.reman.model;

import java.util.List;

public interface RemanService {
	int insertOfficeProduct(RemanVO remanVo);
	List<RemanVO> selectOfficeProductByCategory(String category);
}
