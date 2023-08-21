package com.ez.gw.confirmFile.controller;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ez.gw.common.ConstUtil;
import com.ez.gw.common.FileUploadUtil;
import com.ez.gw.confirmFile.model.ConfirmFileService;

import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/confirmFile")
@RequiredArgsConstructor
public class ConfirmFileController {
	private static final Logger logger = LoggerFactory.getLogger(ConfirmFileController.class);
	private final ConfirmFileService confirmFileService;
	private final FileUploadUtil fileUploadUtil;
	
	
	@RequestMapping("/download")
	public ModelAndView confirmFileDowunload(@RequestParam String fileName,HttpServletRequest request) {
		//1
		logger.info("파일 다운로드 처리, fileName={}", fileName);
		
		//2
		
		//3
		Map<String, Object> map = new HashMap<>();
		String upPath 
		= fileUploadUtil.getUploadPath(request, ConstUtil.CONFIRMFILE_FLAG);
		File file = new File(upPath, fileName);
		map.put("file", file);
		
		//ModelAndView(String viewName, Map<String, ?> model)
		ModelAndView mav = new ModelAndView("confirmDownloadView", map); //첫글자 소문자

		//4
		return mav;
	}
}
