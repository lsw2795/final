package com.ez.gw.pds.model;

import java.io.File;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.ez.gw.board.model.BoardVO;
import com.ez.gw.common.ConstUtil;
import com.ez.gw.common.FileUploadUtil;
import com.ez.gw.common.SearchVO;

import jakarta.servlet.http.HttpServletRequest;
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

	@Override
	public List<Map<String, Object>> selectAdminPdsAll(SearchVO searchVo) {
		return pdsDao.selectAdminPdsAll(searchVo);
	}
	@Override
	public int editNoticeFile(int pdsNo) {
		return pdsDao.editNoticeFile(pdsNo);
	}

	@Override
	public int deleteMulti(List<PdsVO> list) {
		int cnt = 0;
		try {
			for(PdsVO vo : list) {
				int pdsNo = vo.getPdsNo();
				if(pdsNo!=0) { //체크된 질문만 삭제
					cnt = pdsDao.deleteAdminFile(pdsNo);
				}
			}//for
		}catch(RuntimeException e) {
			//선언적 트랜잭션에서는 런타임 예외가 발생하면 롤백한다.
			e.printStackTrace();
			cnt=-1;
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		return cnt;
	}

	@Override
	public int getAdminTotalFile(SearchVO searchVo) {
		return pdsDao.getAdminTotalFile(searchVo);
	}

	@Override
	public int deleteBoardMulti(HttpServletRequest request,List<BoardVO> list) {
		int cnt = 0;
		try {
			for(BoardVO vo : list) {
				int boardNo = vo.getBoardNo();
				if(boardNo!=0) { //체크된 질문만 삭제
					List<PdsVO> fileList = pdsDao.selectFilesByBoardNo(boardNo);
					logger.info("게시글 삭제 - 파일 삭제 전 파일 갯수 조회 fileList.size={}", fileList.size());

					if(fileList.size()>0) {
						for(PdsVO pdsVo : fileList) {
							String fileName = pdsVo.getFileName();
							if(fileName!=null && !fileName.isEmpty()) { //파일 삭제
								FileUploadUtil fileUploadUtil = new FileUploadUtil();

								File f = new File(fileUploadUtil.getUploadPath(request, ConstUtil.UPLOAD_FILE_FLAG), fileName);
								logger.info("컨트롤러 파일 f={}", f);
								if(f.exists()) {
									boolean result = f.delete();
									logger.info("글 삭제 - 파일 삭제 여부 : {}", result);
								}
							}//if
						}//for
					}

					cnt = pdsDao.deletePds(boardNo);
					logger.info("몇번삭제 ? cnt={}", cnt);
				}
			}//for
		}catch(RuntimeException e) {
			//선언적 트랜잭션에서는 런타임 예외가 발생하면 롤백한다.
			e.printStackTrace();
			cnt=-1;
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		return cnt;

	}

	@Override
	public int insertPdsByAnonymous(PdsVO vo) {
		return pdsDao.insertPdsByAnonymous(vo);
	}

	@Override
	public List<PdsVO> select24AnonymousImage() {
		return pdsDao.select24AnonymousImage();
	}

	@Override
	public int deleteAnonymousImg(PdsVO vo) {
		return pdsDao.deleteAnonymousImg(vo);
	}
	
	@Override
	public int clubFiles(PdsVO pdsVo) {
		return pdsDao.clubFiles(pdsVo);
	}

	@Override
	public List<PdsVO> selFilesByDeptBoard(BoardVO boardVo) {
		return pdsDao.selFilesByDeptBoard(boardVo);
	}

	@Override
	public int editDeptBoardFile(int pdsNo) {
		return pdsDao.editDeptBoardFile(pdsNo);
	}

	@Override
	public List<BoardVO> selectPdsNew5() {
		return pdsDao.selectPdsNew5();
	}


}







