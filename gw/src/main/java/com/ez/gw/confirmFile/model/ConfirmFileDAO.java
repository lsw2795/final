package com.ez.gw.confirmFile.model;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ConfirmFileDAO {
	int insertConfirmFile(ConfirmFileVO confirmFileVo);
}
