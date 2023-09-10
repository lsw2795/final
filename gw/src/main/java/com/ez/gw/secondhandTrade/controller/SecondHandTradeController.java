package com.ez.gw.secondhandTrade.controller;

import java.beans.PropertyEditorSupport;
import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ez.gw.common.ConstUtil;
import com.ez.gw.common.PaginationInfo;
import com.ez.gw.common.SearchSellVO;
import com.ez.gw.common.Utility;
import com.ez.gw.employee.model.EmployeeService;
import com.ez.gw.employee.model.EmployeeVO;
import com.ez.gw.secondhandTrade.model.SecondHandTradeService;
import com.ez.gw.secondhandTrade.model.SecondHandTradeVO;
import com.ez.gw.secondhandTradeFile.model.SecondhandTradeFileService;
import com.ez.gw.secondhandTradeFile.model.SecondhandTradeFileVO;
import com.ez.gw.secondhandTradeLike.model.SecondhandTradeLikeService;
import com.ez.gw.secondhandTradeLike.model.SecondhandTradeLikeVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/market")
@RequiredArgsConstructor
@Transactional
public class SecondHandTradeController {
	private static final Logger logger = LoggerFactory.getLogger(SecondHandTradeController.class);
	private final SecondHandTradeService secondHandTradeService;
	private final SecondhandTradeFileService secondHandTradeFileService;
	private final EmployeeService employeeService;
	private final SecondhandTradeLikeService secondHandLikeService;

	@GetMapping("/addMarket")
	public String get_addMarket(Model model, HttpSession session) {
		/*
		 * // 세션에서 저장한 폼 데이터 불러오기 SecondHandTradeVO secondVo = (SecondHandTradeVO)
		 * session.getAttribute("secondVo"); SecondhandTradeFileVO secondFileVo =
		 * (SecondhandTradeFileVO) session.getAttribute("secondFileVo");
		 */
		logger.info("중고거래 등록 화면 보여주기");
		// 세션에서 데이터를 불러왔으면 해당 데이터를 모델에 추가하여 폼에 미리 채워진 상태로 보여줌
		/*
		 * if (secondVo != null && secondFileVo != null) {
		 * model.addAttribute("secondVo", secondVo); model.addAttribute("secondFileVo",
		 * secondFileVo); }
		 */
		return "market/addMarket";
	}

