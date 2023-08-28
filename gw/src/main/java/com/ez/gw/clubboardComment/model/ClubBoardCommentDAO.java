package com.ez.gw.clubboardComment.model;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ClubBoardCommentDAO {
	int insertClubComm(ClubBoardCommentVO cbcVo);

}
