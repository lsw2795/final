package com.ez.gw.refer.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ReferDAO {
	int insertRefer(ReferVO referVo);
	List<Integer> selectEmpNoByConfirmNo(String confirmDocumentNo);
	int deleteRefer(String confirmDocumentNo);
}
