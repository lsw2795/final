package com.ez.gw.secondhandTrade.model;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ez.gw.secondhandTradeFile.model.SecondhandTradeFileVO;

import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class SecondHandTradeServiceImpl implements SecondHandTradeService{
	private final SecondHandTradeDAO secondHandTradeDao;
	
	@Override
	public void insertMarket(SecondHandTradeVO secondVo, SecondhandTradeFileVO fileVo) throws IOException {
		/*
		1. VO에 담긴 파일을 꺼냄
		2. 파일의 이름 가져옴
		3. 서버 저장용 이름을 만든다.
		4. 저장 경로 설정
		5. 해당 경로에 파일 저장
		6. 중고거래 테이블에 해당 데이터 저장처리
		7. 중고거래 파일 테이블에 해당 데이터 저장 처리
		*/ 
		fileVo.setTradeNo(secondVo.getTradeNo());
		
		MultipartFile fileName = fileVo.getFileName(); //1
		
		String originalFileName = fileName.getOriginalFilename(); //2
		fileVo.setOriginalFileName(originalFileName);
		
		String saveName = System.currentTimeMillis() + "_" + originalFileName; //3
		
		String savePath = "C:\\Users\\Desktop\\final\\gw\\src\\main\\webapp\\market\\upload" + saveName; //4
		
		fileName.transferTo(new File(savePath)); //5
		
	}

	@Override
	public List<Map<String, Object>> secondMarketFileUpload(HttpServletRequest request) throws IllegalStateException, IOException {
		MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest)request;
		
		Map<String, MultipartFile> fileMap = multiRequest.getFileMap();
		
		List<Map<String, Object>> resultList = new ArrayList<>();
		
		Iterator<String> iter = fileMap.keySet().iterator();
		
		while(iter.hasNext()) {
			String key = iter.next();
			MultipartFile tempFile = fileMap.get(key);
			if(!tempFile.isEmpty()) {
				long fileSize = tempFile.getSize();
				String originalFileName = tempFile.getOriginalFilename();
				String fileName = getUnigueFileName(originalFileName);
				
				String uploadPath = getUploadPath(request);
				File file = new File(uploadPath, fileName);
				tempFile.transferTo(file);
				
				//업로드 파일 정보 저장
				Map<String, Object> resultMap = new HashMap<>();
				resultMap.put("fileName", fileName);
				resultMap.put("orginalFileName", originalFileName);
				resultMap.put("fileSize",fileSize);
				
				resultList.add(resultMap);
			}
		}
		return resultList;
	}

	/**
	 * 업로드 경로 구하기
	 * @param request
	 * @return
	 */
	private String getUploadPath(HttpServletRequest request) {
		String path = "";
		path = request.getSession().getServletContext().getRealPath(path);
		
		return path;
	}
	
	public String getUnigueFileName(String originalFileName) {
		int idx = originalFileName.lastIndexOf(".");
		String fName = originalFileName.substring(0, idx);
		String ext = originalFileName.substring(idx);
		
		String result = fName + "_" + getDateTimeStamp() + ext;
		
		return result;
	}

	private String getDateTimeStamp() {
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat();
		String result = sdf.format(d);
		
		return result;
	}


}
