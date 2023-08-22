package com.ez.gw.secondhandTradeLike.model;

public interface SecondhandTradeLikeService {
	int likeHeart(SecondhandTradeLikeVO secondLikeVo);
	int disLikeHeart(int likeNo, int tradeNo);
	int findLike(int empNO, int tradeNo);
}
