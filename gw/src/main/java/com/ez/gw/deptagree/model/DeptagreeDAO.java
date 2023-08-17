package com.ez.gw.deptagree.model;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface DeptagreeDAO {
	int insertDeptAgree(DeptagreeVO depAgreeVo);
}	
