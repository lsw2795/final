package com.ez.gw.comments.model;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CommentsServiceImpl implements CommentsService{
	private final CommentsDAO commentsDao;
	
}
