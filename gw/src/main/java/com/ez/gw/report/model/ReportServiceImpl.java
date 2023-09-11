package com.ez.gw.report.model;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.ez.gw.common.SearchVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ReportServiceImpl implements ReportService {
	private final ReportDAO reportDao;

	@Override
	public int insertReport(ReportVO reportVo) {
		return reportDao.insertReport(reportVo);
	}

	@Override
	public List<Map<String, Object>> selectReportClub(SearchVO searchVo) {
		return reportDao.selectReportClub(searchVo);
	}

	@Override
	public int reportStatus(int reportStatus) {
		int result=0;
		
		if(reportStatus==1) {
			result=STANBY_REPORT;
		}else if(reportStatus==2) {
			result=CLEAR_REPORT;			
		}
		
		return result;
	}

	@Override
	public int anonymousBoardReport(ReportVO reportVo) {
		return reportDao.anonymousBoardReport(reportVo);
	}

	@Override
	public int searchAnonymousBoardReport(ReportVO reportVo) {
		return reportDao.searchAnonymousBoardReport(reportVo);
	}

	@Override
	public int searchAnonymousCommentReport(ReportVO reportVo) {
		return reportDao.searchAnonymousCommentReport(reportVo);
	}

	@Override
	public int anonymousCommentReport(ReportVO reportVo) {
		return reportDao.anonymousCommentReport(reportVo);
	}

	@Override
	public List<Map<String, Object>> anonymousReportList(ReportVO reportVo) {
		return reportDao.anonymousReportList(reportVo);
	}

	@Override
	public int getTotalAnonymousReport(ReportVO reportVo) {
		return reportDao.getTotalAnonymousReport(reportVo);
	}

	@Override
	public Map<String, Object> selectByReportNo(int reportNo) {
		return reportDao.selectByReportNo(reportNo);
	}

	@Override
	public int updateAnonymousReport(int reportNo) {
		return reportDao.updateAnonymousReport(reportNo);
	}

	@Override
	public int updateAnonymousReportPostpone(int reportNo) {
		return reportDao.updateAnonymousReportPostpone(reportNo);
	}
	
	@Override
	public int dupClubBoardReport(ReportVO reportVo) {
		return reportDao.dupClubBoardReport(reportVo);
	}

	@Override
	public int searchEmpNo(ReportVO reportVo) {
		return reportDao.searchEmpNo(reportVo);
	}

	@Override
	public Map<String, Object> clubByReportNo(int reportNo) {
		return reportDao.clubByReportNo(reportNo);
	}

	@Override
	public int anonymousReportCount() {
		return reportDao.anonymousReportCount();
	}

	@Override
	public int warningMarket(ReportVO reportVo) {
		return reportDao.warningMarket(reportVo);
	}

	@Override
	public int searchWarningMarket(ReportVO reportVo) {
		return reportDao.searchWarningMarket(reportVo);
	}

	@Override
	public List<Map<String, Object>> selectReportMarket(SearchVO searchVo) {
		return reportDao.selectReportMarket(searchVo);
	}

	@Override
	public int deleteMarket(int reportNo) {
		return reportDao.deleteMarket(reportNo);
	}

	@Override
	public int anonymousMarketReportCount() {
		return reportDao.anonymousMarketReportCount();
	}


}
