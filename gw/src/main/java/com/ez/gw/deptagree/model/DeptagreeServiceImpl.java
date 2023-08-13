package com.ez.gw.deptagree.model;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class DeptagreeServiceImpl implements DeptagreeService{
	private final DeptagreeDAO deptagreeDao;

	@Override
	public int insertDeptAgree(DeptagreeVO depAgreeVo) {
		return deptagreeDao.insertDeptAgree(depAgreeVo);
	}
	
}
