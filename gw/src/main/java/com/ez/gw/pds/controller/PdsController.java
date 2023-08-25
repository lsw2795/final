package com.ez.gw.pds.controller;

import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
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
import org.springframework.web.servlet.ModelAndView;

import com.ez.gw.board.model.BoardService;
import com.ez.gw.board.model.BoardVO;
import com.ez.gw.board.model.ListBoardVO;
import com.ez.gw.common.ConstUtil;
import com.ez.gw.common.FileUploadUtil;
import com.ez.gw.common.PaginationInfo;
import com.ez.gw.common.SearchVO;
import com.ez.gw.common.Utility;
import com.ez.gw.employee.model.EmployeeService;
import com.ez.gw.employee.model.EmployeeVO;
import com.ez.gw.pds.model.ListPdsVO;
import com.ez.gw.pds.model.PdsService;
import com.ez.gw.pds.model.PdsVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping
public class PdsController {
	private static final Logger logger=LoggerFactory.getLogger(PdsController.class);
	private final PdsService pdsService;
	private final BoardService boardService;
	private final FileUploadUtil fileUploadUtil;
	private final EmployeeService employeeService;


	@RequestMapping("/pds/list")
	public String list(@ModelAttribute SearchVO searchVo ,Model model) {
		//1
		logger.info("자료실 메인페이지 파라미터 searchVo={}", searchVo);

		//2
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(ConstUtil.BLOCK_SIZE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);

		//[2]SearchVo에 입력되지 않은 두 개의 변수에 값 셋팅
		searchVo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());

		List<Map<String, Object>> list = pdsService.selectPdsAll(searchVo);
		logger.info("자료실 전체조회, list.size={}", list.size());

		for (Map<String, Object> map : list) {
			BigDecimal boardNoDecimal = (BigDecimal) map.get("BOARD_NO");
			int boardNo = boardNoDecimal.intValue(); // BigDecimal을 int로 변환
			int fileCount = pdsService.selectIsFile(boardNo); // 파일 첨부 여부 조회
			map.put("fileCount", fileCount);
			map.put("timeNew", Utility.displayNew((Date)map.get("REGDATE")));

		}

		int totalRecord = pdsService.getTotalRecord(searchVo);
		logger.info("글 목록 전체 조회 - totalRecord={}", totalRecord);
		pagingInfo.setTotalRecord(totalRecord);

		//3
		model.addAttribute("list", list);
		model.addAttribute("pagingInfo", pagingInfo);

