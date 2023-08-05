package com.ez.gw.comments.model;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CommentsServiceImpl implements CommentsService{
	private final CommentsDAO commentsDao;

	@Override
	public int insertQnaReply(CommentsVO vo) {
		return commentsDao.insertQnaReply(vo);
	}

	@Override
	public List<Map<String, Object>> selectQnaReplys(int boardNo) {
		return commentsDao.selectQnaReplys(boardNo);
	}

	@Override
	public int selectCountReply(int boardNo) {
		return commentsDao.selectCountReply(boardNo);
	}

	
}
