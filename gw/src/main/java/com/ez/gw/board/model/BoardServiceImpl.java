package com.ez.gw.board.model;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.ez.gw.common.EmpSearchVO;
import com.ez.gw.common.SearchVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BoardServiceImpl implements BoardService {
	private final BoardDAO boardDao;

	@Override
	public int insertQna(BoardVO vo) {
		return boardDao.insertQna(vo);
	}

	@Override
	public List<Map<String, Object>> selectQnaAll(SearchVO searchVo) {
		return boardDao.selectQnaAll(searchVo);
	}

	@Override
	public Map<String, Object> selectQna(int boardNo) {
		return boardDao.selectQna(boardNo);
	}

	@Override
	public int updateReadcount(int boardNo) {
		return boardDao.updateReadcount(boardNo);
	}

	@Override
	public int updateQna(BoardVO vo) {
		return boardDao.updateQna(vo);
	}

	@Override
	public int deleteQna(int boardNo) {
		return boardDao.deleteQna(boardNo);
	}

	@Override
	public int insertNotice(BoardVO vo) {
		return boardDao.insertNotice(vo);
	}

	@Override
	public List<Map<String, Object>> selectNoticeAll(SearchVO searchVo) {
		return boardDao.selectNoticeAll(searchVo);
	}

	@Override
	public Map<String, Object> selectNotice(int boardNo) {
		return boardDao.selectNotice(boardNo);
	}

	@Override
	public int updateNotice(BoardVO vo) {
		return boardDao.updateNotice(vo);
	}

	@Override
	public int deleteNotice(BoardVO vo) {
		return boardDao.deleteNotice(vo);
	}

	@Override
	public List<Map<String, Object>> selectByEmpNo(EmpSearchVO searchVo) {
		return boardDao.selectByEmpNo(searchVo);
	}

	@Override
	public int gTRSearchBoard(EmpSearchVO searchVo) {
		return boardDao.gTRSearchBoard(searchVo);
	}

	@Override
	@Transactional
	public int deleteMulti(List<BoardVO> list) {
		int cnt = 0;

		try {
			for(BoardVO vo : list) {
				int boardNo = vo.getBoardNo();
				if(boardNo!=0) { //체크된 질문만 삭제
					cnt = boardDao.deleteQna(boardNo);
				}
			}//for
		}catch(RuntimeException e) {
			//선언적 트랜잭션에서는 런타임 예외가 발생하면 롤백한다.
			e.printStackTrace();
			cnt=-1;
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		return cnt;
	}



}
