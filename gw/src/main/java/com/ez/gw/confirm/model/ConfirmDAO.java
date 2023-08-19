package com.ez.gw.confirm.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ConfirmDAO {
	int insertConfirm(ConfirmVO vo);
	int selectCountByDate();
	List<Map<String, Object>> selectAllByEmpNo(ConfirmVO vo);
	int getTotalRecord(ConfirmVO vo);
	List<Map<String, Object>> selectAllConfirmDocument(ConfirmVO vo);
	int getTotalConfirmRecord(ConfirmVO vo);
	Map<String, Object> selectConfirmDocument(String confirmDocumentNo);
	Map<String, Object> selectDeptAgree(String confirmDocumentNo);
	int updateConfirmState(ConfirmVO vo);
	int updateConfirmStateByClick(ConfirmVO vo);
}
