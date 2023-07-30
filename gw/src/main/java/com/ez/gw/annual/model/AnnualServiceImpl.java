package com.ez.gw.annual.model;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AnnualServiceImpl implements AnnualService{
	private final AnnualDAO annualDao;
	
}
