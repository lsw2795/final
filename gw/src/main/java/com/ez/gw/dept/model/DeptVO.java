package com.ez.gw.dept.model;

import lombok.Data;

@Data
public class DeptVO {
	private int deptNo; //DEPT_NO    NOT NULL NUMBER       
	private String name; //NAME       NOT NULL VARCHAR2(50) 
	private int manager; //MANAGER             NUMBER       
	private int upperDept; //UPPER_DEPT          NUMBER       
	private int deptLevel; //DEPT_LEVEL          NUMBER
}
