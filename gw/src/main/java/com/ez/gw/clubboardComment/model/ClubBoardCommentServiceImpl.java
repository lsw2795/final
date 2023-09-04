package com.ez.gw.clubboardComment.model;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ClubBoardCommentServiceImpl implements ClubBoardCommentService{
	private final ClubBoardCommentDAO cludBoardCommentDao;

	@Override
	public int insertClubCommt(ClubBoardCommentVO cbcVo) {
		return cludBoardCommentDao.insertClubCommt(cbcVo);
	}

	@Override
	public List<Map<String, Object>> selectCommClub(int clubNo, int boardNo) {
		return cludBoardCommentDao.selectCommClub(clubNo, boardNo);
	}

	@Override
	public int selectCountComment(int clubNo, int boardNo) {
		return cludBoardCommentDao.selectCountComment(clubNo, boardNo);
	}

	@Override
	public int deletCommet(int commentNo,int clubNo, int boardNo) {
		return cludBoardCommentDao.deletCommet(commentNo, clubNo, boardNo);
	}

	@Override
	public int editCommet(ClubBoardCommentVO cbcVo) {
		return cludBoardCommentDao.editCommet(cbcVo);
	}
}
