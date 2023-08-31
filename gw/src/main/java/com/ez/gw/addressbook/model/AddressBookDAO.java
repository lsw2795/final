package com.ez.gw.addressbook.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ez.gw.common.EmpSearchVO;

@Mapper
public interface AddressBookDAO {
	List<AddressBookVO> selectAll(EmpSearchVO searchVo);
	int gTRSearchCount(EmpSearchVO searchVo);
	int insertAddr(AddressBookVO vo);
	AddressBookVO selAddrByAddrNo(int addrbookNo);
	int updateAddr(AddressBookVO vo);
	int deleteAddr(int addrbookNo);
}
