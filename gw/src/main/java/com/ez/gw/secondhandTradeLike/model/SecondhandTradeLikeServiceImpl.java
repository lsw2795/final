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
	public int insertFirstHeart(SecondhandTradeLikeVO secondLikeVo) {
		return secondLikeDao.insertFirstHeart(secondLikeVo);
	}
	
	@Override
	public int disLikeHeart(int empNo, int tradeNo) {
		return secondLikeDao.disLikeHeart(empNo, tradeNo);
	}

	@Override
	public String findLike(int empNO, int tradeNo) {
		return secondLikeDao.findLike(empNO, tradeNo);
	}

	@Override
	public int findLikeCount(int empNo, int tradeNo) {
		return secondLikeDao.findLikeCount(empNo, tradeNo);
	}

	@Override
	public int likeHeart(int empNo, int tradeNo) {
		return secondLikeDao.likeHeart(empNo, tradeNo);
	}

}
