package com.ez.gw.secondhandTradeLike.model;

import org.apache.ibatis.annotations.Param;


public interface SecondhandTradeLikeService {
	int insertFirstHeart(SecondhandTradeLikeVO secondLikeVo);
	int disLikeHeart(int likeNo, int tradeNo);
	int likeHeart(int empNo, int tradeNo);
	String findLike(int empNO, int tradeNo);
	int findLikeCount(@Param("empNo") int empNo, @Param("tradeNo") int tradeNo);
	int insertDeptBoardLike(SecondhandTradeLikeVO secondLikeVo);
	SecondhandTradeLikeVO selectLikeFlag(SecondhandTradeLikeVO secondLikeVo);
	int updateLikeOff(SecondhandTradeLikeVO secondLikeVo);
	int updateLikeOn(SecondhandTradeLikeVO secondLikeVo);
	int deptBoardLikeCount(int boardNo);
	SecondhandTradeLikeVO selectLikeByEmpNo(SecondhandTradeLikeVO likeVo);
}
