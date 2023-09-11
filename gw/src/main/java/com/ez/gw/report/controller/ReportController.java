package com.ez.gw.report.controller;

import java.io.File;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ez.gw.board.model.BoardService;
import com.ez.gw.board.model.BoardVO;
import com.ez.gw.comments.model.CommentsService;
import com.ez.gw.comments.model.CommentsVO;
import com.ez.gw.common.ConstUtil;
import com.ez.gw.common.PaginationInfo;
import com.ez.gw.common.SearchVO;
import com.ez.gw.report.model.ReportService;
import com.ez.gw.report.model.ReportVO;
import com.ez.gw.secondhandTrade.model.SecondHandTradeService;
import com.ez.gw.secondhandTrade.model.SecondHandTradeVO;
import com.ez.gw.secondhandTradeFile.model.SecondhandTradeFileService;
import com.ez.gw.secondhandTradeFile.model.SecondhandTradeFileVO;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/report")
public class ReportController {
	private static final Logger logger = LoggerFactory.getLogger(ReportController.class);
	private final ReportService reportService;
	private final BoardService boardService;
	private final CommentsService commentService;
	private final SecondHandTradeService secondService;
	private final SecondhandTradeFileService secondfileService;

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
	
	//클럽
	@ResponseBody
	@RequestMapping("/reportClubBoardAjax")
	public String ajaxReportClub(@RequestParam(defaultValue = "0") int clubBoardNo,
			@RequestParam(defaultValue = "0") int clubNo,HttpSession session) {
		//1.
		int empNo=(int)session.getAttribute("empNo");
		ReportVO reVo = new ReportVO();
		reVo.setEmpNo(empNo);
		reVo.setClubBoardNo(clubBoardNo);
		reVo.setClubNo(clubNo);
		logger.info("게시글 신고 Ajax 파라미터 clubNo={},clubBoardNo={}",clubNo,clubBoardNo);
		
		//2.
		String msg="알 수 없는 문제가 발생하였습니다.";
		int cnt=reportService.dupClubBoardReport(reVo);
		logger.info("신고등록 결과 cnt={}",cnt);
		
		if(cnt>0) {
			msg="이미 신고한 게시물입니다.";
		}else {
			int cnt2=reportService.insertReport(reVo);
			if(cnt2>0){
				msg="해당 게시물이 신고되었습니다.";
			}
			
		}
		
		//3.
			
		//4.
		return msg;
	}
	
