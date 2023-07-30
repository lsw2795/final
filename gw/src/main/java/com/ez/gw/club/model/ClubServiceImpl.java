package com.ez.gw.club.model;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ClubServiceImpl implements ClubService{
	private final ClubDAO clubDAO;
}
