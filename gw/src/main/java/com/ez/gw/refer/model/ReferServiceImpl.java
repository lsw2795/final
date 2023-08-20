package com.ez.gw.refer.model;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ReferServiceImpl implements ReferService {
	private final ReferDAO referDao;

}
