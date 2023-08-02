package com.ez.gw.board.model;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

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
	public List<Map<String, Object>> selectQnaAll() {
		return boardDao.selectQnaAll();
	}

	@Override
	public Map<String, Object> selectQna(int boardNo) {
		return boardDao.selectQna(boardNo);
	}

	@Override
	public int updateReadcount(int boardNo) {
		return boardDao.updateReadcount(boardNo);
	}





}
