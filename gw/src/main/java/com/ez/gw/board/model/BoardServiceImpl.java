package com.ez.gw.board.model;

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

}