	@PostMapping("/addMarket")
	public String post_addMarket(@ModelAttribute SecondHandTradeVO secondVo,
			@ModelAttribute SecondhandTradeFileVO secondFileVo, HttpServletRequest request, HttpSession session,
			Model model) {
		// 1
		int empNo = (int) session.getAttribute("empNo");
		secondVo.setEmpNo(empNo);
		logger.info("중고거래 상품 등록, 파라미터 secondVo = {}, empNo={}", secondVo, empNo);
		String msg = "", url = "";
		int cnt = 0, result=0;

		// 2
		// 파일 업로드 처리
		try {
			String fileName = "", originalFileName = "";
			long fileSize = 0;

			// 파일 업로드 처리
			MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;

			List<MultipartFile> files = multiRequest.getFiles("imageURL2");

			for (MultipartFile f : files) {
				logger.info("컨텐트 타입, contentType={}, png={}, jpg={}", f.getContentType(),
						f.getContentType().toLowerCase().endsWith("png"),
						f.getContentType().toLowerCase().endsWith("jpg"),
						f.getContentType().toLowerCase().endsWith("jpeg"));
				// 이미지 파일만 업로드 가능
				if (!f.getContentType().toLowerCase().endsWith("png")
						&& !f.getContentType().toLowerCase().endsWith("jpg")
						&& !f.getContentType().toLowerCase().endsWith("jpeg")) {
					msg = "jpg, png, jpeg 파일만 등록 가능합니다.";
					url = "/market/addMarket";

					// 이전에 입력한 폼 데이터 세션에 저장
					session.setAttribute("secondVo", secondVo);
					session.setAttribute("secondFileVo", secondFileVo);

					model.addAttribute("msg", msg);
					model.addAttribute("url", url);

					return "common/message";
				}
			} // for

			cnt = secondHandTradeService.insertMarket(secondVo);
			logger.info("중고거래 상품 등록 처리 결과 cnt = {}", cnt);
			int i = 0;
			for (MultipartFile f : files) {
				originalFileName = f.getOriginalFilename();
				int cut = originalFileName.indexOf(".");
				logger.info("cut={}", cut);
				String cutfile = originalFileName.substring(cut);
				logger.info("cutFileName={}", cutfile);

				fileName = secondVo.getTradeNo() + "_" + i++ + cutfile;
				fileSize = (long) f.getSize();

				String path = ConstUtil.MARKET_UPLOAD_PATH_TEST;
				String filePath = request.getSession().getServletContext().getRealPath(path);

				File file = new File(filePath, fileName);
				f.transferTo(file);

				logger.info("파일명:{}", fileName);
				secondFileVo.setImageURL(fileName);
				secondFileVo.setTradeNo(secondVo.getTradeNo());

				result = secondHandTradeFileService.insertFile(secondFileVo);
				logger.info("이미지 멀티 파일 등록 결과 result = {}", result);
			}
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		// 3
		EmployeeVO emp = employeeService.selectByEmpNo(empNo);
		url = "/market/marketList";
		if (cnt > 0 && result>0) {
			msg = "상품이 성공적으로 등록되었습니다.";

			model.addAttribute("msg", msg);
			model.addAttribute("url", url);

			return "common/message";
		}

		model.addAttribute("emp", emp);
		// 4.

		return "market/market/List";
	}

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		binder.registerCustomEditor(int.class, new PropertyEditorSupport() {
			@Override
			public void setAsText(String text) throws IllegalArgumentException {
				if (text == null || text.isEmpty()) {
					setValue(0); // default value for empty or null string.
				} else {
					setValue(Integer.parseInt(text));
				}
			}
		});

		binder.registerCustomEditor(boolean.class, new PropertyEditorSupport() {
			@Override
			public void setAsText(String text) throws IllegalArgumentException {
				if (text == null || text.isEmpty()) {
					setValue(false); // default value for empty or null string.
				} else {
					setValue(Boolean.parseBoolean(text));
				}
			}
		});
	}

