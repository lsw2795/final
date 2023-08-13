package com.ez.gw.confirm.model;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.stereotype.Service;

import com.ez.gw.common.ConstUtil;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ConfirmServiceImpl implements ConfirmService{
	private final ConfirmDAO confirmDao;

	@Override
	public int insertConfirm(ConfirmVO vo) {
		int cnt=confirmDao.selectCountByDate();
		String cdNo=vo.getConfirmDocumentNo();
		cdNo+="-"+(cnt+1);
		vo.setConfirmDocumentNo(cdNo);
		return confirmDao.insertConfirm(vo);
	}
}
