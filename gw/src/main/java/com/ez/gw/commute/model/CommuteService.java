package com.ez.gw.commute.model;

import java.util.List;
import java.util.Map;

public interface CommuteService {
	List<Map<String, Object>> selectCommuteByEmpNo(int empNo);

	
}
