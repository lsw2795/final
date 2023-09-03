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
	int getTotalRecordAdmin(ConfirmVO vo);
	List<Map<String, Object>> selectAllConfirmDocument(ConfirmVO vo);
	int getTotalConfirmRecord(ConfirmVO vo);
	Map<String, Object> selectConfirmDocument(String confirmDocumentNo);
	Map<String, Object> selectDeptAgree(String confirmDocumentNo);
	int updateConfirmState(ConfirmVO vo);
	int updateConfirmStateByClick(ConfirmVO vo);
	List<Map<String, Object>> selectAllDeptAgree(ConfirmVO vo);
	int getTotalAgreeRecord (ConfirmVO vo);
	List<Map<String, Object>> selectAllCompleteDocument(ConfirmVO vo);
	int getTotalComplteRecord (ConfirmVO vo);
	List<Map<String, Object>> selectAllRefer (ConfirmVO vo);
	int getTotalReferRecord (ConfirmVO vo);
	List<Map<String, Object>> selectAllReturn (ConfirmVO vo);
	int getTotalReturnRecord (ConfirmVO vo);
	int getTotalAgreeRecordMain (ConfirmVO vo);
	int returnConfirm(ConfirmVO vo);
	int updateConfirm(ConfirmVO vo);
	List<Map<String, Object>> selectAllByAdmin(ConfirmVO vo);
	int updateConfirmDelFlag(String confirmDocumentNo);
	int searchByDocumentFormNo(int documentNo);
	List<Map<String, Object>> selectConfirmList5(int empNo);
}
