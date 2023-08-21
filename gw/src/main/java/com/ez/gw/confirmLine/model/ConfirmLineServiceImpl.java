package com.ez.gw.confirmLine.model;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ConfirmLineServiceImpl implements ConfirmLineService{
	private final ConfirmLineDAO confirmLineDao;

	@Override
	public int insertConfirmLine(ConfirmLineVO vo) {
		return confirmLineDao.insertConfirmLine(vo);
	}

	@Override
	public List<Map<String, Object>> selectByEmpNo(int empNo) {
		return confirmLineDao.selectByEmpNo(empNo);
	}

	@Override
	public int deleteLine(int confirmLineNo) {
		return confirmLineDao.deleteLine(confirmLineNo);
	}

	@Override
	public ConfirmLineVO selectByConfirmLineNo(int confirmLineNo) {
		return confirmLineDao.selectByConfirmLineNo(confirmLineNo);
	}

}
