package com.ez.gw.documentform.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	
	@RequestMapping("/formDelete")
	public String deleteForm(@RequestParam (required = true) int[] delFormNo,Model model) {
		logger.info("문서양식 삭제 파라미터 delFormNo={}",delFormNo);
		
		int cnt=documentFormService.formDelete(delFormNo);
		
		String msg="양식 삭제 중 에러가 발생했습니다.",url="/document/formList";
		if(cnt>0) {
			msg="양식이 삭제되었습니다.";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
	}
	
	@RequestMapping("/formInsert")
	public String formInsert(@ModelAttribute DocumentFormVO vo,Model model) {
		logger.info("문서양식 추가 파라미터 vo={}",vo);
		
		int cnt=documentFormService.formInsert(vo);
		
		String msg="양식 추가 중 에러가 발생했습니다.",url="/document/formList";
		if(cnt>0) {
			msg="양식이 추가되었습니다.";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
	}
	
	@RequestMapping("/formEdit")
	public String formEdit(@ModelAttribute DocumentFormVO vo,Model model) {
		logger.info("문서양식 수정 파라미터 vo={}",vo);
		
		int cnt=documentFormService.formUpdate(vo);
		
		String msg="양식 수정 중 에러가 발생했습니다.",url="/document/formList";
		if(cnt>0) {
			msg="양식이 수정되었습니다.";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
	}
	
	@ResponseBody
	@RequestMapping("/searchFormNameAjax")
	public int searchFormNameAjax(@RequestParam (required = true) String formName,
			@RequestParam (defaultValue = "0") int documentNo) {
		logger.info("양식 추가 전 제목 유효성 검사 파라미터 formName={},documentNo={}",formName,documentNo);
		
		int cnt=documentFormService.searchName(formName);
		if(documentNo!=0) {
			if(cnt>0) {
				DocumentFormVO vo=documentFormService.selectFormByNo(documentNo);
				if(vo.getFormName().equals(formName)) {
					cnt=0;
				}
			}
		}
		
		logger.info("제목 유효성 검사 결과 cnt={}",cnt);
		
		return cnt;
	}
	
	@ResponseBody
	@RequestMapping("/editSetAjax")
	public DocumentFormVO editSetAjax(@RequestParam (required = true) int documentNo) {
		logger.info("수정 세팅 파라미터 documentNo={}",documentNo);
		
		DocumentFormVO vo=documentFormService.selectFormByNo(documentNo);
		logger.info("문서양식 조회 결과 vo={}",vo);
		
		return vo;
	}

}
