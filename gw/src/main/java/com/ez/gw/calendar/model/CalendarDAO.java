package com.ez.gw.calendar.model;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CalendarDAO {
	int insertCalendar(CalendarVO calVo);

}
