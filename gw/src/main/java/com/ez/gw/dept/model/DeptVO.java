package com.ez.gw.dept.model;

import lombok.Data;

@Data
public class DeptVO { //부서
	private int deptNo; //부서번호 NOT NULL(PK)       
	private String name; //부서명 NOT NULL 
	private int manager; //부서책임자 (EMPLOYEE FK)        
	private int upperDept; //상위부서(상위부서의 부서번호가 들어감)       
	private int deptLevel; //부서레벨
}
