package com.ez.gw.board.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ez.gw.board.model.BoardService;
import com.ez.gw.board.model.BoardVO;
import com.ez.gw.boardlist.model.BoardListService;
import com.ez.gw.common.ConstUtil;
import com.ez.gw.common.EmpSearchVO;
import com.ez.gw.common.FileUploadUtil;
import com.ez.gw.pds.model.PdsService;
import com.ez.gw.pds.model.PdsVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/anonymous")
public class AnonymousBoardController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	private final BoardService boardService;
	private final PdsService pdsService;
	private final FileUploadUtil fileUploadUtil;
	
	@RequestMapping("/boardList")
	public String anonymousBoardList(HttpSession session,Model model) {
		logger.info("익명게시판 페이지");
		
		List<BoardVO> anonymousList = boardService.select24List();
		logger.info("게시글 조회 anonymousList={}",anonymousList);
		List<PdsVO> imageList = pdsService.select24AnonymousImage();
		logger.info("이미지 조회 imageList={}",imageList);
		
		model.addAttribute("anonymousList",anonymousList);
		model.addAttribute("imageList",imageList);
		
		return "anonymousBoard/anonymousBoardList";
	}
	
	@RequestMapping("/boardWrite")
	public String anonymousBoardWrite(@ModelAttribute BoardVO boardVo,Model model,
			HttpSession session,HttpServletRequest request) {
		int empNo=(int)session.getAttribute("empNo");
		logger.info("익명게시판 글 처리 파라미터 boardVo={}",boardVo);
		
		boardVo.setEmpNo(empNo);
		
		PdsVO pdsVo = new PdsVO();
		int cnt = boardService.insertAnonumous(boardVo);
		logger.info("익명게시판 글 처리 결과 cnt={}",cnt);
		
		String msg="게시글 등록중 에러가 발생했습니다.",url="/anonymous/boardList";
		if(cnt>0) {
			try {
				List<Map<String, Object>> fileList = fileUploadUtil.Multifileupload(request, ConstUtil.UPLOAD_IMAGE_FLAG);
				logger.info("파일 업로드 fileList={}",fileList.size());
				
				if(fileList!=null || !fileList.isEmpty()) {
					for(Map<String, Object> fileMap : fileList) {
						String fileName=(String)fileMap.get("fileName");
						String originalFileName=(String)fileMap.get("originalFileName");
						
						pdsVo.setBoardNo(boardVo.getBoardNo()); //게시글 번호
						pdsVo.setFileName(fileName); //서버저장 파일명
						pdsVo.setOriginalFileName(originalFileName); //원본 파일명
						
						cnt=pdsService.insertPdsByAnonymous(pdsVo);
						logger.info("파일 저장 결과 cnt={}",cnt);
					}
				}
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
			if(cnt>0) {
				msg="게시글이 등록되었습니다.";
			}
		}
		
		model.addAttribute("url",url);
		model.addAttribute("msg",msg);
		
		return "common/message";
	}
}
