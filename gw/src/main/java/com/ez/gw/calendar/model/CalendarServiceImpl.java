package com.ez.gw.calendar.model;

import java.util.List;

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
	public List<CalendarVO> calendarList() {
		return calendarDao.calendarList();
	}

}
