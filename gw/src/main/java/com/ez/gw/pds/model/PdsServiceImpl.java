package com.ez.gw.pds.model;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ez.gw.board.model.BoardVO;
import com.ez.gw.common.SearchVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
@Transactional
public class PdsServiceImpl implements PdsService {
	private static final Logger logger = LoggerFactory.getLogger(PdsServiceImpl.class);
	private final PdsDAO pdsDao;

	@Override
	public int insertPds(BoardVO vo) {
		return pdsDao.insertPds(vo);
	}

	@Override
	public List<Map<String, Object>> selectPdsAll(SearchVO vo) {
		return pdsDao.selectPdsAll(vo);
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
		int cnt = pdsDao.deletePdsFile(boardNo);
		logger.info("deletePdsFile 파일 매핑 삭제 여부 cnt={}", cnt);
		cnt = pdsDao.deletePds(boardNo);
		logger.info("deletePds 글 매핑 삭제 여부 cnt={}", cnt);
		return cnt;
	}

	@Override
	public int insertFiles(PdsVO vo) {
		return pdsDao.insertFiles(vo);
	}

	@Override
	public List<PdsVO> selectFilesByBoardNo(int boardNo) {
		return pdsDao.selectFilesByBoardNo(boardNo);
	}

	@Override
	public int updateDownloadCount(int boardNo) {
		return pdsDao.updateDownloadCount(boardNo);
	}

	@Override
	public int getTotalRecord(SearchVO vo) {
		return pdsDao.getTotalRecord(vo);
	}

	@Override
	public int selectIsFile(int boardNo) {
		return pdsDao.selectIsFile(boardNo);
	}

	@Override
	public int editPdsFile(int boardNo, String oldFileName) {
		return pdsDao.editPdsFile(boardNo, oldFileName);
	}

	@Override
	public List<PdsVO> selFilesByNotice(int boardNo) {
		return pdsDao.selFilesByNotice(boardNo);
	}





	
	
}
