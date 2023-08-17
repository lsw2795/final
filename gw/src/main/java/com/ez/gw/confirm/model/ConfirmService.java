package com.ez.gw.confirm.model;

import java.util.List;
import java.util.Map;

import com.ez.gw.deptagree.model.DeptagreeVO;

public interface ConfirmService {
	int insertConfirm(ConfirmVO vo,DeptagreeVO deptAgreeVo,int[] reperEmpNo,List<Map<String, Object>> fileList);
	List<Map<String, Object>> selectAllByEmpNo(int empNo);
}
