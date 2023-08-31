package com.ez.gw.calendar.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CalendarDAO {
	int insertCalendar(CalendarVO calVo);
	List<CalendarVO> calendarList(int empNo);
	List<Map<String, Object>> calendarAllDept(int deptNo);
	CalendarVO selectCalendarByNo(int calendarNo);
	int updateCalendar(CalendarVO calVo);
	int deleteCalendar(int calendarNo);
}
