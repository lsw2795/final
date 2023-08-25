package com.ez.gw.documentform.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface DocumentFormDAO {
	List<DocumentFormVO> selectAllFormPage(DocumentFormVO vo);
	List<DocumentFormVO> selectAllForm();
	int getTotalRecord(DocumentFormVO vo);
	int formInsert(DocumentFormVO vo);
}
