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

	@Override
	public int insertAddr(AddressBookVO vo) {
		return addressBookDao.insertAddr(vo);
	}

	@Override
	public AddressBookVO selAddrByAddrNo(int addrbookNo) {
		return addressBookDao.selAddrByAddrNo(addrbookNo);
	}

	@Override
	public int updateAddr(AddressBookVO vo) {
		return addressBookDao.updateAddr(vo);
	}
	
	
}
