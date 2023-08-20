package com.ez.gw.state.model;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class StateServiceImpl implements StateService{
	private final StateDAO stateDao;

	@Override
	public List<StateVO> selectAllState() {
		return stateDao.selectAllState();
	}
}
