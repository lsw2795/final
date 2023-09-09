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

	@Override
	public int selectLateState(int empNo) {
		return commuteDao.selectLateState(empNo);
	}

	@Override
	public int updateCommuteStateTotal(int empNo) {
		return commuteDao.updateCommuteStateTotal(empNo);
	}

	@Override
	public int selectCommuteLateCount(int empNo, String date) {
		return commuteDao.selectCommuteLateCount(empNo, date);
	}

	@Override
	public int selectCommuteEarlyleaveCount(int empNo, String date) {
		return commuteDao.selectCommuteEarlyleaveCount(empNo, date);
	}

	@Override
	public int selectCommuteAttendanceCount(int empNo, String date) {
		return commuteDao.selectCommuteAttendanceCount(empNo, date);
	}

	@Override
	public List<Map<String, Object>> selectCommuteMonthByEmpNo(int empNo, String date) {
		return commuteDao.selectCommuteMonthByEmpNo(empNo, date);
	}


	@Override
	public List<Map<String, Object>> selectAllCommute(SearchCommuteVO searchCommuteVO) {
		return commuteDao.selectAllCommute(searchCommuteVO);
	}

	@Override
	public int getAllCommuteTotalCount(SearchCommuteVO searchCommuteVO) {
		return commuteDao.getAllCommuteTotalCount(searchCommuteVO);
	}

	@Override
	public int selectAllCommuteLateCount(SearchCommuteVO searchCommuteVO) {
		return commuteDao.selectAllCommuteLateCount(searchCommuteVO);
	}

	@Override
	public int selectAllCommuteEalryLeaveCount(SearchCommuteVO searchCommuteVO) {
		return commuteDao.selectAllCommuteEalryLeaveCount(searchCommuteVO);
	}

	@Override
	public int selectAllCommuteAttendanceCount(SearchCommuteVO searchCommuteVO) {
		return commuteDao.selectAllCommuteAttendanceCount(searchCommuteVO);
	}

	@Override
	public int updateWorkTime(CommuteVO commuteVo) {
		return commuteDao.updateWorkTime(commuteVo);
	}

	@Override
	public CommuteVO selectTodayCommute(int empNo) {
		return commuteDao.selectTodayCommute(empNo);
	}

	@Override
	public List<Map<String, Object>> exelDownCommute(SearchCommuteVO searchCommuteVO) {
		return commuteDao.exelDownCommute(searchCommuteVO);
	}

	
	
}
