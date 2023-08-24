package com.ez.gw.secondhandTradeLike.model;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface SecondhandTradeLikeDAO {
	int insertFirstHeart(SecondhandTradeLikeVO secondLikeVo);
	int disLikeHeart(int empNo, int tradeNo);
	int likeHeart(int empNo, int tradeNo);
	String findLike(@Param("empNo") int empNo, @Param("tradeNo") int tradeNo);
	int findLikeCount(@Param("empNo") int empNo, @Param("tradeNo") int tradeNo);
	
}
