package com.ez.gw.secondhandTradeLike.model;

public interface SecondhandTradeLikeService {
	int likeHeart(SecondhandTradeLikeVO secondLikeVo);
	int disLikeHeart(SecondhandTradeLikeVO secondLikeVo);
	int findLike(SecondhandTradeLikeVO secondLikeVo);
}
