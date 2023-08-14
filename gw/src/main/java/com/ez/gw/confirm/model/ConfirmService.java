package com.ez.gw.confirm.model;

import com.ez.gw.deptagree.model.DeptagreeVO;

import jakarta.servlet.http.HttpServletRequest;

public interface ConfirmService {
	int insertConfirm(ConfirmVO vo,DeptagreeVO deptAgreeVo,int[] reperEmpNo,HttpServletRequest request);
}
