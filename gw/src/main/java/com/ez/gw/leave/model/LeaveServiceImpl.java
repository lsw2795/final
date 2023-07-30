package com.ez.gw.leave.model;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class LeaveServiceImpl implements LeaveService{
	private final LeaveDAO leaveDao;
	
	
}
