package com.ez.gw.api;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping
public class PaPagoController {
	private static final Logger logger = LoggerFactory.getLogger(PaPagoController.class);

	@RequestMapping("/inc/papagoApi")
	public String papagoApi() {
		return "inc/papagoApi";
	}
	
	
}
