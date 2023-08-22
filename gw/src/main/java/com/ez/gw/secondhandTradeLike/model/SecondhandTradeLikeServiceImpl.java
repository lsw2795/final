package com.ez.gw.secondhandTradeLike.model;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class SecondhandTradeLikeServiceImpl implements SecondhandTradeLikeService{
	private static final Logger logger = LoggerFactory.getLogger(SecondhandTradeLikeServiceImpl.class);
	private final SecondhandTradeLikeDAO secondLikeDao;
	
	@Override
	public int likeHeart(SecondhandTradeLikeVO secondLikeVo) {
		return secondLikeDao.likeHeart(secondLikeVo);
	}
	
	@Override
	public int disLikeHeart(int empNo, int tradeNo) {
		return secondLikeDao.disLikeHeart(empNo, tradeNo);
	}

	@Override
	public int findLike(int empNO, int tradeNo) {
		return secondLikeDao.findLike(empNO, tradeNo);
	}
}
