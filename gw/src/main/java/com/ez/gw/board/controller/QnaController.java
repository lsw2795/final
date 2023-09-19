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
import org.springframework.web.bind.annotation.ResponseBody;

import com.ez.gw.board.model.BoardService;
import com.ez.gw.board.model.BoardVO;
import com.ez.gw.board.model.ListBoardVO;
import com.ez.gw.comments.model.CommentsService;
import com.ez.gw.comments.model.CommentsVO;
import com.ez.gw.common.ConstUtil;
import com.ez.gw.common.FileUploadUtil;
import com.ez.gw.common.PaginationInfo;
import com.ez.gw.common.SearchVO;
import com.ez.gw.common.Utility;
import com.ez.gw.employee.model.EmployeeService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping
public class QnaController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	private final BoardService boardService;
	private final CommentsService commentsService;

	//Q&A 게시판 목록 메서드
	@RequestMapping("/qna/list")
	public String qnaList(@ModelAttribute SearchVO searchVo, Model model) {
		logger.info("qna 목록 페이지");

		//[1] PaginationInfo 객체 생성
		PaginationInfo pagingInfo=new PaginationInfo();
		pagingInfo.setBlockSize(ConstUtil.BLOCK_SIZE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		//[2] SearchVo에 입력되지 않은 두 개의 변수에 값 셋팅
		searchVo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		//총 레코드 개수 구하는 메서드
		int totalRecord=boardService.getQnaTotalCount(searchVo);
		pagingInfo.setTotalRecord(totalRecord);

		//Q&A 글 목록 조회 메서드
		List<Map<String, Object>> list = boardService.selectQnaAll(searchVo);
		logger.info("qna 전체 조회 결과, list.size={}", list.size());

		//글 목록에 댓글 갯수와 24시간내에 글 등록 여부 조회 후 결과 포함 
		for(Map<String, Object> map : list) {
			int boardNo = Integer.parseInt(String.valueOf(map.get("BOARD_NO")));
			int countReply = commentsService.selectCountReply(boardNo);
			map.put("countReply", countReply);
			map.put("timeNew", Utility.displayNew((Date)map.get("REGDATE")));
		}
		
		model.addAttribute("list", list);
		model.addAttribute("pagingInfo", pagingInfo);
		
		return "qna/list";
	}

	//Q&A 글 등록 뷰 페이지 메서드 
	@GetMapping("/qna/write")
	public String qnaWrite_get() {
		logger.info("qna 등록 페이지");

		return "qna/write";
	}

	//Q&A 글 등록 메서드
	@PostMapping("/qna/write")
	public String qnaWrite_post(@ModelAttribute BoardVO vo, HttpSession session, Model model) {
		int empNo = (int)session.getAttribute("empNo");
		vo.setEmpNo(empNo);
		logger.info("qna 글 등록, 파라미터 vo={}, empNo={}", vo, empNo);

		//Q&A 글 등록 메서드
		int cnt = boardService.insertQna(vo);
		logger.info("qna 등록 결과, cnt={}", cnt);

		String msg = "질문 등록에 실패하였습니다.", url = "/qna/list";
		if(cnt>0) {
			msg = "질문이 등록되었습니다.";
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";
	}

	//Q&A 상세보기 메서드
	@RequestMapping("/qna/detail")
	public String qnaDetail(@RequestParam(defaultValue = "0") int boardNo, Model model) {
		logger.info("qna 상세보기 페이지, 파라미터 boardNo={}", boardNo);

		if(boardNo==0) {
			model.addAttribute("msg", "잘못된 경로입니다.");
			model.addAttribute("url", "/qna/list");

			return "common/message";
		}

		//글 조회수 증가 메서드
		boardService.updateReadcount(boardNo); 

		//Q&A 글 상세조회 메서드
		Map<String, Object> map = boardService.selectQna(boardNo);
		logger.info("qna 글 상세조회 결과, map={}", map);

		//Q&A 게시글 답변 조회 메서드
		List<Map<String, Object>> replyList = commentsService.selectQnaReplys(boardNo);
		logger.info("해당 게시글 답변 조회 목록, replyList={}", replyList);

		model.addAttribute("map", map);
		model.addAttribute("replyList", replyList);

		return "qna/detail";
	}

	//Q&A 게시글 수정 뷰페이지 메서드
	@GetMapping("/qna/edit")
	public String qnaEdit(@RequestParam(defaultValue = "0") int boardNo, Model model) {
		logger.info("질문 수정 페이지, 파라미터 boardNo={}", boardNo);

		if(boardNo==0) {
			model.addAttribute("msg", "잘못된 경로입니다.");
			model.addAttribute("url", "/qna/list");

			return "common/message";
		}

		//Q&A 글 상세조회 메서드
		Map<String, Object> map = boardService.selectQna(boardNo);
		logger.info("게시글 번호로 정보 조회 결과, map={}", map);

		model.addAttribute("map", map);

		return "qna/edit";
	}

	//Q&A 게시글 수정 메서드
	@PostMapping("/qna/edit")
	public String qnaEdit_post(@ModelAttribute BoardVO vo, Model model) {
		logger.info("qna 수정, 파라미터 vo={}", vo);

		//Q&A 수정 메서드
		int cnt = boardService.updateQna(vo);
		logger.info("qna 수정 결과, cnt={}", cnt);

		String msg = "질문 수정에 실패하였습니다.", url = "/qna/edit?boardNo=" + vo.getBoardNo();
		if(cnt>0) {
			msg = "질문이 수정되었습니다.";
			url = "/qna/list";
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";
	}
	
	//Q&A 삭제 메서드
	@RequestMapping("/qna/delete")
	public String qnaDelete(@RequestParam(defaultValue = "0") int boardNo, Model model) {
		logger.info("질문 삭제 파라미터, boardNo={}", boardNo);
		if(boardNo==0) {
			model.addAttribute("msg", "잘못된 경로입니다.");
			model.addAttribute("url", "/qna/list");

			return "common/message";
		}

		//Q&A 삭제 메서드
		int cnt = boardService.deleteQna(boardNo);

		String msg = "질문 삭제에 실패하였습니다.", url = "/qna/edit?boardNo=" + boardNo;
		if(cnt>0) {
			msg = "질문이 삭제되었습니다.";
			url = "/qna/list";
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";
	}

	//Q&A 답변 등록 메서드
	@RequestMapping("/qna/reply")
	public String reply(@ModelAttribute CommentsVO vo) {
		logger.info("답변 등록 파라미터, vo={}", vo);

		//Q&A 답변 등록 메서드
		int cnt = commentsService.insertQnaReply(vo);
		logger.info("답변 등록 결과, cnt={}", cnt);

		return "redirect:/qna/detail?boardNo=" + vo.getBoardNo();
	}
	
	//Q&A 답변 삭제 메서드
	@RequestMapping("/qna/commentDelete")		
	public String commentDelete(@RequestParam int commentNo, @RequestParam int boardNo
			,Model model) {
		logger.info("qna - 답변 삭제 파라미터 commentNo={}", commentNo);

		//Q&A 게시판 답변 삭제 메서드
		int cnt = commentsService.deleteQnaComment(commentNo);
		logger.info("qna - 답변삭제 결과 cnt={}", cnt);

		String msg = "답변 삭제를 실패하였습니다.", url = "/qna/detail?boardNo=" + boardNo;
		if(cnt>0) {
			msg = "답변이 삭제되었습니다.";
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";

	}
	
	//Q&A 답변 수정 메서드
	@RequestMapping("/qna/editComment")
	public String editComment(@ModelAttribute CommentsVO commentsVo, Model model) {
		logger.info("qna - 답변 수정 파라미터 commentsVo={}", commentsVo);

		//Q&A 게시판 답변 수정 메서드
		int cnt = commentsService.updateQnaComment(commentsVo);
		logger.info("qna - 답변 수정 결과 cnt={}", cnt);

		String msg ="답변 수정에 실패하였습니다.", url = "/qna/detail?boardNo=" + commentsVo.getBoardNo();

		if(cnt>0) {
			msg = "답변이 수정되었습니다.";
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";
	}

	//-----------------------------admin-----------------------------------

	// 관리자 - Q&A 게시판 목록 메서드
	@RequestMapping("/admin/qna/list")
	public String adminQnaList(@ModelAttribute SearchVO searchVo, Model model) {
		logger.info("관리자 - qna 목록 페이지 파라미터 searchVo={}", searchVo);

		//[1] PaginationInfo 객체 생성
		PaginationInfo pagingInfo=new PaginationInfo();
		pagingInfo.setBlockSize(ConstUtil.BLOCK_SIZE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);

		//[2] SearchVo에 입력되지 않은 두 개의 변수에 값 셋팅
		searchVo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		//관리자 - Q&A 글 목록 조회 메서드
		List<Map<String, Object>> list = boardService.selectAdminQnaAll(searchVo);
		logger.info("qna 전체 조회 결과, list.size={}", list.size());

		//관리자 - 글 목록에 댓글 갯수와 24시간내에 글 등록 여부 조회 후 결과 포함
		for(Map<String, Object> map : list) {
			int boardNo = Integer.parseInt(String.valueOf(map.get("BOARD_NO")));
			int countReply = commentsService.selectCountReply(boardNo);
			map.put("countReply", countReply);
			map.put("timeNew", Utility.displayNew((Date)map.get("REGDATE")));
		}
		
		//관리자 - 총 레코드 개수 구하는 메서드
		int totalRecord=boardService.selectAdminQnaTotalRecord(searchVo);
		logger.info("관리자 - qna 리스트 검색 조회 총 레코드 갯수 totalRecord={}", totalRecord);
		pagingInfo.setTotalRecord(totalRecord);

		model.addAttribute("list", list);
		model.addAttribute("pagingInfo", pagingInfo);

		return "admin/qna/list";

	}

	//관리자 - Q&A 글 다중삭제 메서드
	@RequestMapping("/admin/qna/deleteMulti")
	public String admin_qnaDelete(@ModelAttribute ListBoardVO listVo,
			HttpServletRequest request, Model model) {
		logger.info("관리자 - 선택한 게시글 삭제, 파라미터 listVo={}", listVo);
		
		List<BoardVO> list = listVo.getBoardItems();
		//관리자 - Q&A 다중삭제를 위한 메서드
		int cnt = boardService.deleteMulti(list);
		logger.info("게시글 삭제 결과, cnt={}", cnt);

		String msg = "선택한 게시글 삭제 중 에러가 발생했습니다.", url = "/admin/qna/list";
		if(cnt>0) {
			msg = "선택한 게시글들을 삭제했습니다.";
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";
	}

	//관리자 - Q&A 글 등록 뷰페이지
	@GetMapping("/admin/qna/write")
	public String adminQnaWrite() {
		logger.info("관리자 - qna 등록 페이지");

		return "admin/qna/write";
	}

	//관리자 - Q&A 글 등록 메서드
	@PostMapping("/admin/qna/write")
	public String adminQnaWritePost(@ModelAttribute BoardVO vo, HttpSession session, Model model) {
		int empNo = (int)session.getAttribute("empNo");
		vo.setEmpNo(empNo);
		logger.info("관리자 - qna 등록, 파라미터 vo={}, empNo={}", vo, empNo);

		//관리자 - Q&A 글 등록 메서드
		int cnt = boardService.insertQna(vo);
		logger.info("qna 등록 결과, cnt={}", cnt);

		String msg = "질문 등록에 실패하였습니다.", url = "/admin/qna/list";
		if(cnt>0) {
			msg = "질문이 등록되었습니다.";
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";
	}

	//관리자 - Q&A 상세보기 메서드
	@RequestMapping("/admin/qna/detail")
	public String adminQnaDetail(@RequestParam(defaultValue = "0") int boardNo, Model model) {
		logger.info("관리자 - qna 글 상세보기 페이지, 파라미터 boardNo={}", boardNo);

		if(boardNo==0) {
			model.addAttribute("msg", "잘못된 경로입니다.");
			model.addAttribute("url", "/admin/qna/list");

			return "common/message";
		}
		
		//Q&A 조회수 증가 메서드
		boardService.updateReadcount(boardNo);
		
		//관리자 - Q&A 글 상세조회 메서드
		Map<String, Object> map = boardService.selectQna(boardNo);
		logger.info("관리자 - qna 글 상세조회 결과, map={}", map);
		
		//관리자 - Q&A 게시글 답변 조회 메서드
		List<Map<String, Object>> replyList = commentsService.selectQnaReplys(boardNo);
		logger.info("관리자 - 해당 게시글 답변 조회 목록, replyList={}", replyList);

		model.addAttribute("map", map);
		model.addAttribute("replyList", replyList);

		return "admin/qna/detail";
	}
	
	//관리자 - Q&A 삭제 메서드
	@RequestMapping("/admin/qna/delete")
	public String adminQnaDelete(@RequestParam(defaultValue = "0") int boardNo, Model model) {
		logger.info("괸리자 - 질문 삭제 파라미터, boardNo={}", boardNo);
		if(boardNo==0) {
			model.addAttribute("msg", "잘못된 경로입니다.");
			model.addAttribute("url", "/admin/qna/list");

			return "common/message";
		}

		//Q&A 삭제 메서드
		int cnt = boardService.deleteQna(boardNo);

		String msg = "질문 삭제에 실패하였습니다.", url = "/admin/qna/edit?boardNo=" + boardNo;
		if(cnt>0) {
			msg = "질문이 삭제되었습니다.";
			url = "/admin/qna/list";
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";
	}

	//관리자 - 답변 등록 메서드
	@RequestMapping("/admin/qna/reply")
	public String adminReply(@ModelAttribute CommentsVO vo, HttpSession session) {
		logger.info("관리자 - 답변 등록 파라미터, vo={}", vo);

		int cnt = commentsService.insertQnaReply(vo);
		logger.info("괸리자 - 답변 등록 결과, cnt={}", cnt);

		return "redirect:/admin/qna/detail?boardNo=" + vo.getBoardNo();
	}
	
	//관리자 - 답변 수정 뷰페이지 메서드
	@GetMapping("/admin/qna/edit")
	public String adminQnaEdit(@RequestParam(defaultValue = "0") int boardNo, Model model) {
		logger.info("관리자 - 질문 수정 페이지, 파라미터 boardNo={}", boardNo);

		if(boardNo==0) {
			model.addAttribute("msg", "잘못된 경로입니다.");
			model.addAttribute("url", "/qna/list");

			return "common/message";
		}

		//Q&A 글 상세조회 메서드
		Map<String, Object> map = boardService.selectQna(boardNo);
		logger.info("관리자 - 게시글 번호로 정보 조회 결과, map={}", map);

		model.addAttribute("map", map);

		return "admin/qna/edit";
	}

	//관리자 - 답변 수정 메서드
	@PostMapping("/admin/qna/edit")
	public String adminQnaEdit_post(@ModelAttribute BoardVO vo, Model model) {
		logger.info("관리자 - qna 수정, 파라미터 vo={}", vo);

		//관리자 - Q&A 수정 메서드
		int cnt = boardService.updateQna(vo);
		logger.info("관리자 - qna 수정 결과, cnt={}", cnt);

		String msg = "질문 수정에 실패하였습니다.", url = "admin/qna/edit?boardNo=" + vo.getBoardNo();
		if(cnt>0) {
			msg = "질문이 수정되었습니다.";
			url = "/admin/qna/list";
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";
	}
	
}
