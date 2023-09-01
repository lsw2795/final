package com.ez.gw.board.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
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
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ez.gw.board.model.BoardService;
import com.ez.gw.board.model.BoardVO;
import com.ez.gw.boardlist.model.BoardListService;
import com.ez.gw.comments.model.CommentsService;
import com.ez.gw.comments.model.CommentsVO;
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
	private final CommentsService commentService;
	private final FileUploadUtil fileUploadUtil;
	
	@RequestMapping("/boardList")
	public String anonymousBoardList(HttpSession session,Model model) {
		logger.info("익명게시판 페이지");
		
		List<Map<String, Object>> anonymousList = boardService.select24List();
		logger.info("게시글 조회 anonymousList={}",anonymousList);
		
		List<PdsVO> imageList = pdsService.select24AnonymousImage();
		logger.info("이미지 조회 imageList={}",imageList);
		
		List<CommentsVO> commentsList = commentService.anonymousAllReply();
		logger.info("댓글 조회 commentsList={}",commentsList);
		
		List<Map<String, Object>> commentCntList = commentService.countComment();
		
		model.addAttribute("anonymousList",anonymousList);
		model.addAttribute("imageList",imageList);
		model.addAttribute("commentsList",commentsList);
		model.addAttribute("commentCntList",commentCntList);
		
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
				
				if(fileList!=null && !fileList.isEmpty()) {
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
	
	@RequestMapping("/boardEdit")
	public String anonymousBoardEdit(@ModelAttribute BoardVO boardVo,
			@RequestParam(required = false) String[] deleteImg,
			Model model,HttpServletRequest request) {
		logger.info("익명게시판 글 수정 파라미터 boardVo={}",boardVo);
		logger.info("익명게시판 글 수정 삭제이미지 deleteImg={}",deleteImg);
		
		PdsVO pdsVo = new PdsVO();
		
		int cnt = boardService.updateAnonymousBoard(boardVo);
		logger.info("익명게시판 글 수정 결과 cnt={}",cnt);
		
		String msg="게시글 수정중 에러가 발생했습니다.",url="/anonymous/boardList";
		if(cnt>0) {
			msg="게시글이 수정되었습니다.";
			try {
				List<Map<String, Object>> fileList = fileUploadUtil.Multifileupload(request, ConstUtil.UPLOAD_IMAGE_FLAG);
				logger.info("파일 업로드 fileList={}",fileList.size());
				
				if(fileList!=null && !fileList.isEmpty()) {
					for(Map<String, Object> fileMap : fileList) {
						String fileName=(String)fileMap.get("fileName");
						String originalFileName=(String)fileMap.get("originalFileName");
						
						pdsVo.setBoardNo(boardVo.getBoardNo()); //게시글 번호
						pdsVo.setFileName(fileName); //서버저장 파일명
						pdsVo.setOriginalFileName(originalFileName); //원본 파일명
						
						cnt=pdsService.insertPdsByAnonymous(pdsVo);
						logger.info("파일 저장 결과 cnt={}",cnt);
						
						if(cnt>0) {
							msg="게시글이 수정되었습니다.";
						}
					}
				}
				
				if(deleteImg!=null) {
		    		for(int i=0; i<deleteImg.length; i++) {
		    			File f = new File(fileUploadUtil.getUploadPath(request, ConstUtil.UPLOAD_IMAGE_FLAG), deleteImg[i]);
		    			if(f.exists()) {
		    				boolean result = f.delete();
		    				logger.info("파일 삭제 여부 result={}", result);
		    				if(result) {
		    					pdsVo.setFileName(deleteImg[i]);
		    					pdsVo.setBoardNo(boardVo.getBoardNo());
		    					cnt=pdsService.deleteAnonymousImg(pdsVo);
		    				}
		    				
		    				if(cnt>0) {
								msg="게시글이 수정되었습니다.";
							}
		    			}
		    		}//for
				}//if
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		}
		
		model.addAttribute("url",url);
		model.addAttribute("msg",msg);
		
		return "common/message";
	}
	
	@RequestMapping("/datgeulWrite")
	public String datdeulWrite(@ModelAttribute CommentsVO vo, HttpSession session, Model model) {
		int empNo=(int)session.getAttribute("empNo");
		logger.info("익명게시판 댓글 처리 파라미터 vo={}",vo);
		
		vo.setEmpNo(empNo);
		
		int cnt=commentService.insertAnonymousReply(vo);
		
		String msg="댓글 등록중 에러가 발생했습니다.",url="/anonymous/boardList";
		if(cnt>0) {
			msg="댓글이 등록되었습니다.";
		}
		
		model.addAttribute("url",url);
		model.addAttribute("msg",msg);
		
		return "common/message";
	}
	
	@RequestMapping("/replyWrite")
	public String replyWrite(@ModelAttribute CommentsVO vo, HttpSession session, Model model) {
		int empNo=(int)session.getAttribute("empNo");
		logger.info("익명게시판 답글 처리 파라미터 vo={}",vo);
		
		vo.setEmpNo(empNo);
		
		int cnt=commentService.reply(vo);
		
		String msg="답글 등록중 에러가 발생했습니다.",url="/anonymous/boardList";
		if(cnt>0) {
			msg="답글이 등록되었습니다.";
		}
		
		model.addAttribute("url",url);
		model.addAttribute("msg",msg);
		
		return "common/message";
	}
	
	@ResponseBody
	@RequestMapping("/replyEditAjax")
	public String replyEdit(@ModelAttribute CommentsVO vo) {
		logger.info("익명게시판 댓글 수정 처리 파라미터 vo={}",vo);
		
		int cnt=commentService.updateAnonymousComments(vo);
		
		String msg="댓글 수정 중 에러가 발생했습니다.";
		if(cnt>0) {
			msg="댓글이 수정되었습니다.";
		}
		
		return msg;
	}
	
	@ResponseBody
	@RequestMapping("/replyDeleteAjax")
	public Map<String, Object> replyDelete(@ModelAttribute CommentsVO vo, Model model) {
		logger.info("익명게시판 댓글 삭제 처리 파라미터 vo={}",vo);
		
		int cnt=commentService.deleteAnonymousComments(vo.getCommentNo());
		
		String msg="댓글 삭제 중 에러가 발생했습니다.";
		if(cnt>0) {
			msg="댓글이 삭제되었습니다.";
		}
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("cnt",cnt);
		map.put("msg",msg);
		
		return map;
	}
	
	@RequestMapping("/deleteAnonymousBoard")
	public String deleteAnonymousBoard(@RequestParam(defaultValue = "0") int boardNo, Model model) {
		logger.info("익명게시판 게시글 삭제 처리 파라미터 boardNo={}",boardNo);
		
		int cnt=boardService.deleteAnonymousBoard(boardNo);
		
		String msg="게시글 삭제 중 에러가 발생했습니다.",url="/anonymous/boardList";
		if(cnt>0) {
			msg="게시글이 삭제되었습니다.";
		}
		
		model.addAttribute("url",url);
		model.addAttribute("msg",msg);
		
		return "common/message";
	}
}

