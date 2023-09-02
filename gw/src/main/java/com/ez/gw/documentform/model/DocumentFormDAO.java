package com.ez.gw.documentform.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface DocumentFormDAO {
	List<DocumentFormVO> selectAllFormPage(DocumentFormVO vo);
	List<DocumentFormVO> selectAllForm();
	List<DocumentFormVO> AllForm();
	int getTotalRecord(DocumentFormVO vo);
	int formInsert(DocumentFormVO vo);
	int formUpdate(DocumentFormVO vo);
	int formDelete(int documentNo);
	int formDelFlagUpdate(int documentNo);
	int searchName(String formName);
	DocumentFormVO selectFormByNo(int documentNo);
}
