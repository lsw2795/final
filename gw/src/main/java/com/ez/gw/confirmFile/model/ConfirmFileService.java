package com.ez.gw.confirmFile.model;

import java.util.List;

public interface ConfirmFileService {
	int insertConfirmFile(ConfirmFileVO confirmFileVo);
	List<ConfirmFileVO> selectAllFileByDocumentNo(String confirmDocumentNo);
}
