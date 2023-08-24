package com.ez.gw.documentform.model;

import java.util.List;

public interface DocumentFormService {
	List<DocumentFormVO> selectAllFormPage(DocumentFormVO vo);
	List<DocumentFormVO> selectAllForm();
	int getTotalRecord(DocumentFormVO vo);
	int formInsert(DocumentFormVO vo);
}
