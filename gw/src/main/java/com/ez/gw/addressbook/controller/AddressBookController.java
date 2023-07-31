package com.ez.gw.addressbook.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ez.gw.addressbook.model.AddressBookService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping()
public class AddressBookController {
	private static final Logger logger=LoggerFactory.getLogger(AddressBookController.class);
	private final AddressBookService addressBookService;

}
