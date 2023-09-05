package com.ez.gw.boardlist.model;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.ez.gw.common.EmpSearchVO;
import com.ez.gw.common.SearchVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BoardListServiceImpl implements BoardListService {
	private final BoardListDAO boardListDao;

	@Override
	public List<BoardListVO> selectBoardList() {
		return boardListDao.selectBoardList();
	}

	@Override
	public List<BoardListVO> selAdminBoardList(SearchVO searchVo) {
		return boardListDao.selAdminBoardList(searchVo);
	}

	@Override
	public int gTRSearchBoardList(SearchVO searchVo) {
		return boardListDao.gTRSearchBoardList(searchVo);
	}

	@Override
	public int insertBoardList(BoardListVO boardListVo) {
		return boardListDao.insertBoardList(boardListVo);
	}

	@Override
	public int updateBoardList(BoardListVO boardListVo) {
		return boardListDao.updateBoardList(boardListVo);
	}

	@Override
	public BoardListVO boardListByboardlistNo(int boardlistNo) {
		return boardListDao.boardListByboardlistNo(boardlistNo);
	}

	@Override
	public int boardlistCount(int boardlistNo) {
		return boardListDao.boardlistCount(boardlistNo);
	}

	@Override
	public int deleteboardList(int boardlistNo) {
		return boardListDao.deleteboardList(boardlistNo);
	}

	@Override
	public List<BoardListVO> seldeptBoard() {
		return boardListDao.seldeptBoard();
	}

	@Override
	public List<Map<String, Object>> selBoardlistWriteCount(EmpSearchVO searchVo) {
		return boardListDao.selBoardlistWriteCount(searchVo);
	}
}
