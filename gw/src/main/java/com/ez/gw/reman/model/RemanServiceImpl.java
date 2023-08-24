package com.ez.gw.reman.model;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
@Transactional
public class RemanServiceImpl implements RemanService{
	private final RemanDAO remanDao;

	@Override
	public int insertOfficeProduct(RemanVO remanVo) {
		return remanDao.insertOfficeProduct(remanVo);
	}

	@Override
	public List<RemanVO> selectOfficeProductByCategory(String category) {
		return remanDao.selectOfficeProductByCategory(category);
	}

	@Override
	public int multiDelReman(List<RemanVO> remanList) {
		int cnt = 0;
		try {
			for(RemanVO vo : remanList) {
				int remanNo = vo.getRemanNo();
				if(remanNo!=0) {
					cnt = remanDao.deleteReman(remanNo);
				}
			}//for
		}catch(RuntimeException e) {
			e.printStackTrace();
			cnt = -1;
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		return cnt;
	}

	@Override
	public RemanVO selectRemanByNo(int remanNo) {
		return remanDao.selectRemanByNo(remanNo);
	}

	@Override
	public int updateReman(RemanVO remanVo) {
		return remanDao.updateReman(remanVo);
	}
}
