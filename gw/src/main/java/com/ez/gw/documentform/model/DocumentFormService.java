package com.ez.gw.documentform.model;

import java.util.List;

public interface DocumentFormService {
	List<DocumentFormVO> selectAllFormPage(DocumentFormVO vo);
	List<DocumentFormVO> selectAllForm();
	List<DocumentFormVO> AllForm();
	int getTotalRecord(DocumentFormVO vo);
	int formInsert(DocumentFormVO vo);
	int formUpdate(DocumentFormVO vo);
	int formDelete(int[] delFormNo);
	int searchName(String formName);
	DocumentFormVO selectFormByNo(int documentNo);
}
