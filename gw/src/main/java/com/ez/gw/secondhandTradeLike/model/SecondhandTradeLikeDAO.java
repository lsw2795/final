package com.ez.gw.secondhandTradeLike.model;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface SecondhandTradeLikeDAO {
	int likeHeart(SecondhandTradeLikeVO secondLikeVo);
	int disLikeHeart(int empNo, int tradeNo);
	int findLike(@Param("empNo") int empNo, @Param("tradeNo") int tradeNo);
	
}
