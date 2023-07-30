package com.ez.gw.documentform.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ez.gw.documentform.model.DocumentFormService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping()
public class DocumentFormController {
	private static final Logger logger=LoggerFactory.getLogger(DocumentFormController.class);
	private final DocumentFormService documentFormService;


}
