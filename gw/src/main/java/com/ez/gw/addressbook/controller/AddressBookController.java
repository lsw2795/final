package com.ez.gw.addressbook.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ez.gw.addressbook.model.AddressBookListVO;
import com.ez.gw.addressbook.model.AddressBookService;
import com.ez.gw.addressbook.model.AddressBookVO;
import com.ez.gw.board.model.BoardVO;
import com.ez.gw.board.model.ListBoardVO;
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
	
	@ResponseBody
	@RequestMapping("/ajaxAddrInsert")
	public int insertAddr(HttpSession session,@ModelAttribute AddressBookVO vo) {
		int empNo=(int)session.getAttribute("empNo");
		vo.setEmpNo(empNo);
		logger.info("ajax 이용 - 주소록 등록 파라미터 vo={}", vo);
		int cnt=addressBookService.insertAddr(vo);
		logger.info("ajax 이용 - 주소록 등록 결과 cnt={}", cnt);
		return cnt;
	}
	
	@ResponseBody
	@RequestMapping("/ajaxAddrSelect")
	public AddressBookVO selectAddr(@RequestParam (defaultValue = "0") int addrbookNo) {
		logger.info("ajax 이용 - 주소록 수정 전 정보 보여주기 파라미터 addrbookNo={}", addrbookNo);
		AddressBookVO addressbookVo=addressBookService.selAddrByAddrNo(addrbookNo);
		logger.info("ajax 이용 - 주소록 수정 전 정보 보여주기 결과 addressbookVo={}", addressbookVo);
		return addressbookVo;
	}

	@ResponseBody
	@RequestMapping("/ajaxAddrUpdate")
	public int updateAddr(@ModelAttribute AddressBookVO vo,HttpSession session) {
		int empNo=(int)session.getAttribute("empNo");
		vo.setEmpNo(empNo);
		logger.info("ajax 이용 - 주소록 수정처리 파라미터 vo={}", vo);
		int cnt=addressBookService.updateAddr(vo);
		logger.info("ajax 이용 - 주소록 수정처리 결과 cnt={}", cnt);
		return cnt;
	}
	
	@RequestMapping("/addressBook/DeleteMulti")
	public String deleteAddrMulti(@ModelAttribute AddressBookListVO listVo,Model model) {
		logger.info("사원 - 선택한 주소록 게시글 멀티삭제, 파라미터 listVo={}", listVo);
		List<AddressBookVO> list = listVo.getAddrItems();
		int cnt = addressBookService.deleteMulti(list);
		logger.info("사원 - 주소록 멀티삭제 결과, cnt={}", cnt);
		String msg="선택한 주소록 삭제에 실패했습니다.",url="/mypage/addressBook";
		if(cnt>0) {
			msg="선택한 주소록 삭제에 성공했습니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		//4
		return "common/message";
	}

	
	
}
