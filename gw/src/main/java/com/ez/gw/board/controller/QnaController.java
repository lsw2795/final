package com.ez.gw.board.controller;

import java.util.Date;
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
import com.ez.gw.comments.model.CommentsService;
import com.ez.gw.comments.model.CommentsVO;
import com.ez.gw.common.SearchVO;
import com.ez.gw.common.Utility;
import com.ez.gw.employee.model.EmployeeService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/qna")
public class QnaController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	private final BoardService boardService;
	private final EmployeeService employeeService;
	private final CommentsService commentsService;
	
	@RequestMapping("/list")
	public String qnaList(@ModelAttribute SearchVO searchVo, Model model) {
		//1
		logger.info("qna 목록 페이지");
		
		//2
		List<Map<String, Object>> list = boardService.selectQnaAll(searchVo);
		logger.info("qna 전체 조회 결과, list.size={}", list.size());
		
		for(Map<String, Object> map : list) {
			int boardNo = Integer.parseInt(String.valueOf(map.get("BOARD_NO")));
			int countReply = commentsService.selectCountReply(boardNo);
			map.put("countReply", countReply);
			map.put("timeNew", Utility.displayNew((Date)map.get("REGDATE")));
		}
		
		//3
		model.addAttribute("list", list);
		
		//4
		return "qna/list";
	}
	
	@GetMapping("/write")
	public String qnaWrite_get() {
		//1 
		logger.info("qna 등록 페이지");
		//2
		//3
		
		//4
		return "qna/write";
	}
	
	@PostMapping("/write")
	public String qnaWrite_post(@ModelAttribute BoardVO vo, HttpSession session, Model model) {
		//1
		int empNo = (int)session.getAttribute("empNo");
		vo.setEmpNo(empNo);
		logger.info("qna 등록, 파라미터 vo={}, empNo={}", vo, empNo);
		
		//2
		int cnt = boardService.insertQna(vo);
		logger.info("qna 등록 결과, cnt={}", cnt);
		
		String msg = "질문 등록에 실패하였습니다.", url = "/qna/list";
		if(cnt>0) {
			msg = "질문이 등록되었습니다.";
		}
		//3
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		//4
		return "common/message";
		
	}
	
	@RequestMapping("/detail")
	public String qnaDetail(@RequestParam(defaultValue = "0") int boardNo, Model model) {
		//1
		logger.info("qna 글 상세보기 페이지, 파라미터 boardNo={}", boardNo);
		
		if(boardNo==0) {
			model.addAttribute("msg", "잘못된 경로입니다.");
			model.addAttribute("url", "/qna/list");
			
			return "common/message";
		}
		
		//2
		boardService.updateReadcount(boardNo); //조회수 증가
		
		
		Map<String, Object> map = boardService.selectQna(boardNo);
		logger.info("qna 글 상세조회 결과, map={}", map);
		
		List<Map<String, Object>> replyList = commentsService.selectQnaReplys(boardNo);
		logger.info("해당 게시글 답변 조회 목록, replyList={}", replyList);
		
		//3
		model.addAttribute("map", map);
		model.addAttribute("replyList", replyList);
		
		//4
		return "qna/detail";
	}
	
	@GetMapping("/edit")
	public String qnaEdit(@RequestParam(defaultValue = "0") int boardNo, Model model) {
		//1
		logger.info("질문 수정 페이지, 파라미터 boardNo={}", boardNo);
		
		if(boardNo==0) {
			model.addAttribute("msg", "잘못된 경로입니다.");
			model.addAttribute("url", "/qna/list");
			
			return "common/message";
		}
		
		//2
		Map<String, Object> map = boardService.selectQna(boardNo);
		logger.info("게시글 번호로 정보 조회 결과, map={}", map);
		
		//3
		model.addAttribute("map", map);
		
		//4
		return "qna/edit";
	}
	
	@PostMapping("/edit")
	public String qnaEdit_post(@ModelAttribute BoardVO vo, Model model) {
		//1
		logger.info("qna 수정, 파라미터 vo={}", vo);
		
		//2
		int cnt = boardService.updateQna(vo);
		logger.info("qna 수정 결과, cnt={}", cnt);
		
		
		String msg = "질문 수정에 실패하였습니다.", url = "/qna/edit?boardNo=" + vo.getBoardNo();
		if(cnt>0) {
			msg = "질문이 수정되었습니다.";
			url = "/qna/list";
		}
		
		//3
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		//4
		return "common/message";
	}
	
	@RequestMapping("/delete")
	public String qnaDelete(@RequestParam(defaultValue = "0") int boardNo, Model model) {
		//1
		logger.info("질문 삭제 파라미터, boardNo={}", boardNo);
		if(boardNo==0) {
			model.addAttribute("msg", "잘못된 경로입니다.");
			model.addAttribute("url", "/qna/list");
			
			return "common/message";
		}
		
		//2
		int cnt = boardService.deleteQna(boardNo);
		
		String msg = "질문 삭제에 실패하였습니다.", url = "/qna/edit?boardNo=" + boardNo;
		if(cnt>0) {
			msg = "질문이 삭제되었습니다.";
			url = "/qna/list";
		}
		
		//3
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		//4
		return "common/message";
	}
	
	
	@RequestMapping("/reply")
	public String reply(@ModelAttribute CommentsVO vo) {
		//1
		logger.info("답변 등록 파라미터, vo={}", vo);
		
		//2
		int cnt = commentsService.insertQnaReply(vo);
		logger.info("답변 등록 결과, cnt={}", cnt);
		
		//3
		//4
		return "redirect:/qna/detail?boardNo=" + vo.getBoardNo();
	}
	
}
