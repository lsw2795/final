package com.ez.gw.report.model;

import java.util.List;
import java.util.Map;

public interface ReportService {
	//신고 처리 상태
	int STANBY_REPORT=1; //신고 대기
	int CLEAR_REPORT=2; //신고 처리 삭제 완료
	
	int insertReport(ReportVO reportVo); //동호회 신고
	List<Map<String, Object>> selectReportClub(); //관리자 동호회 신고함
	int reportStatus(int reportStatus); //동호회 신고 상태
}
