package com.ez.gw.report.model;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

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
	public List<Map<String, Object>> selectReportClub() {
		return reportDao.selectReportClub();
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

}
