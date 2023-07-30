package com.ez.gw.commute.model;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CommuteServiceImpl implements CommuteService{
	private final CommuteDAO commuteDao;
}
