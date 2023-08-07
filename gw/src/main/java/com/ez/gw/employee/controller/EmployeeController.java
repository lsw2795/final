package com.ez.gw.employee.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ez.gw.employee.model.EmployeeService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping()
public class EmployeeController {
	private static final Logger logger=LoggerFactory.getLogger(EmployeeController.class);
	private final EmployeeService employeeService;
	
	
}
























