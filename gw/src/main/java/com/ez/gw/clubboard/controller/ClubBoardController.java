package com.ez.gw.clubboard.controller;

import java.io.File;
import java.io.IOException;
import java.net.http.HttpRequest;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ez.gw.clubboard.model.ClubBoardService;
import com.ez.gw.clubboard.model.ClubBoardVO;
import com.ez.gw.clubboardComment.model.ClubBoardCommentService;
import com.ez.gw.clubboardComment.model.ClubBoardCommentVO;
import com.ez.gw.common.ConstUtil;
import com.ez.gw.common.SearchVO;
import com.ez.gw.common.Utility;
import com.ez.gw.pds.model.PdsService;
import com.ez.gw.pds.model.PdsVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/club")
public class ClubBoardController {
	private static final Logger logger = LoggerFactory.getLogger(ClubBoardController.class);
	private final ClubBoardService clubBoardService;
	private final ClubBoardCommentService cbcService;
	private final PdsService pdsService;
	
	
	@GetMapping("/clubBoardWrite")
	public String clubBoardWrite() {
		logger.info("동호회 게시판 작성");
		return "club/clubBoardWrite";
	}
	
	@PostMapping("/clubBoardWrite")
	public String clubBoardWrite_post(@ModelAttribute ClubBoardVO clubVo, HttpSession session ,
			@RequestParam int clubNo, HttpServletRequest request,
			@ModelAttribute PdsVO pdsVo,Model model) {
		//1.
		int empNo = (int)session.getAttribute("empNo");
		clubVo.setEmpNo(empNo);
		clubVo.setClubNo(clubNo);
		
		logger.info("동호회 게시판 작성하는 페이지 empNo={},clubNo={},clubVo={}",empNo,clubNo,clubVo);
		
		int cnt=0;
		//파일 업로드
		try {
			
			String fileName = "", originalFileName = "";
			long fileSize = 0;
			
			//2.
			//파일 업로드 처리 
			MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
			List<MultipartFile> files = multiRequest.getFiles("imageURL");
			logger.info("files.size={}",files.size());
			
			cnt=clubBoardService.insertClubBoard(clubVo);
			logger.info("동호회 게시판 작성 결과 cnt={}",cnt);
			logger.info("보드 넘버={}",clubVo.getBoardNo());
			
			
			int i=0;
			for(MultipartFile f : files){
				originalFileName = f.getOriginalFilename();
				int idx=originalFileName.indexOf(".");
				logger.info("idx={}",idx);
				String cutfile = originalFileName.substring(idx);
				
				fileName = clubVo.getClubNo() + "_" + i++ +cutfile;
				fileSize = (long) f.getSize();
				
				String path = ConstUtil.CLUB_UPLOAD_PATH;
				String filePath = request.getSession().getServletContext().getRealPath(path);
				
				File file = new File(filePath, fileName);
				f.transferTo(file);
				
				logger.info("파일명 fileName={}",fileName);
				pdsVo.setBoardNo(clubVo.getBoardNo());
				pdsVo.setPath(filePath);
				pdsVo.setFileName(fileName);
				pdsVo.setFileSize(fileSize);
				pdsVo.setOriginalFileName(originalFileName);
				pdsVo.setFileExtension(cutfile);
				
				int res=pdsService.clubFiles(pdsVo);
				logger.info("파일 db저장 결과 res={}",res);		
			}//for
		}catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		String msg="게시물 등록 실패", url="/club/clubBoard?clubNo="+clubNo;
		if(cnt>0) {
			msg="게시물 등록 완료";
		}

		//3.
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		//4
		return "common/message";
	}
	
	
	@RequestMapping("/clubBoard")
	public String clubBoadList(@ModelAttribute SearchVO saerchVo,
			@RequestParam(defaultValue = "0")int clubNo, Model model) {
		//1.
		logger.info("각 동호회 자유게시판 전체페이지");
	
		//2.
		List<Map<String, Object>> list = clubBoardService.clubBoardView(clubNo, saerchVo);
		logger.info("동호회 게시판목록 list.size={}",list.size());
		
		for(Map<String, Object> map : list) { 
			int countCommt = cbcService.selectCountComment(clubNo, clubNo);
			map.put("countCommt", countCommt);
			map.put("timeNew",Utility.displayNew((Date)map.get("REGDATE"))); 
		 }
		
		//3.
		model.addAttribute("list", list);
		
		return "club/clubBoard";
	}
	
