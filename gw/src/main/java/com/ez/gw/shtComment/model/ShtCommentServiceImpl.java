package com.ez.gw.shtComment.model;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ShtCommentServiceImpl implements ShtCommentService {
	private final ShtCommentDAO shtCommentDao; 
}
