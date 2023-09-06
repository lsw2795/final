package com.ez.gw.comments.model;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ez.gw.common.EmpSearchVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CommentsServiceImpl implements CommentsService{
	private final CommentsDAO commentsDao;

	@Override
	public int insertQnaReply(CommentsVO vo) {
		return commentsDao.insertQnaReply(vo);
	}

	@Override
	public List<Map<String, Object>> selectQnaReplys(int boardNo) {
		return commentsDao.selectQnaReplys(boardNo);
	}

	@Override
	public int selectCountReply(int boardNo) {
		return commentsDao.selectCountReply(boardNo);
	}

	@Override
	public int insertAnonymousReply(CommentsVO vo) {
		return commentsDao.insertAnonymousReply(vo);
	}

	@Override
	public List<CommentsVO> anonymousAllReply() {
		return commentsDao.anonymousAllReply();
	}
	
	@Override
	@Transactional
	public int reply(CommentsVO vo) {
		int cnt=commentsDao.updateSortNo(vo);
		cnt=commentsDao.insertReply(vo);
		
		return cnt;
	}

	@Override
	public int updateAnonymousComments(CommentsVO vo) {
		return commentsDao.updateAnonymousComments(vo);
	}

	@Override
	public int deleteAnonymousComments(int commentNo) {
		return commentsDao.deleteAnonymousComments(commentNo);
	}

	@Override
	public List<Map<String, Object>> countComment() {
		return commentsDao.countComment();
	}

	@Override
	public Map<String, Object> anonymousCommentByCommentNo(int commentNo) {
		return commentsDao.anonymousCommentByCommentNo(commentNo);
	}

	@Override
	public int updateCommentReport(int commentNo) {
		return commentsDao.updateCommentReport(commentNo);
	}

	@Override
	public int insertDeptBoardCM(CommentsVO vo) {
		return commentsDao.insertDeptBoardCM(vo);
	}

	@Override
	public List<Map<String, Object>> selectDeptBoardCM(EmpSearchVO searchVo) {
		return commentsDao.selectDeptBoardCM(searchVo);
	}

	@Override
	public int updateDeptBoardCM(CommentsVO vo) {
		return commentsDao.updateDeptBoardCM(vo);
	}

	@Override
	public int deleteDeptBoardCM(CommentsVO vo) {
		return commentsDao.deleteDeptBoardCM(vo);
	}

	@Override
	@Transactional
	public int reply2(CommentsVO vo) {
		int cnt=commentsDao.updateSortNo(vo);
		cnt=commentsDao.insertReply2(vo);
		
		return cnt;
	}

	@Override
	public int selCountDeptBoardReply(int boardNo) {
		return commentsDao.selCountDeptBoardReply(boardNo);
	}

	@Override
	public int gTRCommentCount(EmpSearchVO searchVo) {
		return commentsDao.gTRCommentCount(searchVo);
	}

	@Override
	public int deleteQnaComment(int commentNo) {
		return commentsDao.deleteQnaComment(commentNo);
	}

	@Override
	public int updateQnaComment(CommentsVO commentsVo) {
		return commentsDao.updateQnaComment(commentsVo);
	}

	
	
}
