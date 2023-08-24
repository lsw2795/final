package com.ez.gw.documentform.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ez.gw.common.ConstUtil;
import com.ez.gw.common.PaginationInfo;
import com.ez.gw.documentform.model.DocumentFormService;
import com.ez.gw.documentform.model.DocumentFormVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/document")
public class DocumentFormController {
	private static final Logger logger=LoggerFactory.getLogger(DocumentFormController.class);
	private final DocumentFormService documentFormService;

	@RequestMapping("/formList")
	public String formList(@ModelAttribute DocumentFormVO vo, Model model) {
		//1
		logger.info("문서양식 관리 페이지");
		
		//2
		PaginationInfo pagingInfo=new PaginationInfo();
    	pagingInfo.setBlockSize(ConstUtil.ADMIN_FORMLIST_BLOCK_SIZE);
   		pagingInfo.setCurrentPage(vo.getCurrentPage());
    	pagingInfo.setRecordCountPerPage(ConstUtil.ADMIN_RECORD_COUNT);
    			
    	vo.setRecordCountPerPage(ConstUtil.ADMIN_RECORD_COUNT);
    	vo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		List<DocumentFormVO> formList = documentFormService.selectAllFormPage(vo);
		
		int totalRecord = documentFormService.getTotalRecord(vo);
		logger.info("문서양식 조회결과, totalRecord={}",totalRecord);
		pagingInfo.setTotalRecord(totalRecord);
		
		//3
		model.addAttribute("formList",formList);
		model.addAttribute("pagingInfo",pagingInfo);
		
		//4
		return "approval/document/formList";
	}
	
	@ResponseBody
	@RequestMapping("/formInsertAjax")
	public String formInsert(@ModelAttribute DocumentFormVO vo) {
		logger.info("문서양식 추가 파라미터 vo={}",vo);
		
		int cnt=documentFormService.formInsert(vo);
		
		String msg="양식 추가 중 에러가 발생했습니다.";
		if(cnt>0) {
			msg="양식이 추가되었습니다.";
		}
		
		return msg;
	}

}
