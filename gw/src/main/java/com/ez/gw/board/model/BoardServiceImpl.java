package com.ez.gw.board.model;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

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





}
