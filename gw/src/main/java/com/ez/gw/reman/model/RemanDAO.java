package com.ez.gw.reman.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import lombok.Data;

@Mapper
public interface RemanDAO {
	int insertOfficeProduct(RemanVO remanVo);
	List<RemanVO> selectOfficeProductByCategory(String category);
	int deleteReman(int remanNo);

}
