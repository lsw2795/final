package com.ez.gw.clubboardComment.model;

import java.util.List;
import java.util.Map;

public interface ClubBoardCommentService {
	int insertClubCommt(ClubBoardCommentVO cbcVo);
	List<Map<String, Object>> selectCommClub(int clubNo, int boardNo);
	int selectCountComment(int clubNo, int boardNo); //답변 개수
	int deletCommet(int commentNo, int clubNo, int boardNo);
	int editCommet(ClubBoardCommentVO cbcVo);
}
