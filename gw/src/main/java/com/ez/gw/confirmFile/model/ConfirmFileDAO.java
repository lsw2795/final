package com.ez.gw.confirmFile.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ConfirmFileDAO {
	int insertConfirmFile(ConfirmFileVO confirmFileVo);
	List<ConfirmFileVO> selectAllFileByDocumentNo(String confirmDocumentNo);
	int deleteFile(String fileName);
}
