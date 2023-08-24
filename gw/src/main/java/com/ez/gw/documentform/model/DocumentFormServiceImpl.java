package com.ez.gw.documentform.model;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class DocumentFormServiceImpl implements DocumentFormService {
	private final DocumentFormDAO documentFormDao;

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

}
