package com.ez.gw.position.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PositionDAO {
	PositionVO positionByNo(int positionNo);
	List<PositionVO> selectAllPosition(); //직위 전체조회
}
