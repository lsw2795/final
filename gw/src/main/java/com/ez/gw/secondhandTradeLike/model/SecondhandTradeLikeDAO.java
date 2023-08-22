package com.ez.gw.secondhandTradeLike.model;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SecondhandTradeLikeDAO {
	int likeHeart(SecondhandTradeLikeVO secondLikeVo);
	int disLikeHeart(int empNo, int tradeNo);
	int findLike(int empNO, int tradeNo);
	
}
