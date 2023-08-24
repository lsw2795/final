package com.ez.gw.secondhandTradeLike.model;

import org.apache.ibatis.annotations.Param;

public interface SecondhandTradeLikeService {
	int insertFirstHeart(SecondhandTradeLikeVO secondLikeVo);
	int disLikeHeart(int likeNo, int tradeNo);
	int likeHeart(int empNo, int tradeNo);
	String findLike(int empNO, int tradeNo);
	int findLikeCount(@Param("empNo") int empNo, @Param("tradeNo") int tradeNo);
}
