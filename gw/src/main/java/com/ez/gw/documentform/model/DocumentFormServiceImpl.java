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
	
	
}
