package com.ez.gw.confirm.model;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ConfirmServiceImpl implements ConfirmService{
	private final ConfirmDAO confirmDao;
}