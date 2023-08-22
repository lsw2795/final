package com.ez.gw.deptagree.model;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface DeptagreeDAO {
	int insertDeptAgree(DeptagreeVO depAgreeVo);
	int updateDeptAgree(String confirmDocumentNo);
	int returnDeptAgree(String confirmDocumentNo);
	int updateDeptAgreeByReturn(DeptagreeVO depAgreeVo);
	int countByDocument(String confirmDocumentNo);
	int deleteDeptAgree(String confirmDocumentNo);
}	