	//중고거래
		@ResponseBody
		@RequestMapping("/reportMarketAjax")
		public String ajaxReportMarket(@RequestParam(defaultValue = "0") int tradeNo,
				HttpSession session) {
			//1.
			int empNo=(int)session.getAttribute("empNo");
			ReportVO reVo = new ReportVO();
			reVo.setEmpNo(empNo);
			reVo.setTradeNo(tradeNo);
			logger.info("게시글 신고 Ajax 파라미터 tradeNo={}",tradeNo);
			
			//2.
			String msg="알 수 없는 문제가 발생하였습니다.";
			int cnt=reportService.searchWarningMarket(reVo);
			logger.info("신고등록 결과 cnt={}",cnt);
			
			if(cnt>0) {
				msg="이미 신고한 게시물입니다.";
			}else {
				int cnt2=reportService.warningMarket(reVo);
				if(cnt2>0){
					msg="해당 게시물이 신고되었습니다.";
				}
			}
			
			//3.
				
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
	
	@RequestMapping("/anonymousReportDetail")
	public String anoymousReportList(@RequestParam(required = true) int reportNo,
			Model model) {
		logger.info("익명게시판 신고글 상세보기 파라미터 reportNo={}",reportNo);
		
		Map<String, Object> reportMap = reportService.selectByReportNo(reportNo);
		Object obj=reportMap.get("BOARD_NO");
    	int boardNo = ((BigDecimal) obj).intValue();
    	
    	
    	Map<String, Object> boardMap=boardService.AnonymousBoardByBoardNo(boardNo);
		logger.info("익명게시판 신고글 조회결과 boardMap={}",boardMap);
		
		Map<String, Object> commentMap = new HashMap<>();
		
		obj=reportMap.get("COMMENT_NO");
		if(obj!=null) {
			int commentNo = ((BigDecimal) obj).intValue();
			commentMap = commentService.anonymousCommentByCommentNo(commentNo);
			logger.info("익명게시판 신고댓글 조회결과 commentVo={}",commentMap);
		}
		
		model.addAttribute("reportMap",reportMap);
		model.addAttribute("boardMap",boardMap);
		model.addAttribute("commentMap",commentMap);
		
		return "anonymousBoard/report/anonymousReportDetail";
	}
	
	@ResponseBody
	@RequestMapping("/anonymous/statusPostponeAjax")
	public String statusPostponeAjax(@RequestParam(defaultValue = "0") int reportNo,
		HttpSession session) {
		logger.info("신고 보류 처리 Ajax 파라미터 reportNo={}",reportNo);
		
		int cnt=reportService.updateAnonymousReportPostpone(reportNo);
		logger.info("신고 보류 처리 결과 cnt={}",cnt);
		
		String msg="신고 보류 처리 중 에러가 발생했습니다.";
		if(cnt>0) {
			msg="신고 보류 처리했습니다.";
		}
		
		return msg;
	}
	
	@ResponseBody
	@RequestMapping("/anonymous/UpdateAjax")
	public String anonymousUpdateAjax(@RequestParam(defaultValue = "0") int reportNo,
			HttpSession session) {
		logger.info("신고 처리 Ajax 파라미터 reportNo={}",reportNo);
		
		Map<String, Object> reportMap = reportService.selectByReportNo(reportNo);
		
		Object obj=reportMap.get("COMMENT_NO");
		
		int cnt=reportService.updateAnonymousReport(reportNo);
		logger.info("신고 처리 결과 cnt={}",cnt);
		
		if(obj==null && cnt>0) {
			obj=reportMap.get("BOARD_NO");
			int boardNo = ((BigDecimal) obj).intValue();
			
			cnt=boardService.deleteAnonymousBoard(boardNo);
			logger.info("게시글 삭제 처리 결과 cnt={}",cnt);
		}
		
		String msg="신고 처리 중 에러가 발생했습니다.";
		if(cnt>0) {
			msg="신고 처리됐습니다.";
		}
		
		return msg;
	}
	
	@ResponseBody
	@RequestMapping("/anonymous/countAjax")
	public int anonymousCountAjax(@RequestParam(defaultValue = "0") int reportNo,
			HttpSession session) {
		logger.info("익명게시판 신고 알림 처리 Ajax");
		
		int cnt = reportService.anonymousReportCount();
		logger.info("익명게시판 신고 조회 결과 cnt={}",cnt);
		
		return cnt;
	}
	
	@ResponseBody
	@RequestMapping("/anonymous/countMarketAjax")
	public int anonymousCountMarketAjax(@RequestParam(defaultValue = "0") int reportNo,
			HttpSession session) {
		logger.info("중고거래 신고 알림 처리 Ajax");
		
		int cnt = reportService.anonymousMarketReportCount();
		logger.info("중고거래 신고 조회 결과 cnt={}",cnt);
		
		return cnt;
	}
	
	@RequestMapping("/warningMarketList")
	public String adminReport(@ModelAttribute SearchVO searchVo ,Model model) {
		//1.
		logger.info("관리자 - 중고거래 신고 목록 페이지");

		//2.
		List<Map<String, Object>> list = reportService.selectReportMarket(searchVo);
		logger.info("관리자 - 중고거래 신고 목록 개수 list.size={}",list.size());

		//3.
		model.addAttribute("list", list);

		//4.
		return "anonymousBoard/report/warningMarketList";
	}
	
	
	
		@RequestMapping("/adminDeleteMarket")
		public String delete(@RequestParam(defaultValue = "0")int tradeNo, Model model) {
			logger.info("삭제 페이지, 파라미터 tradeNo={}", tradeNo);
			
			if (tradeNo == 0) {
				model.addAttribute("msg", "잘못된 경로입니다.");
				model.addAttribute("url", "/report/warningMarketList");

				return "common/message";
			}
			// 2
			List<SecondhandTradeFileVO> fileList =  secondfileService.selectDetailFileByNo(tradeNo);
			logger.info("중고거래 이미지 파일 갯수, fileList={}", fileList);
			if (fileList.size() > 0) {
				for (SecondhandTradeFileVO f : fileList) {
					String fileName = f.getImageURL();
					String path = ConstUtil.MARKET_UPLOAD_PATH_TEST;
					File file = new File(path, fileName);
					if (file.exists()) {
						boolean result = file.delete();
						logger.info("이미지 삭제 여부 : {}", result);
					}
				} // for
			} // if

			int cnt = secondService.deleteMarket(tradeNo);
			logger.info("중고거래 게시글 삭제 결과, cnt = {}", cnt);

			String msg = "삭제 실패!", url = "/report/warningMarketList";
			if (cnt > 0) {
				msg = "자료 삭제가 완료되었습니다.";
			}

			// 3
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);

			// 4
			return "common/message";
			
		}
	
}