	@RequestMapping("/marketList")
	public String marketList(Model model, @ModelAttribute SearchSellVO searchVo,
			@RequestParam(name = "checkSelflag", required = false, defaultValue = "false") boolean checkSelflag
			,@RequestParam(defaultValue="1") int currentPage) {
		// 1
		logger.info("중고마켓 화면 보여주기 searchVo={}", searchVo);
		EmployeeVO emp = null;
		String likeFlag = "";

		// 2
		// 페이징
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(ConstUtil.MARKET_BLOCK_SIZE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(ConstUtil.MARKET_COUNT);

		// [2]SearchVo에 입력되지 않은 두 개의 변수에 값 셋팅
		searchVo.setRecordCountPerPage(ConstUtil.MARKET_COUNT);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());

		List<Map<String, Object>> list= secondHandTradeService.selectAllMarket(searchVo);
		List<SecondhandTradeFileVO> fileList = secondHandTradeFileService.showThumbnail();


		int totalRecord = secondHandTradeService.getTotalRecord(searchVo);
		logger.info("리스트 결과, list.size = {}, fileList.size={}", list.size(), fileList.size());
		pagingInfo.setTotalRecord(totalRecord);

		for (Map<String, Object> fg : list) {

			for (SecondhandTradeFileVO f : fileList) {
				// 게시글과 파일의 매칭 조건을 설정

				BigDecimal tradeNoBigDecimal = (BigDecimal) fg.get("TRADE_NO");
				int tradeNo = tradeNoBigDecimal.intValue(); // BigDecimal을 int로 변환

				if (f.getTradeNo() == tradeNo && f.getImageURL().contains("_0.")) {
					fg.put("thumbnail", f.getImageURL()); // 썸네일 파일명 저장
					//logger.info("썸네일 파일명={}", fg.get("thumbnail"));
					break; // 매칭되는 파일을 찾았으면 더 이상 검색하지 않고 반복문을 종료
				}
			}

			BigDecimal empNoBigDecimal = (BigDecimal) fg.get("EMP_NO");
			int empNo = empNoBigDecimal.intValue(); // BigDecimal을 int로 변환

			//String name = (String)fg.get("NAME");
			emp = employeeService.selectByEmpNo(empNo);
			String name = (String)fg.put("NAME", emp.getName());
			//logger.info("작성자 이름 ={}", (String)fg.put("NAME", emp.getName()));
			fg.put("timeNew", Utility.displayNew((Date)fg.get("REGDATE"))); // 게시글별로 24시간이내 글등록 확인 여부 저장

			BigDecimal tradeNoBigDecimal = (BigDecimal)fg.get("TRADE_NO");
			int tradeNo = tradeNoBigDecimal.intValue();
			likeFlag = secondHandLikeService.findLike(empNo, tradeNo);

			BigDecimal likeCountBigDecimal = (BigDecimal)fg.get("LIKECOUNT");
			if (likeCountBigDecimal != null) {
				int likeCount = likeCountBigDecimal.intValue();
				fg.put("likeCount", likeCount);
			}
			fg.put("likeFlag", likeFlag);
		}

		// 3
		model.addAttribute("list", list);
		model.addAttribute("pagingInfo", pagingInfo);

		// 4
		return "market/marketList";
	}

	@RequestMapping("/marketGrid")
	public String marketGrid(Model model, @ModelAttribute SearchSellVO searchVo,
			@RequestParam(name = "checkSelflag", required = false, defaultValue = "false") boolean checkSelflag
			,@RequestParam(defaultValue="1") int currentPage) {
		// 1
		logger.info("중고마켓 화면 보여주기 searchVo={}", searchVo);
		EmployeeVO emp = null;
		String likeFlag = "";

		// 2
		// 페이징
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(ConstUtil.BLOCK_SIZE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);

		// [2]SearchVo에 입력되지 않은 두 개의 변수에 값 셋팅
		searchVo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());

		List<Map<String, Object>> list= secondHandTradeService.selectAllMarket(searchVo);
		List<SecondhandTradeFileVO> fileList = secondHandTradeFileService.showThumbnail();


		int totalRecord = secondHandTradeService.getTotalRecord(searchVo);
		logger.info("리스트 결과, list.size = {}, fileList.size={}", list.size(), fileList.size());
		pagingInfo.setTotalRecord(totalRecord);

		for (Map<String, Object> fg : list) {

			for (SecondhandTradeFileVO f : fileList) {
				// 게시글과 파일의 매칭 조건을 설정

				BigDecimal tradeNoBigDecimal = (BigDecimal) fg.get("TRADE_NO");
				int tradeNo = tradeNoBigDecimal.intValue(); // BigDecimal을 int로 변환

				if (f.getTradeNo() == tradeNo && f.getImageURL().contains("_0.")) {
					fg.put("thumbnail", f.getImageURL()); // 썸네일 파일명 저장
					//logger.info("썸네일 파일명={}", fg.get("thumbnail"));
					break; // 매칭되는 파일을 찾았으면 더 이상 검색하지 않고 반복문을 종료
				}
			}

			BigDecimal empNoBigDecimal = (BigDecimal) fg.get("EMP_NO");
			int empNo = empNoBigDecimal.intValue(); // BigDecimal을 int로 변환

			//String name = (String)fg.get("NAME");
			emp = employeeService.selectByEmpNo(empNo);
			String name = (String)fg.put("NAME", emp.getName());
			//logger.info("작성자 이름 ={}", (String)fg.put("NAME", emp.getName()));
			fg.put("timeNew", Utility.displayNew((Date)fg.get("REGDATE"))); // 게시글별로 24시간이내 글등록 확인 여부 저장

			BigDecimal tradeNoBigDecimal = (BigDecimal)fg.get("TRADE_NO");
			int tradeNo = tradeNoBigDecimal.intValue();
			likeFlag = secondHandLikeService.findLike(empNo, tradeNo);

			BigDecimal likeCountBigDecimal = (BigDecimal)fg.get("LIKECOUNT");
			if (likeCountBigDecimal != null) {
				int likeCount = likeCountBigDecimal.intValue();
				fg.put("likeCount", likeCount);
			}
			fg.put("likeFlag", likeFlag);
		}

