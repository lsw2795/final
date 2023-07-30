package com.ez.gw.boardlist.model;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BoardListServiceImpl implements BoardListService {
	private final BoardListDAO boardListDao;
}
