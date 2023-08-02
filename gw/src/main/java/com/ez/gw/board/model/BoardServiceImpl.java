package com.ez.gw.board.model;

import java.util.List;

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
	public List<BoardVO> selectQnaAll() {
		return boardDao.selectQnaAll();
	}

	@Override
	public BoardVO selectQna(int boardNo) {
		return boardDao.selectQna(boardNo);
	}

}
