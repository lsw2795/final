package com.ez.gw.report.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ReportDAO {
	int insertReport(ReportVO reportVo); //동호회 신고
	List<Map<String, Object>> selectReportClub(); //관리자 동호회 신고함
	int anonymousBoardReport(ReportVO reportVo);
	int anonymousCommentReport(ReportVO reportVo);
	int searchAnonymousBoardReport(ReportVO reportVo);
	int searchAnonymousCommentReport(ReportVO reportVo);
	List<Map<String, Object>> anonymousReportList(ReportVO reportVo);
	int getTotalAnonymousReport(ReportVO reportVo);
	int searchEmpNo(ReportVO reportVo);
	int dupClubBoardReport(ReportVO reportVo); //동호회 
}
