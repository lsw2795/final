package com.ez.gw.secondhandTradeLike.model;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.ez.gw.board.model.BoardVO;

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

	@Override
	public int insertDeptBoardLike(SecondhandTradeLikeVO secondLikeVo) {
		return secondLikeDao.insertDeptBoardLike(secondLikeVo);
	}

	@Override
	public SecondhandTradeLikeVO selectLikeFlag(SecondhandTradeLikeVO secondLikeVo) {
		return secondLikeDao.selectLikeFlag(secondLikeVo);
	}

	@Override
	public int updateLikeOff(SecondhandTradeLikeVO secondLikeVo) {
		return secondLikeDao.updateLikeOff(secondLikeVo);
	}

	@Override
	public int updateLikeOn(SecondhandTradeLikeVO secondLikeVo) {
		return secondLikeDao.updateLikeOn(secondLikeVo);
	}

	@Override
	public int deptBoardLikeCount(int boardNo) {
		return secondLikeDao.deptBoardLikeCount(boardNo);
	}

	@Override
	public SecondhandTradeLikeVO selectLikeByEmpNo(SecondhandTradeLikeVO likeVo) {
		return secondLikeDao.selectLikeByEmpNo(likeVo);
	}

}
