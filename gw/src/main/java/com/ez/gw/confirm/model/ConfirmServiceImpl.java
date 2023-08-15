package com.ez.gw.confirm.model;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ez.gw.common.ConstUtil;
import com.ez.gw.common.FileUploadUtil;
import com.ez.gw.confirmFile.model.ConfirmFileDAO;
import com.ez.gw.confirmFile.model.ConfirmFileVO;
import com.ez.gw.deptagree.model.DeptagreeDAO;
import com.ez.gw.deptagree.model.DeptagreeVO;
import com.ez.gw.refer.model.ReferDAO;
import com.ez.gw.refer.model.ReferVO;

import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ConfirmServiceImpl implements ConfirmService{
	private static final Logger logger = LoggerFactory.getLogger(ConfirmServiceImpl.class); 
	private final ConfirmDAO confirmDao;
	private final DeptagreeDAO deptAgreeDao;
	private final ReferDAO reperDao;
	private final ConfirmFileDAO confirmFileDao;
	private final FileUploadUtil fileUploadUtil;
	
	@Transactional
	@Override
	public int insertConfirm(ConfirmVO confirmVo, DeptagreeVO deptAgreeVo,
			int[] referEmpNo,HttpServletRequest request) {
		int cnt=confirmDao.selectCountByDate();
		String cdNo=confirmVo.getConfirmDocumentNo();
		cdNo+="-"+(cnt+1);
		confirmVo.setConfirmDocumentNo(cdNo);
		logger.info("결재문서 처리 결과 cnt={}",cnt);
		
		cnt=confirmDao.insertConfirm(confirmVo);
		
		if(deptAgreeVo.getDeptNo()!=0) {
			deptAgreeVo.setConfirmDocumentNo(confirmVo.getConfirmDocumentNo());
			cnt=deptAgreeDao.insertDeptAgree(deptAgreeVo);
			logger.info("합의부서 처리 결과 cnt={}",cnt);
		}
		
		if(referEmpNo!=null) {
			ReferVO referVo = new ReferVO();
			referVo.setConfirmDocumentNo(confirmVo.getConfirmDocumentNo());
	    	for(int i=0;i<referEmpNo.length;i++) {
	    		referVo.setEmpNo(referEmpNo[i]);
	    		cnt=reperDao.insertRefer(referVo);
	    		logger.info("참조자 처리 결과 cnt={}",cnt);
	    	}
		}
		
		//첨부파일 처리
    	try {
    		MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
    		Map<String, MultipartFile> fileMap=multiRequest.getFileMap();
    		logger.info("첨부파일 fileMap={}",fileMap);
    		if(fileMap!=null && !fileMap.isEmpty()) {
    		List<Map<String, Object>> fileList = fileUploadUtil.fileupload(request,ConstUtil.CONFIRMFILE_FLAG);
				String fileName="", originalFileName="";
				long fileSize=0;
				
				ConfirmFileVO confirmFileVo = new ConfirmFileVO();
				confirmFileVo.setConfirmDocumentNo(confirmVo.getConfirmDocumentNo());
				
				for(Map<String, Object> map : fileList) {
					fileName=(String)map.get("fileName");
					originalFileName=(String)map.get("originalFileName");
					fileSize=(long)map.get("fileSize");
					
					confirmFileVo.setFileName(fileName);
					confirmFileVo.setOriginalFileName(originalFileName);
					confirmFileVo.setFileSize(fileSize);
				
					cnt=confirmFileDao.insertConfirmFile(confirmFileVo);
					logger.info("파일 저장 결과 cnt={}",cnt);
				}//for
			}
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return cnt;
	}
}
