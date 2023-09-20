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
	public int gTRSearchNotice(SearchVO searchVo) {
		return boardDao.gTRSearchNotice(searchVo);
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
	public int deleteNotice(int boardNo) {
		return boardDao.deleteNotice(boardNo);
	}

	@Override
	public List<Map<String, Object>> selectByEmpNo(EmpSearchVO searchVo) {
		return boardDao.selectByEmpNo(searchVo);
	}

	@Override
	public int gTRSearchBoard(EmpSearchVO searchVo) {
		return boardDao.gTRSearchBoard(searchVo);
	}

	public Map<String, Object> selectPrevNotice(int boardNo) {
		return boardDao.selectPrevNotice(boardNo);
	}

	@Override
	public Map<String, Object> selectNextNotice(int boardNo) {
		return boardDao.selectNextNotice(boardNo);
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
			}
		}catch(RuntimeException e) {
			//선언적 트랜잭션에서는 런타임 예외가 발생하면 롤백한다.
			e.printStackTrace();
			cnt=-1;
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		return cnt;
	}

	@Override
	public List<Map<String, Object>> selectAdminQnaAll(SearchVO searchVo) {
		return boardDao.selectAdminQnaAll(searchVo);
	}

	@Override
	public int selectAdminQnaTotalRecord(SearchVO searchVo) {
		return boardDao.selectAdminQnaTotalRecord(searchVo);
	}

	@Override
	public int insertFAQ(BoardVO vo) {
		return boardDao.insertFAQ(vo);
	}

	@Override
	public List<BoardVO> selectFAQ(SearchVO seachVo) {
		return boardDao.selectFAQ(seachVo);
	}

	@Override
	public int gTRsearchFAQ(SearchVO searchVo) {
		return boardDao.gTRsearchFAQ(searchVo);
	}

	@Override
	public int insertAnonumous(BoardVO vo) {
		return boardDao.insertAnonumous(vo);
	}
	
	public int updateFAQ(BoardVO vo) {
		return boardDao.updateFAQ(vo);
	}

	@Override
	public BoardVO selectFAQByBoardNo(int boardNo) {
		return boardDao.selectFAQByBoardNo(boardNo);
	}

	@Override
	@Transactional
	public int faqDeleteMulti(List<BoardVO> list) {
		int cnt = 0;
		try {
			for(BoardVO vo : list) {
				int boardNo = vo.getBoardNo();
				if(boardNo!=0) { //체크된 질문만 삭제
					cnt = boardDao.deleteFAQ(boardNo);
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

	@Override
	public List<Map<String, Object>> select24List() {
		return boardDao.select24List();
	}

	@Override
	public int updateAnonymousBoard(BoardVO vo) {
		return boardDao.updateAnonymousBoard(vo);
	}

	@Override
	public int deleteAnonymousBoard(int boardNo) {
		return boardDao.deleteAnonymousBoard(boardNo);
	}

	@Override
	@Transactional
	public int noticeDeleteMulti(List<BoardVO> list) {
		int cnt = 0;
		try {
			for(BoardVO vo : list) {
				int boardNo = vo.getBoardNo();
				if(boardNo!=0) { //체크된 질문만 삭제
					cnt = boardDao.deleteNotice(boardNo);
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

	@Override
	public List<Map<String, Object>> selRegdateDesc5() {
		return boardDao.selRegdateDesc5();
	}

	@Override
	public Map<String, Object> AnonymousBoardByBoardNo(int boardNo) {
		return boardDao.AnonymousBoardByBoardNo(boardNo);
	}
	
	
	public List<Map<String, Object>> searchDeptBoard(EmpSearchVO searchVo) {
		return boardDao.searchDeptBoard(searchVo);
	}

	@Override
	public int gTRCountDeptBoard(EmpSearchVO searchVo) {
		return boardDao.gTRCountDeptBoard(searchVo);
	}

	@Override
	public int insertDeptBoard(BoardVO vo) {
		return boardDao.insertDeptBoard(vo);
	}

	@Override
	public Map<String, Object> selectdeptBoard(BoardVO vo) {
		return boardDao.selectdeptBoard(vo);
	}

	@Override
	public Map<String, Object> selPrevDeptBoard(BoardVO vo) {
		return boardDao.selPrevDeptBoard(vo);
	}

	@Override
	public Map<String, Object> selNextDeptBoard(BoardVO vo) {
		return boardDao.selNextDeptBoard(vo);
	}

	@Override
	public int updateDeptBoard(BoardVO vo) {
		return boardDao.updateDeptBoard(vo);
	}

	@Override
	public int deleteDeptBoard(BoardVO vo) {
		return boardDao.deleteDeptBoard(vo);
	}

	@Override
	public int likeCountUp(int boardNo) {
		return boardDao.likeCountUp(boardNo);
	}

	@Override
	public int likeCountDown(int boardNo) {
		return boardDao.likeCountDown(boardNo);
	}

	@Override
	public int getQnaTotalCount(SearchVO searchVo) {
		return boardDao.getQnaTotalCount(searchVo);
	}



}
