package com.ez.gw.mycalendar.model;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MyCalendarServiceImpl implements MyCalendarService {
	private final MyCalendarDAO myCalendarDao;
	
	
}
