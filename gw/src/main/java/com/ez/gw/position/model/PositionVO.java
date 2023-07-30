package com.ez.gw.position.model;

import lombok.Data;

@Data
public class PositionVO { //직책
	private int positionNo; //직책코드
	private String positionName; //직책명
	private int positionRank; //직책서열
}
