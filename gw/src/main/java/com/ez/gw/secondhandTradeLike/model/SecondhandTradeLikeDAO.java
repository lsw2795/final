package com.ez.gw.secondhandTradeLike.model;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SecondhandTradeLikeDAO {
	int likeHeart(SecondhandTradeLikeVO secondLikeVo);
	int disLikeHeart(SecondhandTradeLikeVO secondLikeVo);
	int findLike(SecondhandTradeLikeVO secondLikeVo);
	
}
