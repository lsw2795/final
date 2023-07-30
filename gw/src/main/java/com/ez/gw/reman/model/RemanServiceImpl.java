package com.ez.gw.reman.model;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class RemanServiceImpl implements RemanService{
	private final RemanDAO remanDao;
}
