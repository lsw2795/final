package com.ez.gw.position.model;

import com.ez.gw.employee.model.EmployeeVO;

import lombok.Data;

@Data
public class PositionVO extends EmployeeVO{ /* 직위/직책 */
	private int positionNo; /* 직위/직책코드 */
	private String positionName;  /* 직위/직책명 */
	private int positionRank;  /* 서열 */
}
