package com.ez.gw.reman.model;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class RemanServiceImpl implements RemanService{
	private final RemanDAO remanDao;

	@Override
	public int insertOfficeProduct(RemanVO remanVo) {
		return remanDao.insertOfficeProduct(remanVo);
	}

	@Override
	public List<RemanVO> selectOfficeProductByCategory(String category) {
		return remanDao.selectOfficeProductByCategory(category);
	}
}
