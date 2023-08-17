package com.ez.gw.confirmFile.model;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ConfirmFileServiceImpl implements ConfirmFileService{
	private final ConfirmFileDAO confirmFileDao;

	@Override
	public int insertConfirmFile(ConfirmFileVO confirmFileVo) {
		return confirmFileDao.insertConfirmFile(confirmFileVo);
	}
}
