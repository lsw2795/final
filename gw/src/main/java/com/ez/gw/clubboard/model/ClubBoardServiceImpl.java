package com.ez.gw.clubboard.model;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.ez.gw.common.SearchVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ClubBoardServiceImpl implements ClubBoardService{
	private final ClubBoardDAO clubboardDao;

	@Override
	public List<Map<String, Object>> clubBoardView(int clubNo, SearchVO searchVo) {
		return clubboardDao.clubBoardView(clubNo, searchVo);
	}

	@Override
	public int insertClubBoard(ClubBoardVO clubVo) {
		return clubboardDao.insertClubBoard(clubVo);
	}

	@Override
	public int updateReadcount(int boardNo) {
		return clubboardDao.updateReadcount(boardNo);
	}

	@Override
	public int updateClubBoard(ClubBoardVO clubVo) {
		return clubboardDao.updateClubBoard(clubVo);
	}

	@Override
	public Map<String, Object> detailClubBoard(int clubNo, int boardNo) {
		return clubboardDao.detailClubBoard(clubNo, boardNo);
	}

	@Override
	public int deleteClubBoard(int boardNo) {
		return clubboardDao.deleteClubBoard(boardNo);
	}

	@Override
	@Transactional
	public int deleteMulti(List<ClubBoardVO> list) {
		int cnt = 0;
		
		try {
			for(ClubBoardVO vo : list) {
				int boardNo = vo.getBoardNo();
				if(boardNo!=0) { //체크된 질문만 삭제
					cnt = clubboardDao.deleteClubBoard(boardNo);
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
	public List<Map<String, Object>> selectImg(int clubBoardNo) {
		return clubboardDao.selectImg(clubBoardNo);
	}

	@Override
	public int deleteClubFileOne(String fileName, int clubBoardNo) {
		return clubboardDao.deleteClubFileOne(fileName, clubBoardNo);
	}

	
}
