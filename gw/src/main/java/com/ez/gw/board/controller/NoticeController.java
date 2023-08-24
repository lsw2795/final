package com.ez.gw.board.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ez.gw.board.model.BoardService;
import com.ez.gw.board.model.BoardVO;
import com.ez.gw.common.ConstUtil;
import com.ez.gw.common.PaginationInfo;
import com.ez.gw.common.SearchVO;
import com.ez.gw.employee.model.EmployeeService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class NoticeController {
	private static final Logger logger=LoggerFactory.getLogger(NoticeController.class);
	private final BoardService boardService;
	
	@GetMapping("/admin/board/noticeWrite")
	public String noticeWrite_get() {
		logger.info("관리자 - 공지사항 글쓰기 페이지 보여주기");
		
		return "admin/board/noticeWrite";
	}
	
	@PostMapping("/admin/board/noticeWrite")
	public String noticeWrite_post(@ModelAttribute BoardVO vo, 
			HttpSession session, Model model) {
		//1
		int empNo = (int)session.getAttribute("empNo");
		vo.setEmpNo(empNo);
		logger.info("관리자 - 공지사항 글쓰기 페이지, 파라미터 vo={}, empNo={}", vo, empNo);
		
		//2
		int cnt=boardService.insertNotice(vo);
		logger.info("관리자 - 공지사항 글 등록결과, cnt={}",cnt);
		
		String msg="공지사항 등록에 실패했습니다.",url="/admin/board/noticeWrite";
		if(cnt>0) {
			msg="공지사항 등록이 완료되었습니다.";
			url="/admin/board/noticeList";
		}
		//3
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		//4
		return "common/message";
	}

	@RequestMapping("/admin/board/noticeList")
	public String noticeList(@ModelAttribute SearchVO searchVo, Model model) {
		//1
		logger.info("관리자 - 공지사항 목록 페이지");
		//2
		List<Map<String, Object>> list = boardService.selectNoticeAll(searchVo);
		logger.info("관리자 - 공지사항 전체 조회 결과, list.size={}", list.size());
				
		//3
		model.addAttribute("list", list);
		//4
		return "admin/board/noticeList";
	}
	
	@RequestMapping("/admin/board/noticeDetail")
	public String noticeDetail(@RequestParam(defaultValue = "0") int boardNo, Model model) {
		//1
		logger.info("관리자 - 공지사항 글 상세보기 페이지, 파라미터 boardNo={}", boardNo);
	
		if(boardNo==0) {
			model.addAttribute("msg", "잘못된 경로입니다.");
			model.addAttribute("url", "/admin/board/noticeList");
			
			return "common/message";
		}
		
		//2
		Map<String, Object> map = boardService.selectNotice(boardNo);
		logger.info("관리자 - 공지사항 글 상세조회 결과, map={}", map);
		
		//3
		model.addAttribute("map", map);
		
		//4
		return "/admin/board/noticeDetail";
	}
	
	@RequestMapping("/board/noticeList")
	public String noticeList2(@ModelAttribute SearchVO searchVo, Model model) {
		//1
		logger.info("사원 - 공지사항 목록 페이지");
		//[1] PaginationInfo 객체 생성
		PaginationInfo pagingInfo=new PaginationInfo();
		pagingInfo.setBlockSize(ConstUtil.BLOCK_SIZE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		//[2] SearchVo에 입력되지 않은 두 개의 변수에 값 셋팅
		searchVo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
	
		int totalRecord=boardService.gTRSearchNotice(searchVo);
		pagingInfo.setTotalRecord(totalRecord);
		//2
		List<Map<String, Object>> list = boardService.selectNoticeAll(searchVo);
		logger.info("사원 - 공지사항 전체 조회 결과, list.size={}", list.size());
				
		//3
		model.addAttribute("list", list);
		model.addAttribute("pagingInfo", pagingInfo);
		//4
		return "board/noticeList";
	}
	
	@RequestMapping("/board/noticeDetail")
	public String noticeDetail2(@RequestParam(defaultValue = "0") int boardNo, Model model) {
		//1
		logger.info("사원 - 공지사항 글 상세보기 페이지, 파라미터 boardNo={}", boardNo);
	
		if(boardNo==0) {
			model.addAttribute("msg", "잘못된 경로입니다.");
			model.addAttribute("url", "/board/noticeList");
			
			return "common/message";
		}
		
		//2
		boardService.updateReadcount(boardNo); //사원 공지사항 뷰만 조회수 증가
		
		Map<String, Object> map = boardService.selectNotice(boardNo);
		logger.info("사원 - 공지사항 글 상세조회 결과, map={}", map);
		
		//3
		model.addAttribute("map", map);
		
		//4
		return "board/noticeDetail";
	}
	
	@GetMapping("/admin/board/noticeEdit")
	public String noticeEdit_get(@RequestParam(defaultValue = "0") int boardNo, Model model) {
		//1
		logger.info("관리자 - 공지사항 글 수정페이지 보여주기, 파라미터 boardNo={}", boardNo);
		
		if(boardNo==0) {
			model.addAttribute("msg", "잘못된 경로입니다.");
			model.addAttribute("url", "/admin/board/noticeList");
			
			return "common/message";
		}
		
		//2
		Map<String, Object> map = boardService.selectNotice(boardNo);
		logger.info("관리자 - 공지사항 글 수정페이지 조회 결과, map={}", map);
		
		model.addAttribute("map", map);
		
		return "admin/board/noticeWrite";
	}
	
	@PostMapping("/admin/board/noticeEdit")
	public String noticeEdit_post(@ModelAttribute BoardVO vo, Model model) {
		//1
		logger.info("관리자 - 공지사항 수정, 파라미터 vo={}", vo);
		
		//2
		int cnt = boardService.updateNotice(vo);
		logger.info("관리자 - 공지사항 수정 결과, cnt={}", cnt);
		
		String msg = "공지사항 수정에 실패했습니다.", url = "/admin/board/noticeEdit?boardNo=" + vo.getBoardNo();
		if(cnt>0) {
			msg = "공지사항 수정이 완료되었습니다.";
			url = "/admin/board/noticeDetail?boardNo="+vo.getBoardNo();
		}
		
		//3
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		//4
		return "common/message";
	}
	
	@RequestMapping("/admin/board/noticeDelete")
	public String noticeDelete(@ModelAttribute BoardVO vo, Model model) {
		//1
		logger.info("관리자 - 공지사항 삭제 파라미터, vo={}", vo);
		
		//2
		int cnt = boardService.deleteNotice(vo);
		
		String msg = "공지사항 삭제에 실패했습니다.", url = "/admin/board/noticeEdit?boardNo=" + vo.getBoardNo();
		if(cnt>0) {
			msg = "공지사항 삭제가 완료되었습니다.";
			url = "/admin/board/noticeList";
		}
		
		//3
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		//4
		return "common/message";
	}
	
}
