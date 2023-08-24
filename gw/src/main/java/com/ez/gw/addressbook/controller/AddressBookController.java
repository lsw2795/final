package com.ez.gw.addressbook.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ez.gw.addressbook.model.AddressBookService;
import com.ez.gw.addressbook.model.AddressBookVO;
import com.ez.gw.common.ConstUtil;
import com.ez.gw.common.EmpSearchVO;
import com.ez.gw.common.PaginationInfo;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/mypage")
public class AddressBookController {
	private static final Logger logger=LoggerFactory.getLogger(AddressBookController.class);
	private final AddressBookService addressBookService;

	@RequestMapping("/addressBook")
	public String addressBookList(@ModelAttribute EmpSearchVO searchVo,
			HttpSession session, Model model) {
		int empNo=(int)session.getAttribute("empNo");
		searchVo.setEmpNo(empNo);
		logger.info("사원 - 주소록 페이지 파라미터 searchVo={}", searchVo);
		//[1] PaginationInfo 객체 생성
		PaginationInfo pagingInfo=new PaginationInfo();
		pagingInfo.setBlockSize(ConstUtil.BLOCK_SIZE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		//[2] SearchVo에 입력되지 않은 두 개의 변수에 값 셋팅
		searchVo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
	
		int totalRecord=addressBookService.gTRSearchCount(searchVo);
		pagingInfo.setTotalRecord(totalRecord);
		List<AddressBookVO> list=addressBookService.selectAll(searchVo);
		logger.info("사원 주소록 목록 페이지당 건수 조회 결과 list.size()={}", list.size());
		
		model.addAttribute("list",list);
		model.addAttribute("pagingInfo",pagingInfo);
		
		return "mypage/addressBook";
	}
	

}
