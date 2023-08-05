package com.ez.gw.confirm.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ez.gw.confirm.model.ConfirmService;
import com.ez.gw.documentform.model.DocumentFormService;
import com.ez.gw.documentform.model.DocumentFormVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/approval")
@RequiredArgsConstructor
public class ConfirmController {
	private static final Logger logger = LoggerFactory.getLogger(ConfirmController.class);
    private final ConfirmService confirmService; 
    private final DocumentFormService documentFormService; 
    
    @GetMapping("/approvalWrite")
    public String approvalWrite_get(Model model ) {
    	//1
    	logger.info("결재 작성 페이지");
    	
    	//2
    	List<DocumentFormVO> formList = documentFormService.selectAllForm();
    	
    	//3
    	model.addAttribute("formList",formList);
    	logger.info("결재 양식 리스트 formList.size={}",formList.size());
    	
    	return "approval/approvalWrite";
    }
}
