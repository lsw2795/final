package com.ez.gw.calendar.model;

import java.util.List;
import java.util.Map;

public interface CalendarService {
	int insertCalendar(CalendarVO calVo);
	List<CalendarVO> calendarList(int empNo);
	List<Map<String, Object>> calendarAllDept(int deptNo);
	CalendarVO selectCalendarByNo(int calendarNo);
	int updateCalendar(CalendarVO calVo);
	int deleteCalendar(int calendarNo);
}
