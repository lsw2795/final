package com.ez.gw.reman.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ez.gw.common.JustSearchRemanVO;

@Mapper
public interface RemanDAO {
	int insertOfficeProduct(RemanVO remanVo);
	List<RemanVO> selectOfficeProductByCategory(JustSearchRemanVO searchRemanVo);
	int deleteReman(int remanNo);
	RemanVO selectRemanByNo(int remanNo);
	int updateReman(RemanVO remanVo);
	List<RemanVO> selectAllReman();

}
