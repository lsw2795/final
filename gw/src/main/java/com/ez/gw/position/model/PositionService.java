package com.ez.gw.position.model;

import java.util.List;

public interface PositionService {
	PositionVO positionByNo(int positionNo);
	List<PositionVO> selectAllPosition(); //직위 전체조회
}
