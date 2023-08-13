package com.ez.gw.pds.model;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ez.gw.board.model.BoardVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
@Transactional
public class PdsServiceImpl implements PdsService {
	private final PdsDAO pdsDao;

	@Override
	public int insertPds(BoardVO vo) {
		return pdsDao.insertPds(vo);
	}

	@Override
	public List<Map<String, Object>> selectPdsAll() {
		return pdsDao.selectPdsAll();
	}

	@Override
	public Map<String, Object> selectPds(int boardNo) {
		return pdsDao.selectPds(boardNo);
	}

	@Override
	public int updatePds(BoardVO vo) {
		return pdsDao.updatePds(vo);
	}

	@Override
	public int deletePds(int boardNo) {
		return pdsDao.deletePds(boardNo);
	}

	@Override
	public int insertFiles(PdsVO vo) {
		return pdsDao.insertFiles(vo);
	}
	
	
}
