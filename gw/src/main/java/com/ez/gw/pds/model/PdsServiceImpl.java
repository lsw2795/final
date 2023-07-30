package com.ez.gw.pds.model;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class PdsServiceImpl implements PdsService {
	private final PdsDAO pdsDao;
	
	
}
