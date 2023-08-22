package com.ez.gw.confirmLine.model;

import java.util.List;
import java.util.Map;

public interface ConfirmLineService {
	int insertConfirmLine(ConfirmLineVO vo);
	List<Map<String, Object>> selectByEmpNo(int empNo);
	int deleteLine(int confirmLineNo);
	ConfirmLineVO selectByConfirmLineNo(int confirmLineNo);
}
