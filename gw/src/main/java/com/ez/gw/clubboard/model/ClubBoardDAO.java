package com.ez.gw.clubboard.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.ez.gw.common.SearchVO;

@Mapper
public interface ClubBoardDAO {
	List<Map<String, Object>> clubBoardView(@Param("clubNo")int clubNo,@Param("searchVo") SearchVO searchVo);
	int insertClubBoard(ClubBoardVO clubVo);
	int updateReadcount(int boardNo); //조회수 증가
	int updateClubBoard(ClubBoardVO clubVo);
	Map<String, Object> detailClubBoard(int clubNo, int boardNo);
	int deleteClubBoard(int boardNo);
	List<Map<String, Object>> selectImg(int clubBoardNo); //이미지만 가져오기
	
	int deleteClubFileOne(@Param("fileName") String fileName ,@Param("clubBoardNo")int clubBoardNo); // 동호회 게시글번호와 삭제대상 파일명으로 해당 파일 삭제 메서드
}
