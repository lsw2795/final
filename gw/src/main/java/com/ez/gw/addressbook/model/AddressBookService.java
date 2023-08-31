package com.ez.gw.addressbook.model;

import java.util.List;

import com.ez.gw.common.EmpSearchVO;

public interface AddressBookService {
	List<AddressBookVO> selectAll(EmpSearchVO searchVo);
	int gTRSearchCount(EmpSearchVO searchVo);
	int insertAddr(AddressBookVO vo);
	AddressBookVO selAddrByAddrNo(int addrbookNo);
	int updateAddr(AddressBookVO vo);
	int deleteMulti(List<AddressBookVO> list);
}