		// 3
		model.addAttribute("list", list);
		model.addAttribute("pagingInfo", pagingInfo);

		// 4
		return "market/marketGrid";
	}

	@RequestMapping("/marketDetail")
	public String detail(@RequestParam(defaultValue = "0") int tradeNo, Model model, HttpSession session) {

		// 1
		int empNo = (int)session.getAttribute("empNo");
		logger.info("중고거래 상세보기 페이지, 파라미터={}, empNo={}", tradeNo, empNo);

		// 2
		Map<String, Object> map = secondHandTradeService.selectMarketByNo(tradeNo);
		List<SecondhandTradeFileVO> fileList = secondHandTradeFileService.selectDetailFileByNo(tradeNo);
		SecondhandTradeLikeVO likeVo = new SecondhandTradeLikeVO();
		likeVo.setEmpNo(empNo);
		likeVo.setTradeNo(tradeNo);

		SecondhandTradeLikeVO secondLikeVo = secondHandLikeService.selectLikeByEmpNo(likeVo);
		logger.info("좋아요 secondLikeVo={}", secondLikeVo);
		String likeFlag = secondHandLikeService.findLike(empNo, tradeNo);

		// 3
		// 데이터베이스에서 반환되는 값은 BigDecimal 형식이므로 각 필드에 대해 Integer로 변환해야 합니다.
		if(map.get("READCOUNT")!=null && map.get("LIKECOUNT")!=null) {
			Integer price = ((BigDecimal) map.get("PRICE")).intValue();
			Integer readcount = ((BigDecimal) map.get("READCOUNT")).intValue();

			// 4
			// 변환한 값을 다시 map에 저장합니다.
			map.put("PRICE", price);
			map.put("READCOUNT", readcount);
			map.put("LIKEFLAG", likeFlag);
		}


		logger.info("중고거래 상세보기 페이지 결과, map, fileList.size={}", map, fileList.size());

		int cnt = secondHandTradeService.updateReadCount(tradeNo);
		logger.info("조회수 증가 결과, cnt ={}", cnt);
		logger.info("map={}", map.get("EMP_NO"));

		// 3
		model.addAttribute("map", map);
		model.addAttribute("file", fileList);
		model.addAttribute("likeVo", secondLikeVo);
		// 4
		return "market/marketDetail";
	}


	@GetMapping("/editMarket")
	public String get_editMarket(@RequestParam(defaultValue = "0") int tradeNo, Model model) {
		// 1
		logger.info("중고거래 수정 페이지, 파라미터, tradeNo={}", tradeNo);
		if (tradeNo == 0) {
			model.addAttribute("msg", "잘못된 경로입니다.");
			model.addAttribute("url", "/market/marketList");

			return "common/message";
		}
		// 2
		Map<String, Object> secondVo = secondHandTradeService.selectMarketByNo(tradeNo);
		List<SecondhandTradeFileVO> fileList = secondHandTradeFileService.selectDetailFileByNo(tradeNo);
		logger.info("수정 게시글 조회 결과, secondVo={}", secondVo);
		logger.info("수정 파일 조회 결과, fileList={}", fileList);

		// 3
		model.addAttribute("vo", secondVo);
		model.addAttribute("fileList", fileList);

		// 4
		return "market/editMarket";
	}


	@PostMapping("/editMarket") 
	public String post_editMarket(@ModelAttribute SecondHandTradeVO secondVo, 
			@ModelAttribute SecondhandTradeFileVO secondFileVo, HttpServletRequest request, HttpSession session, Model model) { 
		//1
		MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest)request;

		List<MultipartFile> file2 = multiRequest.getFiles("imageURL2");


		int empNo = (int)session.getAttribute("empNo");
		logger.info("수정 게시판(post), 파라미터 tradeNo={}", secondVo.getTradeNo());
		logger.info("secondVo={}", secondVo);
		logger.info("file2.size()={}", file2.size());

		//2
		String msg="", url="";
		int cnt = 0, result = 0;
		String originalFileName = "", inputFileName="";
		long fileSize=0;
		
		String path = ConstUtil.MARKET_UPLOAD_PATH_TEST;
		String filePath = request.getSession().getServletContext().getRealPath(path);

		boolean newFile = false;
		//새로 업로드된 파일이 있다면
		
		for (MultipartFile f2 : file2) {
		    if (f2.getSize() > 0) {
		    	newFile = true;
		        break; // 하나 이상의 비어 있지 않은 파일이 발견되면 루프를 빠져나갑니다.
		    }
		}
		
		if(newFile) {
			//거래글 번호로 해당 
			List<SecondhandTradeFileVO> list = secondHandTradeFileService.selectDetailFileByNo(secondVo.getTradeNo());

			//해당 거래글 번호에 있던 실제 파일들 하나하나 삭제
			for(SecondhandTradeFileVO f:list) {
				String fileName = f.getImageURL();

				File file = new File(filePath, fileName);

				if(file.exists()) {
					boolean del = file.delete();
					logger.info("파일 삭제 여부 - del={}", del);
				}

			}//for
			
			//db에서 해당 거래글번호로 모든 파일 db 삭제 : for문 밖에서 한번만 삭제
			cnt = secondHandTradeFileService.deleteMarketFile(secondVo.getTradeNo());
			logger.info("파일 DB 삭제여부 - cnt={}", cnt);

			//3. 새로운 파일 등록
			logger.info("파일 지운다음 새로 저장!!");

			//글 내용 수정
			cnt = secondHandTradeService.updateMarket(secondVo);
			logger.info("중고거래 수정 완료, cnt={}", cnt);

			int i=0;
			for(MultipartFile f2:file2) {
				String fileName = "";
				originalFileName=f2.getOriginalFilename();
				int cut = originalFileName.indexOf(".");
				String cutFileName = originalFileName.substring(cut);

				fileName=secondVo.getTradeNo() + "_" + i++ + cutFileName;
				fileSize = (long)f2.getSize();


				File files = new File(filePath, fileName);
				try {
					f2.transferTo(files);
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}

				logger.info("파일명 fileName={}", fileName);
				secondFileVo.setImageURL(fileName);
				result = secondHandTradeFileService.insertFile(secondFileVo);
				logger.info("파일 등록 결과, result={}", result);
			}

		}else {
			cnt = secondHandTradeService.updateMarket(secondVo);
			logger.info("중고거래 수정 완료, cnt={}", cnt);
			result = 1;
		}


		if(cnt>0 && result>0) {
			msg="중고거래 수정이 완료되었습니다.";
			url="/market/marketList";
		}

		//3
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		//4 
		return"common/message";

	}


	@RequestMapping("/delMarket")
	public String delete(@RequestParam(defaultValue = "0") int tradeNo, Model model) {
		// 1
		logger.info("중고거래 삭제하기, 파라미터 tradeNo={}", tradeNo);

		if (tradeNo == 0) {
			model.addAttribute("msg", "잘못된 경로입니다.");
			model.addAttribute("url", "/market/marketList");

			return "common/message";
		}
		// 2
		List<SecondhandTradeFileVO> fileList = secondHandTradeFileService.selectDetailFileByNo(tradeNo);
		logger.info("중고거래 이미지 파일 갯수, fileList={}", fileList);
		if (fileList.size() > 0) {
			for (SecondhandTradeFileVO f : fileList) {
				String fileName = f.getImageURL();
				String path = ConstUtil.MARKET_UPLOAD_PATH_TEST;
				File file = new File(path, fileName);
				if (file.exists()) {
					boolean result = file.delete();
					logger.info("이미지 삭제 여부 : {}", result);
				}
			} // for
		} // if

		int cnt = secondHandTradeService.deleteMarket(tradeNo);
		logger.info("중고거래 게시글 삭제 결과, cnt = {}", cnt);

		String msg = "삭제 실패!", url = "/market/marketList";
		if (cnt > 0) {
			msg = "자료 삭제가 완료되었습니다.";
		}

		// 3
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		// 4
		return "common/message";
	}


	@RequestMapping("/ajaxCheckPwd")
	@ResponseBody
	public int checkPwd(@RequestParam(required = false)String pwd, HttpSession session) {
		int empNo = (int)session.getAttribute("empNo");
		logger.info("비밀번호 확인 ajax - pwd={}, empNo={}", pwd, empNo);

		int checkPwd = employeeService.loginCheck(pwd, empNo);
		int result = 0;
		if(checkPwd==employeeService.LOGIN_OK) {
			result=1;	//비밀번호 일치
		}else if(checkPwd == employeeService.PWD_DISAGREE){
			result=0;	//비밀번호 불일치
		}

		logger.info("ajax이용 - 비밀번호 일치 결과 result={}", result);
		return result;
	}

	@RequestMapping("/ajaxlikeit")
	@ResponseBody
	public int likeit(@RequestParam(defaultValue = "0")int tradeNo,
			@RequestParam(defaultValue = "0")int empNo, @ModelAttribute SecondhandTradeLikeVO like) {
		logger.info("ajax - likeit, 파라미터 tradeNo={}, empNo={}", tradeNo, empNo);
		String Checlike = like.getLikeFlag();
		logger.info("checkLike={}", Checlike);
		//1 해당 회원이 해당글에 좋아요를 누른 적 있는지 조회 count 이용
		int count = secondHandLikeService.findLikeCount(empNo, tradeNo);
		logger.info("count={}", count);
		int result = 0;
		int cnt = 0;
		//2 count가 0이면 새로 좋아요 인서트
		if(count<1) {
			secondHandLikeService.insertFirstHeart(like);
			result = 1;
			cnt = secondHandTradeService.like(tradeNo);
			logger.info("좋아요 수 증가 결과 cnt={}", cnt);
			//3 만약에 else 0보다 크면 좋아요가 N 인지 Y인지 조회
		}else {
			String likeflag = secondHandLikeService.findLike(empNo, tradeNo);
			//4 Y면 dislike로 N으로 업데이트
			if(likeflag.equals("Y")) {
				logger.info("확인");
				int cnt1 = secondHandLikeService.disLikeHeart(empNo, tradeNo);
				logger.info("cnt1={}", cnt1);
				result = 2;
				cnt = secondHandTradeService.dislike(tradeNo);
				logger.info("좋아요 취소 성공 여부 cnt1={}", cnt1);
				logger.info("좋아요 수 감소 결과 cnt={}", cnt);
				//5 N이면 likeHeart로 Y로 업데이트
			}else if(likeflag.equals("N")) {
				int cnt2 = secondHandLikeService.likeHeart(empNo, tradeNo);
				result = 1;
				cnt = secondHandTradeService.like(tradeNo);
				logger.info("좋아요 성공 여부 cnt2={}", cnt2);
				logger.info("좋아요 수 증가 결과 cnt={}", cnt);
			}
		}
		return result;
	}

}