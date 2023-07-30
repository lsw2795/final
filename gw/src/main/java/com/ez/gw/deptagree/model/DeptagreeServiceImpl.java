package com.ez.gw.deptagree.model;

import org.springframework.stereotype.Service;

import com.ez.gw.dept.model.DeptService;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class DeptagreeServiceImpl implements DeptagreeService{
	private final DeptagreeDAO deptagreeDao;
}
