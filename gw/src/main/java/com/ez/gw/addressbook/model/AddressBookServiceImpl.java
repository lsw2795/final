package com.ez.gw.addressbook.model;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AddressBookServiceImpl implements AddressBookService{
	private final AddressBookDAO addressBookDao;
	
	
}
