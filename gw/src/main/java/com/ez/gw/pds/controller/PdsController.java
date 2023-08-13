package com.ez.gw.pds.controller;

import java.io.File;
import java.io.IOException;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ez.gw.board.model.BoardService;
import com.ez.gw.board.model.BoardVO;
import com.ez.gw.pds.model.PdsService;
import com.ez.gw.pds.model.PdsVO;
import com.ez.gw.secondhandTrade.model.SecondHandTradeVO;
import com.ez.gw.secondhandTradeFile.model.SecondhandTradeFileVO;

import jakarta.servlet.http.HttpServletRequest;
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
	
	/*
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
	}*/
	
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
		String msg = "자료 수정 실패", url = "/pds/edit?boardNo=" + vo.getBoardNo();
		if(cnt>0) {
			msg = "자료가 수정되었습니다.";
			url = "/pds/detail?boardNo=" + vo.getBoardNo();
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
	
	@RequestMapping("/delete")
	public String delete(@RequestParam(defaultValue = "0") int boardNo, Model model) {
		//1
		logger.info("자료 삭제 파라미터, boardNo={}", boardNo);
		if(boardNo==0) {
			model.addAttribute("msg", "잘못된 경로입니다.");
			model.addAttribute("url", "/pds/list");
			
			return "common/message";
		}
		//2
		String msg = "자료 삭제 실패하였습니다.", url = "/pds/detail?boardNo=" + boardNo;
		int cnt = pdsService.deletePds(boardNo);
		if(cnt>0) {
			msg = "자료가 삭제 되었습니다.";
			url = "/pds/list";
		}
		
		//3
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		//4
		return "common/message";
		
	}
	
	@PostMapping("/write")
	public String write_post(@ModelAttribute BoardVO boardVo, @ModelAttribute PdsVO pdsVo,
				HttpSession session,HttpServletRequest request, Model model) {
		//1
		int empNo = (int)session.getAttribute("empNo");
		boardVo.setEmpNo(empNo);
		logger.info("자료실 등록, 파라미터 vo={}", boardVo);
		
		//2
		//파일 업로드 처리
		String fileName = "", originalFileName = "";
		long fileSize = 0;
		
		int cnt = pdsService.insertPds(boardVo);
		logger.info("자료실-게시글 등록 결과, cnt={}", cnt);
		
		try {
			
			//파일 업로드 처리
			MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest)request;
			
			List<MultipartFile> files = multiRequest.getFiles("files");
			logger.info("파일 갯수, files.size={}", files.size());
			
			
			for(MultipartFile f : files) {
				originalFileName = f.getOriginalFilename();
				fileName = System.currentTimeMillis() + "_" + originalFileName;
				fileSize = (long)f.getSize();
				
				String filePath = "C:\\Users\\pc\\git\\final\\gw\\src\\main\\webapp\\pds_upload\\" + fileName;
				
				File file = new File(filePath);
				f.transferTo(file);
						
				logger.info("파일명:{}", fileName);
				pdsVo.setBoardListNo(3000); //게시판 번호
				pdsVo.setBoardNo(boardVo.getBoardNo()); //게시글 번호
				pdsVo.setFileExtension(originalFileName.substring(originalFileName.indexOf(".")+1)); // 확장자
				pdsVo.setFileName(fileName); //서버저장 파일명
				pdsVo.setFileSize(fileSize); //파일크기
				pdsVo.setOriginalfilename(originalFileName); //원본 파일명
				pdsVo.setPath(filePath); //파일 경로
				
				int result = pdsService.insertFiles(pdsVo); //pds 테이블에 파일 db 저장
				logger.info("다중 파일 등록 결과 result = {}", result);
			}
		}catch(IllegalStateException e) {
			e.printStackTrace();
		}catch(IOException e) {
			e.printStackTrace();
		}
		
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
		
	
}
