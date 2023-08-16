package com.ez.gw.dept.model;

import java.util.List;
import java.util.Map;

import lombok.Data;
@Data
public class DeptAllVO {
	private DeptVO deptVo;
	private List<Map<String, Object>> empList;
}
