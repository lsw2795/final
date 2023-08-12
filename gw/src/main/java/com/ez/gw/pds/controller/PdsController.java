package com.ez.gw.pds.controller;

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
import com.ez.gw.pds.model.PdsService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/pds")
public class PdsController {
	private static final Logger logger=LoggerFactory.getLogger(PdsController.class);
	private final PdsService pdsService;
	private final BoardService boardService;
	
	@RequestMapping("/list")
	public String list(Model model) {
		//1
		logger.info("자료실 메인페이지");
		//2
		List<Map<String, Object>> list = pdsService.selectPdsAll();
		logger.info("자료실 전체조회, list.size={}", list.size());
		
		//3
		model.addAttribute("list", list);
		
		//4
		return "pds/list";
		
	}
	
	@GetMapping("/write")
	public String write() {
		//1
		logger.info("자료실 등록 페이지");
		//4
		return "pds/write";
	}
	
	@PostMapping("/write")
	public String write_post(@ModelAttribute BoardVO vo, HttpSession session, Model model) {
		//1
		int empNo = (int)session.getAttribute("empNo");
		vo.setEmpNo(empNo);
		logger.info("자료실 등록, 파라미터 vo={}", vo);
		
		//2
		int cnt = pdsService.insertPds(vo);
		logger.info("자료 등록 결과, cnt={}", cnt);
		
		String msg = "자료 등록 실패", url ="/pds/write";
		if(cnt>0) {
			msg = "자료 등록 성공";
			url = "/pds/list";
		}
		//3
		model.addAttribute("url", url);
		model.addAttribute("msg", msg);
		
		//4
		return "common/message";
	}
	
	@GetMapping("/edit")
	public String edit(@RequestParam(defaultValue = "0") int boardNo, Model model) {
		//1
		logger.info("자료실 수정 페이지");
		if(boardNo==0) {
			model.addAttribute("msg", "잘못된 경로입니다.");
			model.addAttribute("url", "/pds/list");
			
			return "common/message";
		}
		
		//2
		Map<String, Object> map = pdsService.selectPds(boardNo);
		logger.info("자료실 자료 상세조회, map={}", map);
		//3
		model.addAttribute("map", map);
		//4
		return "pds/edit";
	}
	
	@PostMapping("/edit")
	public String edit_post(BoardVO vo, Model model) {
		//1
		logger.info("자료실 수정 파라미터, vo={}", vo);
		
		//2
		int cnt = pdsService.updatePds(vo);
		logger.info("자료 수정 결과, cnt={}", cnt);
		
		//3
		String msg = "자료 수정 실패", url = "/pds/edit?board_no=" + vo.getBoardNo();
		if(cnt>0) {
			msg = "자료가 수정되었습니다.";
			url = "/pds/detail?board_no=" + vo.getBoardNo();
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		//4
		return "common/message";
	}
	
	
	@RequestMapping("/detail")
	public String detail(@RequestParam(defaultValue = "0") int boardNo, Model model) {
		//1
		logger.info("자료실 상세보기 페이지");
		if(boardNo==0) {
			model.addAttribute("msg", "잘못된 경로입니다.");
			model.addAttribute("url", "/pds/list");
			
			return "common/message";
		}
		
		//2
		int cnt = boardService.updateReadcount(boardNo);
		logger.info("조회수 증가 결과, cnt={}", cnt);
		
		Map<String, Object> map = pdsService.selectPds(boardNo);
		logger.info("자료실 자료 상세조회, map={}", map);
		
		//3
		model.addAttribute("map", map);
		
		//4
		return "pds/detail";
	}
}
