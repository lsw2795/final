package com.ez.gw.documentform.model;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ez.gw.confirm.model.ConfirmDAO;
import com.ez.gw.confirm.model.ConfirmService;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class DocumentFormServiceImpl implements DocumentFormService {
	private final DocumentFormDAO documentFormDao;
	private final ConfirmDAO confirmDao;

	@Override
	public List<DocumentFormVO> selectAllForm() {
		return documentFormDao.selectAllForm();
	}

	@Override
	public int getTotalRecord(DocumentFormVO vo) {
		return documentFormDao.getTotalRecord(vo);
	}
	
	@Override
	public int formInsert(DocumentFormVO vo) {
		return documentFormDao.formInsert(vo);
	}

	@Override
	public List<DocumentFormVO> selectAllFormPage(DocumentFormVO vo) {
		return documentFormDao.selectAllFormPage(vo);
	}
	
	@Transactional
	@Override
	public int formDelete(int[] delFormNo) {
		int cnt=0;
		int confirm=0;
		for(int i=0; i<delFormNo.length;i++) {
			confirm=confirmDao.searchByDocumentFormNo(delFormNo[i]);
			if(confirm>0) {
				cnt=documentFormDao.formDelFlagUpdate(delFormNo[i]);
			}else {
				cnt=documentFormDao.formDelete(delFormNo[i]);
			}
		}
		
		return cnt;
	}

	@Override
	public int searchName(String formName) {
		return documentFormDao.searchName(formName);
	}

	@Override
	public DocumentFormVO selectFormByNo(int documentNo) {
		return documentFormDao.selectFormByNo(documentNo);
	}

	@Override
	public int formUpdate(DocumentFormVO vo) {
		return documentFormDao.formUpdate(vo);
	}

	@Override
	public List<DocumentFormVO> AllForm() {
		return documentFormDao.AllForm();
	}

}
