package com.ez.gw.commute.model;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CommuteServiceImpl implements CommuteService{
	private final CommuteDAO commuteDao;

	@Override
	public List<CommuteVO> selectCommuteByEmpNo(int empNo) {
		return commuteDao.selectCommuteByEmpNo(empNo);
	}

	
	
}
