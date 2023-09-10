package com.ez.gw.club.model;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.ez.gw.clubboard.model.ClubBoardVO;
import com.ez.gw.common.SearchVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ClubServiceImpl implements ClubService{
	private final ClubDAO clubDao;

	@Override
	public int insertClub(ClubVO vo) {
		return clubDao.insertClub(vo);
	}

	@Override
	public List<Map<String, Object>> selectClub(SearchVO searchVo) {
		return clubDao.selectClub(searchVo);
	}
	
	@Override
	public ClubVO selectByClubNo(int clubNo) {
		return clubDao.selectByClubNo(clubNo);
	}
	
	@Override
	public int updateClub(ClubVO vo) {
		return clubDao.updateClub(vo);
	}
	
	@Override
	public int deleteClub(int clubNo) {
		return clubDao.deleteClub(clubNo);
	}

	@Override
	@Transactional
	public int deleteMulti(List<ClubVO> list) {
		int cnt = 0;
		
		try {
			for(ClubVO vo : list) {
				int clubNo = vo.getClubNo();
				if(clubNo!=0) { //체크된 질문만 삭제
					cnt = clubDao.deleteClub(clubNo);
				}
			} //for
		}catch (RuntimeException e) {
			//선언적 트랜잭션에서는 런타임 예외가 발생하면 롤백한다.
			e.printStackTrace();
			cnt=-1;
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		
		return cnt;
	}

	@Override
	public int joinClub(String merchantNo, String clubNo, String empNo) {
		
		int parsedClubNo = Integer.parseInt(clubNo);
		int parsedEmpNo = Integer.parseInt(empNo);
		
		return clubDao.joinClub(merchantNo, parsedClubNo, parsedEmpNo);
	}

	@Override
	public int outClub(int empNo) {
		return clubDao.outClub(empNo);
	}

	@Override
	public List<Map<String, Object>> adminClubList(SearchVO searchVo) {
		return clubDao.adminClubList(searchVo);
	}

	@Override
	public int clubCount(int clubNo) {
		return clubDao.clubCount(clubNo);
	}

	@Override
	public int regiClub(int empNo) {
		return clubDao.regiClub(empNo);
	}

	

	

	
	
}
