package com.ez.gw.api;


import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ez.gw.api.model.PaPagoService;
import com.ez.gw.api.model.PapagoVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping
public class PaPagoController {
	private static final Logger logger = LoggerFactory.getLogger(PaPagoController.class);
	private final PaPagoService papagoService;
		
	@RequestMapping("/inc/papagoApi")
	public String papagoApi() {
		return "inc/papagoApi";
	}
	
	@RequestMapping("/inc/papagoApi2")
	public String papagoApi2(Model model) {
		String test = papagoService.test();
		logger.info("test={}", test);
		
		model.addAttribute("message", test);
		
		return "inc/papagoApi";
	}
	
	@RequestMapping("/inc/papagoApi3")
	public String test3(@RequestParam(value = "korean", defaultValue = "-")String korean,
						Model model) {		
		PapagoVO dd = new PapagoVO();
		dd.setKorean(korean);
		String japanese = papagoService.getJapanese(dd);
		String english = papagoService.getEnglish(dd);
		model.addAttribute("japanese", japanese);
		model.addAttribute("english", english);
		
		return "inc/papagoApi";
	}
	
	@RequestMapping("/english")
	@ResponseBody
	public Map<String, String> english(@RequestParam(value = "korean", defaultValue = "-")String korean,
	                                    Model model) throws Exception{        
	    PapagoVO dd = new PapagoVO();
	    dd.setKorean(korean);        
	    String english = papagoService.getEnglish(dd);
	    
	    Map<String, String> response = new HashMap<>();
	    response.put("english", english);
	    return response;
	}
	
	
}
