package com.ez.gw.club.controller;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.bouncycastle.asn1.cmp.CertRepMessage;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ez.gw.club.model.ClubService;
import com.ez.gw.club.model.ClubVO;
import com.ez.gw.club.model.ListClubVo;
import com.ez.gw.clubboard.model.ClubBoardVO;
import com.ez.gw.clubboard.model.ListClubBoardVO;
import com.ez.gw.common.SearchVO;
import com.ez.gw.common.Utility;
import com.ez.gw.employee.model.EmployeeService;
import com.ez.gw.employee.model.EmployeeVO;
import com.ez.gw.report.model.ReportService;
import com.ez.gw.report.model.ReportVO;
import com.fasterxml.jackson.databind.deser.impl.CreatorCandidate.Param;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class ClubController {
	private static final Logger logger = LoggerFactory.getLogger(ClubController.class);
	private final ClubService clubService;
	private final EmployeeService empService;
	private final ReportService reportService;
	
	//동호회 개설 페이지 보여주기
	@RequestMapping("/club/createClub")
	public String clubWrite() {
		//1.
		logger.info("동호회 개설 페이지");
		return "club/createClub";
	}
	
	//동호회 실제 개설
	@PostMapping("/club/createClub")
	public String clubWrite_post(@ModelAttribute ClubVO vo, HttpSession session ,Model model) {
		//1.
		int empNo = (int)session.getAttribute("empNo");
		vo.setEmpNo(empNo);
		logger.info("동호회 개설 처리 페이지 empNo={},vo={}",empNo,vo);

		//2.
		int cnt=clubService.insertClub(vo);
		logger.info("동호회 개설 결과 cnt={}",cnt);
		
		EmployeeVO empVo = new EmployeeVO();
		empVo.setEmpNo(empNo);
		empVo.setClubNo(vo.getClubNo());
		
		int res=empService.createClub(empVo);
		logger.info("동호회 개설 res={}",res,vo.getClubNo());
		
		
		String msg="동호회 개설 실패", url="/club/clubList";
		if(cnt>0) {
			msg="동호회 개설 완료";
		}

		//3.
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		//4
		return "common/message";
	}

	//개설 동호회 목록 보여주기
	@RequestMapping("/club/clubList")
	public String clubList(@ModelAttribute SearchVO searchVo,Model model) {
		//1.
		logger.info("동호회 개설 전체조회 searchVo={}",searchVo);
		//2.
		List<Map<String, Object>> list=clubService.selectClub(searchVo);
		logger.info("개설된 동호회 list.size()={}",list.size());
		
		
		 for(Map<String, Object> map : list) { 
			 map.put("timeNew",Utility.displayNew((Date)map.get("REGDATE"))); 
		 }
		 
		//3.
		model.addAttribute("list", list);
		//4.
		return "club/clubList";
	}

	//동호회 개설 수정페이지
	@GetMapping("/club/clubEdit")
	public String editClub(@RequestParam(defaultValue = "0")int clubNo ,Model model) {
		//1.
		logger.info("동호회 개설 수정 페이지, clubNo={}",clubNo);
		//2.
		ClubVO vo = clubService.selectByClubNo(clubNo);
		logger.info("클럽번호로 보는 수정 페이지 vo={}",vo);

		if(clubNo==0) {
			model.addAttribute("msg", "잘못된 경로입니다.");
			model.addAttribute("url", "/club/clubList");

			return "common/message";
		}

		model.addAttribute("vo", vo);

		return "club/clubEdit";
	}
	
	//동호회 개설 실제 수정페이지
	@RequestMapping("/club/clubEdit")
	public String editClub_post(@ModelAttribute ClubVO vo, Model model) {
		//1.
		logger.info("수정 처리 페이지, vo={}",vo);

		//2.
		int cnt=clubService.updateClub(vo);
		logger.info("수정 처리 결과 cnt={}",cnt);

		String msg="수정 실패하였습니다.", url="/club/clubEdit?clubNo="+vo.getClubNo();
		if(cnt>0) {
			msg="수정 완료되었습니다.";
			url="/club/clubList";
		}
		//3.
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		//4.
		return "common/message";

	}

	//개설된 동호회 삭제 
	@RequestMapping("/club/deleteClub")
	public String deleteClub(@RequestParam(defaultValue = "0")int clubNo,
			HttpSession session, Model model) {
		//1.
		int empNo = (int)session.getAttribute("empNo");
		logger.info("동호회 삭제");
		
		//2.
		int out=clubService.outClub(empNo);
		logger.info("동호회 탈퇴 결과 out={}",out);
		
		int cnt=clubService.deleteClub(clubNo);
		logger.info("동호회 삭제 결과 cnt={}",cnt);
		
		String msg="삭제 실패했습니다.", url="/club/clubEdit?clubNo="+clubNo;
		if(cnt>0) {
			msg="삭제완료 되었습니다.";
			url="/club/clubList";
		}

		//3.
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		//4.
		return "common/message";
	}

	//개설된 동호회 상세보기
	@RequestMapping("/club/clubDetail")
	public String clubDetail(@ModelAttribute ClubVO clubVo,
			@RequestParam(defaultValue = "0")int clubNo,
			HttpSession session, Model model) {
		//1.
		int empNo = (int)session.getAttribute("empNo");
		logger.info("동호회 상세보기, clubNo={}",clubNo);
		
		if(clubNo==0) {
			model.addAttribute("msg", "잘못된 경로입니다.");
			model.addAttribute("url", "/club/clubList");
			
			return "common/message";
		}
		
		//2.
		clubVo=clubService.selectByClubNo(clubNo);
		int cnt=clubService.clubCount(clubNo);
		int regi=clubService.regiClub(empNo);
		
		logger.info("동호회 상세보기 clubvo={}",clubVo);
		logger.info("동호회 인원수 제한여부 cnt={},memlimit={}",cnt,clubVo.getMemLimit());
		logger.info("동호회 가입여부 regi={}",regi);
		
		
		//3.
		model.addAttribute("clubVo", clubVo);
		model.addAttribute("clubCnt", cnt);
		model.addAttribute("register", regi);
		
		//4.
		return "club/clubDetail";
	}
	
	//동호회비 결제
	@RequestMapping("/payClub")
	public String payClub(@RequestParam(defaultValue = "0")int clubNo, Model model) {
		//1.
		logger.info("해당 동호회 결제 clubNo={}",clubNo);

		if(clubNo==0) {
			model.addAttribute("msg", "잘못된 경로입니다.");
			model.addAttribute("url", "/club/clubDetail?clubNo="+clubNo);

			return "common/message";
		}

		//2.
		return "club/clubDetail?clubNo="+clubNo;
	}
	
	//동호회 탈퇴
	@RequestMapping("/club/outClub")
	public String outClub(@RequestParam(defaultValue = "0")int empNo, Model model) {
		//1.
		logger.info("동호회 탈퇴 empNo={}",empNo);
		//2.
		int cnt=clubService.outClub(empNo);
		logger.info("동호회 탈퇴 결과 cnt={}",cnt);
		
		String msg="탈퇴 실패하였습니다.",url="/mypage/empInfoEdit";
		if(cnt>0) {
			msg="탈퇴 완료되었습니다.";
		}
		//3.
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		//4.
		return "common/message";
		
	}
	

	
	//--------------------------------Admin 관리자----------------------------------------
	
	//관리자(동호회) - 전체 목록(공개,비공개) admin clubList
	@RequestMapping("/admin/adminclub/clubList")
	public String adminclubList(@ModelAttribute SearchVO searchVo, Model model) {
		logger.info("관리자 - 동호회 전체 현황");
		
		List<Map<String, Object>> list=clubService.selectClub(searchVo);
		logger.info("관리자 - 개설된 동호회 list.size()={}",list.size());
		
		
		 for(Map<String, Object> map : list) { 
			 map.put("timeNew",Utility.displayNew((Date)map.get("REGDATE"))); 
		 }
		 
		//3.
		model.addAttribute("list", list);
		
		//4.
		return "admin/adminclub/clubList";
	}
	
	//관리자(동호회) - 삭제
	@RequestMapping("/admin/adminclub/adminClubDelete")
	public String adminDeleteClub(@RequestParam(defaultValue = "0")int clubNo, Model model) {
		//1.
		logger.info("관리자 - 동호회 삭제");
		//2.
		int cnt=clubService.deleteClub(clubNo);
		logger.info("관리자 - 동호회 삭제 결과 cnt={}",cnt);

		String msg="삭제 실패했습니다.", url="/admin/adminclub/clubList";
		if(cnt>0) {
			msg="삭제완료 되었습니다.";
		}

		//3.
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		//4.
		return "common/message";
	}
	
	//관리자 - 동호회 다중 삭제 안됨
	@RequestMapping("/admin/adminclub/clubDeleteMulti")
	public String clubDeleteMulti(@ModelAttribute ListClubVo listVo, Model model) {
		//1.
		logger.info("관리자 - 동호회 다중삭제 listVo={}",listVo);
		
		//2.
		List<ClubVO> list = listVo.getClubItems();
		
		Integer cnt=clubService.deleteMulti(list);
		logger.info("관리자 - 동호회 다중 삭제 결과 cnt={}",cnt);
		
		String msg="동호회 삭제 실패했습니다.",url="/admin/adminclub/clubList";
		if(cnt>0) {
			msg="선택 동호회 삭제 완료했습니다.";
		}
		//3.
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		//4.
		return "common/message";
		
	}
	
	//관리자(동호회) - 동호회비 지불 여부 목록
	@RequestMapping("/admin/adminclub/adminPayment")
	public String paymentList(@ModelAttribute SearchVO searchVo, Model model) {
		//1.
		logger.info("관리자 - 동호회비결제 현황");
		//2.
		List<Map<String, Object>> list = clubService.adminClubList(searchVo);
		logger.info("관리자 - 동호회 가입 list.size={}",list.size());
		
		
		//3.
		model.addAttribute("list", list);
		
		//4.
		return "admin/adminclub/adminPayment";
	}
	
	
}


























