package com.ez.gw.report.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	@ResponseBody
	@RequestMapping("/reportCommentAjax")
	public String reportCommentAjax(@RequestParam(defaultValue = "0") int commentNo,
			@RequestParam(defaultValue = "0") int boardNo, HttpSession session) {
		int empNo=(int)session.getAttribute("empNo");
		logger.info("댓글 신고 Ajax 파라미터 boardNo={},commentNo={}"+boardNo,commentNo);
		
		ReportVO vo = new ReportVO();
		vo.setEmpNo(empNo);
		vo.setBoardNo(boardNo);
		vo.setCommentNo(commentNo);
		int cnt=reportService.searchAnonymousCommentReport(vo);
		
		String msg="댓글 신고 중 에러가 발생했습니다.";
		if(cnt>0) {
			msg="해당 댓글을 이미 신고했습니다.";
		}else {
			cnt=reportService.anonymousBoardReport(vo);
			if(cnt>0) {
				msg="댓글을 신고했습니다.";
			}
		}
		
		return msg;
	}
}
