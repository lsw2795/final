package com.ez.gw.report.model;

import java.util.List;
import java.util.Map;

import com.ez.gw.common.SearchVO;

public interface ReportService {
	//신고 처리 상태
	int STANBY_REPORT=1; //신고 대기
	int CLEAR_REPORT=2; //신고 처리 삭제 완료
	
	int insertReport(ReportVO reportVo); //동호회 신고
	List<Map<String, Object>> selectReportClub(SearchVO searchVo); //관리자 동호회 신고함
	int reportStatus(int reportStatus); //동호회 신고 상태
	int anonymousBoardReport(ReportVO reportVo);
	int searchEmpNo(ReportVO reportVo);
	int dupClubBoardReport(ReportVO reportVo); //동호회 
	int anonymousCommentReport(ReportVO reportVo);
	int searchAnonymousBoardReport(ReportVO reportVo);
	int searchAnonymousCommentReport(ReportVO reportVo);
	List<Map<String, Object>> anonymousReportList(ReportVO reportVo);
	int getTotalAnonymousReport(ReportVO reportVo);
	Map<String, Object> selectByReportNo(int reportNo);
	int updateAnonymousReport(int reportNo);
	int updateAnonymousReportPostpone(int reportNo);
	Map<String, Object> clubByReportNo(int reportNo);
	int anonymousReportCount();
	int searchWarningMarket(ReportVO reportVo);
	int warningMarket(ReportVO reportVo);
	List<Map<String, Object>> selectReportMarket(SearchVO searchVo);
	int deleteMarket(int reportNo);
	int anonymousMarketReportCount();
}
