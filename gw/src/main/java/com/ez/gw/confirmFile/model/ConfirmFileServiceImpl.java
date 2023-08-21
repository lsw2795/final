package com.ez.gw.confirmFile.model;

import java.util.List;

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

	@Override
	public List<ConfirmFileVO> selectAllFileByDocumentNo(String confirmDocumentNo) {
		return confirmFileDao.selectAllFileByDocumentNo(confirmDocumentNo);
	}
}
