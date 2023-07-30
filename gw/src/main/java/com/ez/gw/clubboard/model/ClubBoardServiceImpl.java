package com.ez.gw.clubboard.model;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ClubBoardServiceImpl implements ClubBoardService{
	private final ClubBoardDAO clubboardDao;
}
