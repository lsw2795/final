package com.ez.gw.report.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ez.gw.common.ConstUtil;
import com.ez.gw.common.PaginationInfo;
import com.ez.gw.report.model.ReportService;
import com.ez.gw.report.model.ReportVO;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/report")
public class ReportController {
	private static final Logger logger = LoggerFactory.getLogger(ReportController.class);
	private final ReportService reportService;

	@ResponseBody
	@RequestMapping("/reportBoardAjax")
	public String reportBoardAjax(@RequestParam(defaultValue = "0") int boardNo,HttpSession session) {
		int empNo=(int)session.getAttribute("empNo");
		logger.info("게시글 신고 Ajax 파라미터 boardNo={}"+boardNo);
		
		ReportVO vo = new ReportVO();
		vo.setEmpNo(empNo);
		vo.setBoardNo(boardNo);
		int cnt=reportService.searchAnonymousBoardReport(vo);

		String msg="게시글 신고 중 에러가 발생했습니다.";
		if(cnt>0) {
			msg="해당 게시글을 이미 신고했습니다.";
		}else {
			cnt=reportService.anonymousBoardReport(vo);
			if(cnt>0) {
				msg="게시글을 신고했습니다.";
			}
		}
		
		return msg;
	}
	
<<<<<<< HEAD
	//클럽
	@RequestMapping("/reportClubBoardAjax")
	public String ajaxReportClub(@RequestParam(defaultValue = "0") int clubBoardNo,
			HttpSession session) {
		//1.
		int empNo=(int)session.getAttribute("empNo");
		ReportVO reVo = new ReportVO();
		reVo.setEmpNo(empNo);
		reVo.setClubBoardNo(clubBoardNo);
		logger.info("게시글 신고 Ajax 파라미터 clubBoardNo={}"+clubBoardNo);
		
		//2.
		int cnt=reportService.dupClubBoardReport(reVo);
		logger.info("신고등록 결과 cnt={}",cnt);
		
		//3.
		String msg="알 수 없는 문제가 발생하였습니다.";
		if(cnt>0) {
			msg="이미 신고한 게시물입니다.";
		}else {
			cnt=reportService.insertReport(reVo);
			if(cnt>0) {
				msg="해당 게시물이 신고되었습니다.";
			}
		}
		//4.
		return msg;
	}

	@ResponseBody
	@RequestMapping("/reportCommentAjax")
	public String reportCommentAjax(@RequestParam(defaultValue = "0") int commentNo,
			@RequestParam(defaultValue = "0") int boardNo, HttpSession session) {
		int empNo=(int)session.getAttribute("empNo");
		logger.info("댓글 신고 Ajax 파라미터 boardNo={},commentNo={}",boardNo,commentNo);
		
		ReportVO vo = new ReportVO();
		vo.setEmpNo(empNo);
		vo.setBoardNo(boardNo);
		vo.setCommentNo(commentNo);
		logger.info("vo={}",vo);
		int cnt=reportService.searchAnonymousCommentReport(vo);
		
		String msg="댓글 신고 중 에러가 발생했습니다.";
		if(cnt>0) {
			msg="해당 댓글을 이미 신고했습니다.";
		}else {
			cnt=reportService.anonymousCommentReport(vo);
			if(cnt>0) {
				msg="댓글을 신고했습니다.";
			}
		}
		
		return msg;
	}
	
	@RequestMapping("/anonymousReportList")
	public String anoymousReportList(@ModelAttribute ReportVO vo, Model model) {
		logger.info("익명게시판 신고 리스트 파라미터 vo={}",vo);
		
		PaginationInfo pagingInfo=new PaginationInfo();
    	pagingInfo.setBlockSize(ConstUtil.BLOCK_SIZE);
   		pagingInfo.setCurrentPage(vo.getCurrentPage());
    	pagingInfo.setRecordCountPerPage(ConstUtil.CONFIRM_RECORD_COUNT);
    			
    	vo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
    	vo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
    	
    	List<Map<String, Object>> reportList = reportService.anonymousReportList(vo);
    	logger.info("익명게시판 신고함 조회결과, list.size={}",reportList.size());
    	
    	int totalRecord = reportService.getTotalAnonymousReport(vo);
		logger.info("익명게시판 신고함 조회결과, totalRecord={}",totalRecord);
		pagingInfo.setTotalRecord(totalRecord);
    	
    	//3
    	model.addAttribute("reportList",reportList);
    	model.addAttribute("pagingInfo",pagingInfo);
	
		return "anonymousBoard/report/anonymousReportList";
	}
}
