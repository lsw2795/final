package com.ez.gw.addressbook.model;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ez.gw.common.EmpSearchVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AddressBookServiceImpl implements AddressBookService{
	private final AddressBookDAO addressBookDao;

	@Override
	public List<AddressBookVO> selectAll(EmpSearchVO searchVo) {
		return addressBookDao.selectAll(searchVo);
	}

	@Override
	public int gTRSearchCount(EmpSearchVO searchVo) {
		return addressBookDao.gTRSearchCount(searchVo);
	}
	
	
}