		//4
		return "pds/list";


	}

	@GetMapping("/pds/write")
	public String write(HttpSession session, Model model) {
		int empNo = (int)session.getAttribute("empNo");
		//1
		logger.info("자료실 등록 페이지");

		//2
		EmployeeVO vo = employeeService.selectByEmpNo(empNo);

		//3
		model.addAttribute("vo", vo);

		//4
		return "pds/write";
	}

	@PostMapping("/pds/write")
	public String write_post(@ModelAttribute BoardVO boardVo, @ModelAttribute PdsVO pdsVo,
			HttpSession session,HttpServletRequest request, Model model) {
		//1
		int empNo = (int)session.getAttribute("empNo");
		boardVo.setEmpNo(empNo);
		logger.info("자료실 등록, 파라미터 vo={}", boardVo);

		//2
		//파일 업로드 처리
		String fileName="", originalFileName="", filePath = "";
		long fileSize = 0;

		int cnt = pdsService.insertPds(boardVo);
		logger.info("자료실-게시글 등록 결과, cnt={}", cnt);

		List<Map<String, Object>> fileList;
		try {
			fileList = fileUploadUtil.fileupload(request, ConstUtil.UPLOAD_FILE_FLAG);
			for(Map<String, Object> map : fileList) {
				fileName = (String) map.get("fileName");
				originalFileName = (String) map.get("originalFileName");
				fileSize = (long) map.get("fileSize");
				filePath = (String) map.get("uploadPath") + File.separator + fileName;

				logger.info("파일명:{}", fileName);
				pdsVo.setBoardListNo(3000); //게시판 번호
				pdsVo.setBoardNo(boardVo.getBoardNo()); //게시글 번호
				pdsVo.setFileExtension(originalFileName.substring(originalFileName.indexOf(".")+1)); // 확장자
				pdsVo.setFileName(fileName); //서버저장 파일명
				pdsVo.setFileSize(fileSize); //파일크기
				pdsVo.setOriginalFileName(originalFileName); //원본 파일명
				pdsVo.setPath(filePath); //파일 경로

				if(originalFileName!=null && !originalFileName.isEmpty()) { //원본 파일명이 있을때만 db에 파일 데이터 저장
					int result = pdsService.insertFiles(pdsVo); //pds 테이블에 파일 db 저장
					logger.info("다중 파일 등록 결과 result = {}", result);
				}
			}//for
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
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

	@GetMapping("/pds/edit")
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

		List<PdsVO> fileList = pdsService.selectFilesByBoardNo(boardNo);
		logger.info("자료실 자료 상세조회 - 파일 조회 fileList.size={}", fileList.size());

		//3
		model.addAttribute("map", map);
		model.addAttribute("fileList", fileList);
		//4
		return "pds/edit";
	}

	@PostMapping("/pds/edit")
	public String edit_post(@ModelAttribute BoardVO boardVo, @ModelAttribute PdsVO pdsVo,
			@RequestParam(name = "oldFileNames", required = false) String[] oldFileNames,
			HttpServletRequest request, Model model) {
		//1
		logger.info("자료실 수정 파라미터, boardVo={}, oldFileNames={}", boardVo, oldFileNames);

		//2
		int cnt = pdsService.updatePds(boardVo);
		logger.info("자료 수정 결과, cnt={}", cnt);


		//3
		String msg = "자료 수정 실패", url = "/pds/edit?boardNo=" + boardVo.getBoardNo();
		if(cnt>0) {
			if(oldFileNames!=null) { //기존 파일이 있을때만 
				//3.1 게시글 번호로 업로드되어 있는 파일들 조회
				List<PdsVO> list = pdsService.selectFilesByBoardNo(boardVo.getBoardNo());
				logger.info("게시글 번호로 업로드되어있는 파일 갯수 조회 list.size={}", list.size());

				//3.2 db에 해당 게시글 번호로 저장되어있는 파일들 전부 조회
				for(PdsVO dbFile : list) { //db 파일 하나하나씩 반복

					boolean shouldDelete = true; // 삭제 여부를 나타내는 변수를 초기화

					for (String oldFileName : oldFileNames) {
						if (dbFile.getFileName().equals(oldFileName)) {
							shouldDelete = false; // oldFileNames에 포함된 파일은 삭제하지 않음
							break; // 이미 포함된 경우 추가 확인은 불필요
						}
					}//for

					if (shouldDelete) { //해당 파일이 db파일과 oldFileName과 일치하지 않으면 파일 삭제 대상
						// 파일 삭제 로직 및 DB에서 데이터 삭제 로직 추가
						if (dbFile.getFileName() != null && !dbFile.getFileName().isEmpty()) {
							File f = new File(fileUploadUtil.getUploadPath(request, ConstUtil.UPLOAD_FILE_FLAG), dbFile.getFileName());
							if (f.exists()) {
								//업로드 폴더에서 해당 파일 삭제
								boolean result = f.delete();
							}
							// db에서도 해당 파일 데이터 삭제
							pdsService.editPdsFile(boardVo.getBoardNo(), dbFile.getFileName()); 
						}
					}
				}//바깥 for

				//3.2 삭제해야할 파일들 선별해서 pds_upload에서 파일먼저 삭제
				//넘어온 기존파일명이 하나도 없을때 새 파일 업로드전 해당 게시글에 모든 파일과 파일 db삭제
			}else { 
				List<PdsVO> oldlist = pdsService.selectFilesByBoardNo(boardVo.getBoardNo());
				logger.info("게시글 번호로 업로드되어있는 파일 갯수 조회 list.size={}", oldlist.size());

				for(PdsVO pdsVo2 : oldlist) {
					if(pdsVo2!=null) {
						File f = new File(fileUploadUtil.getUploadPath(request, ConstUtil.UPLOAD_FILE_FLAG), pdsVo2.getFileName());
						logger.info("컨트롤러 파일 f={}", f);
						if(f.exists()) {
							boolean result = f.delete();
							logger.info("게시글 수정 - 기존 파일 전부 삭제 여부 : {}", result);
						}
					}
				}

				int delFile = pdsService.editPdsFile(boardVo.getBoardNo(), null);
				logger.info("넘어온 파일명 없을 경우 기존 파일 db 삭제 여부 delFile={}", delFile);

			}//if

			//3.3 기존 파일들중 삭제 작업 완료 후 새로운 파일들 업로드
			String fileName="", originalFileName="", filePath = "";
			long fileSize = 0;	

			List<Map<String, Object>> fileList;
			try {
				fileList = fileUploadUtil.fileupload(request, ConstUtil.UPLOAD_FILE_FLAG);
				for(Map<String, Object> map : fileList) {
					fileName = (String) map.get("fileName");
					originalFileName = (String) map.get("originalFileName");
					fileSize = (long) map.get("fileSize");
					filePath = (String) map.get("uploadPath") + File.separator + fileName;

					logger.info("파일명:{}", fileName);
					pdsVo.setBoardListNo(3000); //게시판 번호
					pdsVo.setBoardNo(boardVo.getBoardNo()); //게시글 번호
					pdsVo.setFileExtension(originalFileName.substring(originalFileName.indexOf(".")+1)); // 확장자
					pdsVo.setFileName(fileName); //서버저장 파일명
					pdsVo.setFileSize(fileSize); //파일크기
					pdsVo.setOriginalFileName(originalFileName); //원본 파일명
					pdsVo.setPath(filePath); //파일 경로

					if(originalFileName!=null && !originalFileName.isEmpty()) { //원본 파일명이 있을때만 db에 파일 데이터 저장
						int result = pdsService.insertFiles(pdsVo); //pds 테이블에 파일 db 저장
						logger.info("다중 파일 등록 결과 result = {}", result);
					}
				}//for
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}

			msg = "자료가 수정되었습니다.";
			url = "/pds/detail?boardNo=" + boardVo.getBoardNo();
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		//4
		return "common/message";
	}


	@RequestMapping("/pds/detail")
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

		List<PdsVO> fileList = pdsService.selectFilesByBoardNo(boardNo);
		logger.info("자료실 자료 상세조회 - 파일 조회 fileList.size={}", fileList.size());

		List<String> fileInfoArr = new ArrayList<>(); 
		for(PdsVO vo : fileList) {
			long fileSize = vo.getFileSize();
			String fileName = vo.getOriginalFileName();
			fileInfoArr.add(Utility.getFileInfo(fileSize, fileName));
		}

		//3
		model.addAttribute("map", map);
		model.addAttribute("fileList", fileList);
		model.addAttribute("fileInfoArr", fileInfoArr);

		//4
		return "pds/detail";
	}

	@RequestMapping("/pds/delete")
	public String delete(@RequestParam(defaultValue = "0") int boardNo,
			HttpServletRequest request, Model model) {
		//1
		logger.info("자료 삭제 파라미터, boardNo={}", boardNo);
		if(boardNo==0) {
			model.addAttribute("msg", "잘못된 경로입니다.");
			model.addAttribute("url", "/pds/list");

			return "common/message";
		}
		//2
		List<PdsVO> fileList = pdsService.selectFilesByBoardNo(boardNo);
		logger.info("게시글 삭제 - 파일 삭제 전 파일 갯수 조회 fileList.size={}", fileList.size());

		String msg = "자료 삭제 실패하였습니다.", url = "/pds/detail?boardNo=" + boardNo;

		if(fileList.size()>0) {
			for(PdsVO vo : fileList) {
				String fileName = vo.getFileName();
				if(fileName!=null && !fileName.isEmpty()) { //파일 삭제
					File f = new File(fileUploadUtil.getUploadPath(request, ConstUtil.UPLOAD_FILE_FLAG), fileName);
					logger.info("컨트롤러 파일 f={}", f);
					if(f.exists()) {
						boolean result = f.delete();
						logger.info("글 삭제 - 파일 삭제 여부 : {}", result);
					}
				}//if
			}//for
		}

		int cnt = pdsService.deletePds(boardNo);
		logger.info("게시글 삭제 결과 cnt={}", cnt);

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



	@RequestMapping("/pds/download")
	public ModelAndView download(@RequestParam(defaultValue = "0") int boardNo,
			@RequestParam String fileName, HttpServletRequest request) {
		//1
		logger.info("파일 다운로드 처리, 파라미터 no={}, fileName={}", boardNo, fileName);

		//2
		int cnt = pdsService.updateDownloadCount(boardNo);
		logger.info("다운로드 수 증가, 결과 cnt={}", cnt);

		//3
		//4
		//강제 다운로드 처리를 위한 뷰페이지로 보내준다

		Map<String, Object> map = new HashMap<>();
		String upPath 
		= fileUploadUtil.getUploadPath(request, ConstUtil.UPLOAD_FILE_FLAG);
		File file = new File(upPath, fileName);
		map.put("file", file);

		//ModelAndView(String viewName, Map<String, ?> model)
		ModelAndView mav = new ModelAndView("pdsDownloadView", map); //첫글자 소문자
		return mav;

	}

	//-------------------admin------------------------------

	@RequestMapping("/admin/pds/management")
	public String adminPdsManagement(@ModelAttribute SearchVO searchVo, Model model) {
		//1
		logger.info("괸리자 - 자료실 관리 페이지 파라미터 searchVo={}", searchVo);

		//[1] PaginationInfo 객체 생성
		PaginationInfo pagingInfo=new PaginationInfo();
		pagingInfo.setBlockSize(ConstUtil.BLOCK_SIZE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);

		//[2] SearchVo에 입력되지 않은 두 개의 변수에 값 셋팅
		searchVo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());

		//2
		List<Map<String, Object>> list = pdsService.selectAdminPdsAll(searchVo);
		logger.info("관리자 - 파일목록 전체 조회 결과 list.size={}", list.size());
		
		int totalRecord=pdsService.getAdminTotalFile(searchVo);
		logger.info("관리자 - 파일 검색 조회 총 레코드 갯수 totalRecord={}", totalRecord);
		pagingInfo.setTotalRecord(totalRecord);

		//3
		model.addAttribute("list", list);
		model.addAttribute("pagingInfo", pagingInfo);

		//4
		return "admin/pds/management";

	}

	@RequestMapping("/admin/pds/deleteMulti")
	public String admin_qnaDelete(@ModelAttribute ListPdsVO listVo,
			HttpServletRequest request, Model model) {
		//1
		logger.info("관리자 - 선택한 파일 삭제, 파라미터 listVo={}", listVo);

		//2. db
		List<PdsVO> list = listVo.getPdsItems();
		int cnt = pdsService.deleteMulti(list);
		logger.info("파일 삭제 결과, cnt={}", cnt);

		String msg = "선택한 파일 삭제 중 에러가 발생했습니다.", url = "/admin/pds/management";
		if(cnt>0) {
			msg = "선택한 파일들을 삭제했습니다.";
		}

		//3
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		//4
		return "common/message";
	}





}



