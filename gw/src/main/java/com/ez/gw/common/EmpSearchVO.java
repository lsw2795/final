package com.ez.gw.common;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class EmpSearchVO extends SearchVO{
	private int empNo; //사원번호 

	@Override
	public String toString() {
		return "EmpSearchVO [empNo=" + empNo + ", toString()=" + super.toString() + "]";
	}
	
	
}
