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

	@Override
	public int insertWorkIn(int empNo) {
		return commuteDao.insertWorkIn(empNo);
	}

	@Override
	public int updateWorkOut(int empNo) {
		return commuteDao.updateWorkOut(empNo);
	}

	@Override
	public int selectIsWorkIn(int empNo) {
		return commuteDao.selectIsWorkIn(empNo);
	}

	@Override
	public int selectIsWorkOut(int empNo) {
		return commuteDao.selectIsWorkOut(empNo);
	}

	@Override
	public int updateCommuteState(CommuteVO vo) {
		return commuteDao.updateCommuteState(vo);
	}

	@Override
	public int updateCommuteStateEalry(int empNo) {
		return commuteDao.updateCommuteStateEalry(empNo);
	}

	
	
}
