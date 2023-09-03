package com.ez.gw.clubboardComment.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ClubBoardCommentDAO {
	int insertClubCommt(ClubBoardCommentVO cbcVo);
	List<Map<String, Object>> selectCommClub(int clubNo, int boardNo); //답변들 조회
	int selectCountComment(int clubNo, int boardNo); //답변 개수
	int deletCommet(int commentNo);
	int editCommet(ClubBoardCommentVO cbcVo);
}
