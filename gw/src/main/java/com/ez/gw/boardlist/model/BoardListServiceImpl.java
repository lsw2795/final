package com.ez.gw.boardlist.model;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BoardListServiceImpl implements BoardListService {
	private final BoardListDAO boardListDao;

	@Override
	public List<BoardListVO> selectBoardList() {
		return boardListDao.selectBoardList();
	}
}
