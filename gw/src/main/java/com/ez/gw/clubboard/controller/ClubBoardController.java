package com.ez.gw.clubboard.controller;

import java.io.File;
import java.io.IOException;
import java.net.http.HttpRequest;
import java.util.Date;
import java.util.HashMap;
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
import com.ez.gw.clubboard.model.ListClubBoardVO;
import com.ez.gw.clubboardComment.model.ClubBoardCommentService;
import com.ez.gw.clubboardComment.model.ClubBoardCommentVO;
import com.ez.gw.common.ConstUtil;
import com.ez.gw.common.FileUploadUtil;
import com.ez.gw.common.SearchVO;
import com.ez.gw.common.Utility;
import com.ez.gw.pds.model.PdsService;
import com.ez.gw.pds.model.PdsVO;
import com.ez.gw.report.model.ReportService;
import com.ez.gw.report.model.ReportVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class ClubBoardController {
	private static final Logger logger = LoggerFactory.getLogger(ClubBoardController.class);
	private final ClubBoardService clubBoardService;
	private final ClubBoardCommentService cbcService;
	private final PdsService pdsService;
	private final ReportService reportService;
	private final FileUploadUtil fileUploadUtil;

	//동호회 게시글 작성페이지 보여주기
	@GetMapping("/club/clubBoardWrite")
	public String clubBoardWrite() {
		logger.info("동호회 게시판 작성");
		return "club/clubBoardWrite";
	}
	
	//동호회 게시글 실제 작성
	@PostMapping("/club/clubBoardWrite")
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

			String msg="",url="";

			//2.
			//파일 업로드 처리 
			MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
			List<MultipartFile> files = multiRequest.getFiles("imageURL");
			logger.info("files.size={}",files.size());


			cnt=clubBoardService.insertClubBoard(clubVo);
			logger.info("동호회 게시판 작성 결과 cnt={}",cnt);

			int i=0;
			for(MultipartFile f : files){
				originalFileName = f.getOriginalFilename();
				if(originalFileName!="") {
					int idx=originalFileName.indexOf(".");
					logger.info("idx={}",idx);
					String cutfile = originalFileName.substring(idx);

					fileName = clubVo.getClubNo() + "_" + i++ + f.getOriginalFilename();
					fileSize = (long) f.getSize();

					String path = ConstUtil.CLUB_UPLOAD_PATH;
					String filePath = request.getSession().getServletContext().getRealPath(path);

					File file = new File(filePath, fileName);
					f.transferTo(file);

					logger.info("파일명 fileName={}",fileName);
					pdsVo.setClubBoardNo(clubVo.getBoardNo());
					pdsVo.setPath(filePath);
					pdsVo.setFileName(fileName);
					pdsVo.setFileSize(fileSize);
					pdsVo.setOriginalFileName(originalFileName);
					pdsVo.setFileExtension(cutfile);

					logger.info("board_no={}", clubVo.getBoardNo());
					int res=pdsService.clubFiles(pdsVo);
					logger.info("파일 db저장 결과 res={}",res);		
				}
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

	//동호회 게시판-목록(리스트) 보여주기
	@RequestMapping("/club/clubBoard")
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
	
	//동호회 게시판 상세보기
	@RequestMapping("/club/clubBoardDetail")
	public String detailClubBoard(@RequestParam(defaultValue = "0")int clubNo,
			@RequestParam(defaultValue = "0")int boardNo,
			Model model) {
		//1.
		logger.info("동호회 게시판 상세보기 clubNo={},boardNo={}",clubNo,boardNo);

		if(clubNo==0 || boardNo==0) {
			model.addAttribute("msg", "잘못된 경로입니다.");
			model.addAttribute("url", "/club/clubBoard?clubNo="+clubNo);

			return "common/message";
		}

		int readcount=clubBoardService.updateReadcount(boardNo); //조회수
		logger.info("동게 조회수 readcount={}",readcount);

		//2.
		Map<String, Object> map = clubBoardService.detailClubBoard(clubNo, boardNo);
		logger.info("동호회게시글 상세보기 결과 map={}",map);

		List<Map<String, Object>> list=clubBoardService.selectImg(boardNo);
		logger.info("동호회게시글 상세보기 이미지 list={}",list.size());


		List<Map<String, Object>> commtList = cbcService.selectCommClub(clubNo, boardNo);
		logger.info("해당 동호회게시글 모든 답변 결과 commtList.size={}",commtList.size());
		//3.
		model.addAttribute("map", map);
		model.addAttribute("list", list);
		model.addAttribute("commtList", commtList);

		//4.
		return "club/clubBoardDetail";
	}

	//동호회 게시판 - 수정 페이지 보여주기
	@GetMapping("/club/editClubBoard")
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

		List<Map<String, Object>> list=clubBoardService.selectImg(boardNo);
		logger.info("동호회게시글 상세보기 이미지 list={}",list.size());

		model.addAttribute("map", map);
		model.addAttribute("list", list);

		//4.
		return "club/editClubBoard";
	}
	
	//동호회 게시판 - 실제 수정 페이지
	@PostMapping("/club/editClubBoard")
	public String editClubBoard_post(@ModelAttribute ClubBoardVO clubVo,
			@RequestParam(name = "delImg", required = false) String[] delImg, 
			HttpServletRequest request,
			Model model) {
		//1.
		logger.info("동게 수정처리 clubVo={}",clubVo);
		logger.info("삭제대상 파일 이름 delImg={}", delImg);

		//2.
		//게시글 내용 수정
		int cnt = clubBoardService.updateClubBoard(clubVo);
		logger.info("동게 수정처리 결과 cnt={}",cnt);

		//3.
		PdsVO pdsVo = new PdsVO();
		String msg="수정 실패하였습니다.", 
				url="/club/clubBoardDetail?clubNo="+clubVo.getClubNo()+"&boardNo="+clubVo.getBoardNo();
		//게시글 내용 수정에 성공하면
		if(cnt>0) {
			msg="게시글이 수정되었습니다.";

			String fileName = "", originalFileName = "";
			long fileSize = 0;

			//2.
			MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
			List<MultipartFile> files = multiRequest.getFiles("imageURL2");
			logger.info("files.size={}",files.size());

			//삭제대상 파일이 있으면
			if(delImg != null && delImg.length > 0) {
				//jsp에서 넘어온 삭제 대상 파일들을 삭제하고 해당파일들을 db에 저장되어있는 데이터들을 삭제
				for(String delFile : delImg) {
					//실제 파일삭제
					File f = new File(fileUploadUtil.getUploadPath(request, ConstUtil.UPLOAD_FILE_FLAG), delFile);
					if(f.exists()) {
						boolean result = f.delete();
						logger.info("파일 삭제 여부 result={}", result);
						//db에서 삭제
						clubBoardService.deleteClubFileOne(delFile, clubVo.getBoardNo());

					}

				}
			}

			//새 파일 업로드 처리
			int i=0;
			for(MultipartFile f : files){
				originalFileName = f.getOriginalFilename();
				if(originalFileName!="") {
					int idx=originalFileName.indexOf(".");
					logger.info("idx={}",idx);
					String cutfile = originalFileName.substring(idx);

					fileName = clubVo.getClubNo() + "_" + i++ + f.getOriginalFilename();
					fileSize = (long) f.getSize();

					String path = ConstUtil.CLUB_UPLOAD_PATH;
					String filePath = request.getSession().getServletContext().getRealPath(path);

					File file = new File(filePath, fileName);
					try {
						f.transferTo(file);
					} catch (IllegalStateException | IOException e) {
						e.printStackTrace();
					}

					logger.info("파일명 fileName={}",fileName);
					pdsVo.setClubBoardNo(clubVo.getBoardNo());
					pdsVo.setPath(filePath);
					pdsVo.setFileName(fileName);
					pdsVo.setFileSize(fileSize);
					pdsVo.setOriginalFileName(originalFileName);
					pdsVo.setFileExtension(cutfile);

					logger.info("board_no={}", clubVo.getBoardNo());
					int res=pdsService.clubFiles(pdsVo);
					logger.info("파일 db저장 결과 res={}",res);		
				}
			}//for

		}	
		//4.
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";
	}

	//동호회 게시판 - 답변(댓글) 작성 및 등록
	@RequestMapping("/club/clubComment")
	public String insertCommt(@ModelAttribute ClubBoardCommentVO cbcVo, Model model) {
		//1.
		logger.info("동게 답변달기 clubBoardCommentVo={}",cbcVo);

		//2.
		int comment = cbcService.insertClubCommt(cbcVo);
		logger.info("동게 답변 결과 comment={}",comment);

		String msg="답변 등록 실패",
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
	
	//동호회 게시판 - 삭제
	@RequestMapping("/club/deleteClubBoard")
	public String deleteClubBoard(@RequestParam(defaultValue = "0")int clubNo,
			@RequestParam(defaultValue = "0")int boardNo, Model model) {
		//1.
		logger.info("동게 삭제 clubNo={},boardNo={}",clubNo,boardNo);
		//2.
		int cnt=clubBoardService.deleteClubBoard(boardNo);
		logger.info("동게 삭제 결과 cnt={}",cnt);

		String msg="삭제 실패했습니다.", 
				url="/club/clubBoardDetail?clubNo="+clubNo+"&boardNo="+boardNo;
		if(cnt>0) {
			msg="게시물 삭제 완료 되었습니다.";
			url="/club/clubBoard?clubNo="+clubNo;
		}

		//3.
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		//4.
		return "common/message";
	}
	
	//동호회 게시판 - 답변(댓글)만 삭제
	@RequestMapping("/club/deleteComment")
	public String commentDelete(@RequestParam(defaultValue = "0")int commentNo,
			@RequestParam(defaultValue = "0")int clubNo,
			@RequestParam(defaultValue = "0")int boardNo,Model model) {
		//1.
		logger.info("동게-댓글 삭제 commentNo={},clubNo={},boardNo={}",commentNo,clubNo,boardNo);

		//2.
		// 실제 댓글 삭제 로직 수행
		int cnt = cbcService.deletCommet(commentNo, clubNo, boardNo);
		logger.info("동게-댓글 삭제 결과 cnt={}",cnt);

		String msg="삭제 실패했습니다.", 
				url="/club/clubBoardDetail?clubNo="+clubNo+"&boardNo="+boardNo;
		if(cnt>0) {
			msg="댓글이 삭제 되었습니다.";
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";
	}
	
	//동호회 게시판 - 답변(댓글)만 수정
	@PostMapping("/club/editComment")
	public String commentEdit(@ModelAttribute ClubBoardCommentVO cbcVo,
			Model model) {

		//1.
		logger.info("댓글 수정 ClubBoardCommentVO={}",cbcVo);

		//2.
		int cnt=cbcService.editCommet(cbcVo);
		logger.info("댓글 수정 cnt={}",cnt);

		String msg="댓글 수정 실패",
				url="/club/clubBoardDetail?clubNo="+cbcVo.getClubNo()+"&boardNo="+cbcVo.getBoardNo();
		if(cnt>0) {
			msg="댓글 수정이 완료되었습니다.";
		}

		//3.
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		//4.
		return "common/message";
	}



	//--------------------------------Admin 관리자----------------------------------------
	
	//관리자(동호회 게시판) - 신고된 목록 보여주기
	@GetMapping("/admin/adminclub/adminClubReport")
	public String adminReport(@ModelAttribute SearchVO searchVo ,Model model) {
		//1.
		logger.info("관리자 - 동호회 신고 목록 페이지");

		//2.
		List<Map<String, Object>> list = reportService.selectReportClub(searchVo);
		logger.info("관리자 - 동호회 신고 목록 개수 list.size={}",list.size());

		//3.
		model.addAttribute("list", list);

		//4.
		return "admin/adminclub/adminClubReport";
	}


	//관리자(동호회 게시판) - 신고함 다중 삭제
	@RequestMapping("/admin/adminclub/deleteMulti")
	public String deleteMulti(@ModelAttribute ListClubBoardVO listBoardVo, Model model) {
		//1.
		logger.info("관리자 - 동호회 신고리스트 다중삭제 listBoardVo={}",listBoardVo);

		//2.
		List<ClubBoardVO> list = listBoardVo.getClubBoardItems();
		int cnt=clubBoardService.deleteMulti(list);
		logger.info("신고 다중 삭제 결과 cnt={}",cnt);

		String msg="신고 게시글 삭제 실패했습니다.",url="/admin/adminclub/adminClubReport";
		if(cnt>0) {
			msg="신고 게시글 삭제 성공했습니다.";
		}
		//3.
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		//4.
		return "common/message";

	}
	
	//관리자(동호회 게시판) - 신고된 게시물 삭제
	@RequestMapping("/admin/adminclub/adminDeleteClubBoard")
	public String adminDeleteClubBoard(@RequestParam(defaultValue = "0")int boardNo,
			Model model) {
		//1.
		logger.info("관리자 - 신고 동호회게시물 삭제 boardNo={},reportNo={}",boardNo);

		//2.
		int cnt=clubBoardService.deleteClubBoard(boardNo);
		logger.info("신고 동호회 게시물 삭제 결과 cnt={}",cnt);

		String msg="삭제 실패했습니다.", url="/admin/adminclub/adminClubReport";
		if(cnt>0) {
			msg="삭제완료 되었습니다.";
		}

		//3.
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		//4.
		return "common/message";
	}



}

























