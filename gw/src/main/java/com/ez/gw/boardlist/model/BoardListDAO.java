package com.ez.gw.boardlist.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ez.gw.common.SearchVO;

@Mapper
public interface BoardListDAO {
	List<BoardListVO> selectBoardList(); //게시판 목록 조회
	List<BoardListVO> selAdminBoardList(SearchVO searchVo); //관리자 - 통합게시판 관리 목록 조회
	int gTRSearchBoardList(SearchVO searchVo); //관리자 - 통합게시판 관리 목록 검색결과 총 레코드
	int insertBoardList(BoardListVO boardListVo); // 게시판 등록
	int updateBoardList(BoardListVO boardListVo); // 게시판 수정
	BoardListVO boardListByboardlistNo(int boardlistNo); //게시판번호로 상세정보 조회
}
