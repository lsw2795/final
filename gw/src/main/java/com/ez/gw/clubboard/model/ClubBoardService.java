package com.ez.gw.clubboard.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.ez.gw.common.SearchVO;

public interface ClubBoardService {
	List<Map<String, Object>> clubBoardView(int clubNo, SearchVO searchVo);
	int insertClubBoard(ClubBoardVO clubVo);
	int updateReadcount(int boardNo); //조회수 증가
	int updateClubBoard(ClubBoardVO clubVo);
	Map<String, Object> detailClubBoard(int clubNo, int boardNo);
	int deleteClubBoard(int boardNo);
	int deleteMulti(List<ClubBoardVO> list); //관리자 다중 삭제
	List<Map<String, Object>> selectImg(int clubBoardNo); //이미지만 가져오기
	
	int deleteClubFileOne(@Param("fileName") String fileName ,@Param("clubBoardNo")int clubBoardNo); // 동호회 게시글번호와 삭제대상 파일명으로 해당 파일 삭제 메서드
}
