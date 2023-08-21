package com.ez.gw.calendar.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CalendarDAO {
	int insertCalendar(CalendarVO calVo);
	List<CalendarVO> calendarList();
}
