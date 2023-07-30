package com.ez.gw.clubboardComment.model;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ClubBoardCommentServiceImpl implements ClubBoardCommentService{
	private final ClubBoardCommentDAO cludboardDao;
}
