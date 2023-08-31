package com.ez.gw.calendar.model;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CalendarServiceImpl implements CalendarService {
	private final CalendarDAO calendarDao;

	@Override
	public int insertCalendar(CalendarVO calVo) {
		return calendarDao.insertCalendar(calVo);
	}

	@Override
	public List<CalendarVO> calendarList(int empNo) {
		return calendarDao.calendarList(empNo);
	}

	@Override
	public List<Map<String, Object>> calendarAllDept(int deptNo) {
		return calendarDao.calendarAllDept(deptNo);
	}

	@Override
	public CalendarVO selectCalendarByNo(int calendarNo) {
		return calendarDao.selectCalendarByNo(calendarNo);
	}

	@Override
	public int updateCalendar(CalendarVO calVo) {
		return calendarDao.updateCalendar(calVo);
	}

	@Override
	public int deleteCalendar(int calendarNo) {
		return calendarDao.deleteCalendar(calendarNo);
	}

}
