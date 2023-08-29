package com.ez.gw.report.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ReportDAO {
	int insertReport(ReportVO reportVo); //동호회 신고
	List<Map<String, Object>> selectReportClub(); //관리자 동호회 신고함
}
