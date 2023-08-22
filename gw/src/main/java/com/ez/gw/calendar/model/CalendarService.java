package com.ez.gw.calendar.model;

import java.util.List;

public interface CalendarService {
	int insertCalendar(CalendarVO calVo);
	List<CalendarVO> calendarList();
}
