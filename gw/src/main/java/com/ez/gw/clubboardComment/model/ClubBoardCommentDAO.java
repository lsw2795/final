package com.ez.gw.clubboardComment.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface ClubBoardCommentDAO {
	int insertClubCommt(ClubBoardCommentVO cbcVo);
	List<Map<String, Object>> selectCommClub(int clubNo, int boardNo); //답변들 조회
	int selectCountComment(int clubNo, int boardNo); //답변 개수
	int deletCommet(@Param("commentNo")int commentNo, @Param("clubNo")int clubNo, @Param("boardNo")int boardNo);
	int editCommet(ClubBoardCommentVO cbcVo);
}