	@RequestMapping("/clubBoardDetail")
	public String detailClubBoard(@RequestParam(defaultValue = "0")int clubNo,
			@RequestParam(defaultValue = "0")int boardNo,Model model) {
		//1.
		logger.info("동호회 게시판 상세보기 clubNo={},boardNo={}",clubNo,boardNo);
		
		if(clubNo==0 || boardNo==0) {
			model.addAttribute("msg", "잘못된 경로입니다.");
			model.addAttribute("url", "/club/clubBoardList");

			return "common/message";
		}
		
		clubBoardService.updateReadcount(boardNo); //조회수
		
		//2.
		Map<String, Object> map = clubBoardService.detailClubBoard(clubNo, boardNo);
		logger.info("동호회게시글 상세보기 결과 map={}",map);
		
		List<Map<String, Object>> commtList = cbcService.selectCommClub(clubNo, boardNo);
		logger.info("해당 동호회게시글 모든 답변 결과 commtList.size={}",commtList.size());
		//3.
		model.addAttribute("map", map);
		model.addAttribute("commtList", commtList);
		
		//4.
		return "club/clubBoardDetail";
	}
	
	@GetMapping("/editClubBoard")
	public String editClubBoard(@RequestParam int clubNo, int boardNo, Model model) {
		//1.
		logger.info("동호회 게시글 수정 페이지 보기 clubNo={},boardNo={}",clubNo,boardNo);
		//2.
		if(clubNo==0 || boardNo==0) {
			model.addAttribute("msg", "잘못된 경로입니다.");
			model.addAttribute("url", "/club/clubBoard?clubNo="+clubNo);
			
			return "common/message";
		}
		
		//3.
		Map<String, Object> map = clubBoardService.detailClubBoard(clubNo, boardNo);
		logger.info("파라미터로 알아보는 동게 수정페이지 map={}",map);

		model.addAttribute("map", map);
		//4.
		return "club/editClubBoard";
	}
	
	@RequestMapping("/editClubBoard")
	public String editClubBoard_post(@ModelAttribute ClubBoardVO clubVo, Model model) {
		//1.
		logger.info("동게 수정처리 clubVo={}",clubVo);
		
		//2.
		int cnt = clubBoardService.updateClubBoard(clubVo);
		logger.info("동게 수정처리 결과 cnt={}",cnt);
		//3.
		String msg="수정 실패하였습니다.", 
			   url="/club/editClubBoard?clubNo="+clubVo.getClubNo()+"&boardNo="+clubVo.getBoardNo();
		if(cnt>0) {
			msg="게시글 수정 완료 되었습니다.";
			url="/club/clubBoard?clubNo="+clubVo.getClubNo();
		}
		//4.
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}

	@RequestMapping("/clubComment")
	public String insertCommt(@ModelAttribute ClubBoardCommentVO cbcVo, Model model) {
		//1.
		logger.info("동게 답변달기 clubBoardCommentVo={}",cbcVo);
		
		//2.
		int comment = cbcService.insertClubCommt(cbcVo);
		logger.info("동게 답변 결과 comment={}",comment);
		
		String msg="등록 실패",
			   url="/club/clubBoardDetail?clubNo="+cbcVo.getClubNo()+"&boardNo="+cbcVo.getBoardNo();
		if(comment>0) {
			msg="답변 등록 완료되었습니다.";
		}
		//3.
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		//4.
		return "common/message";
	}
	
	public String deleteClubBoard(@RequestParam(defaultValue = "0")int clubNo,
			@RequestParam(defaultValue = "0")int boardNo, Model model) {
		//1.
		logger.info("동게 삭제 clubNo={},boardNo={}",clubNo,boardNo);
		//2.
		int cnt=clubBoardService.deleteClubBoard(clubNo, boardNo);
		logger.info("동게 삭제 결과 cnt={}",cnt);
		
		String msg="삭제 실패했습니다.", 
				url="/club/clubBoardDetail?clubNo="+clubNo+"&boardNo="+boardNo;
		if(clubNo==0 || boardNo==0) {
			msg="게시물 삭제 완료 되었습니다.";
		}
		
		//3.
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		//4.
		return "common/message";
	}
	
	
}

























