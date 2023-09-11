package com.ez.gw.confirm.model;

import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
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
import com.ez.gw.documentform.model.DocumentFormDAO;
import com.ez.gw.documentform.model.DocumentFormVO;
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
	private final ReferDAO referDao;
	private final ConfirmFileDAO confirmFileDao;
	private final DocumentFormDAO documentFormDao;
	
	@Transactional
	@Override
	public int insertConfirm(ConfirmVO confirmVo, DeptagreeVO deptAgreeVo,
			int[] referEmpNo,List<Map<String, Object>> fileList) {
		int cnt=confirmDao.selectCountByDate();
		logger.info("오늘날짜 문서갯수 조회 결과 cnt={}",cnt);
		
		String cdNo=confirmVo.getConfirmDocumentNo();
		cdNo+="-"+(cnt+1);
		logger.info("cdNo={}",cdNo);
		
		confirmVo.setConfirmDocumentNo(cdNo);
		
		cnt=confirmDao.insertConfirm(confirmVo);
		logger.info("결재문서 처리 결과 cnt={}",cnt);
		
		
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
	    		cnt=referDao.insertRefer(referVo);
	    		logger.info("참조자 처리 결과 cnt={}",cnt);
	    	}
		}
		
		//첨부파일 처리
		if(fileList.size()!=0) {
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
		
		return cnt;
	}

	@Transactional
	@Override
	public int updateConfirm(ConfirmVO vo, DeptagreeVO deptAgreeVo, int[] referEmpNo, String[] deleteFile,
			List<Map<String, Object>> fileList) {
		//결재문서 수정
		int cnt = confirmDao.updateConfirm(vo);
		logger.info("문서 수정 결과 cnt={}",cnt);
		
		//합의부서 수정
		int deptCnt=deptAgreeDao.countByDocument(vo.getConfirmDocumentNo()); //기존 합의부서 있는지 체크
		logger.info("합의부서 조회 결과 deptCnt={}",deptCnt);
		if(deptCnt>0) { //있을때
			if(deptAgreeVo.getDeptNo()!=0) { //합의부서를 선택했을때
				cnt=deptAgreeDao.updateDeptAgreeByReturn(deptAgreeVo);
				logger.info("합의부서 수정 결과 cnt={}",cnt);
			}else if(deptAgreeVo.getDeptNo()==0) { //합의부서 선택 안했을때
				cnt=deptAgreeDao.deleteDeptAgree(vo.getConfirmDocumentNo());
				logger.info("합의부서 삭제 결과 cnt={}",cnt);
			}
		}else if(deptCnt<1 && deptAgreeVo.getDeptNo()!=0) { //기존 합의부서가 없고, 합의부서를 선택했을때
			cnt=deptAgreeDao.insertDeptAgree(deptAgreeVo);
			logger.info("합의부서 선택 결과 cnt={}",cnt);
		}
		
		//참조자 수정
		//기존 참조자 삭제
		int referDelete=referDao.deleteRefer(vo.getConfirmDocumentNo());
		logger.info("참조지 삭제 결과 referDelete={}",referDelete);
		if(referEmpNo!=null) {
			ReferVO referVo = new ReferVO();
			referVo.setConfirmDocumentNo(vo.getConfirmDocumentNo());
	    	for(int i=0;i<referEmpNo.length;i++) {
	    		referVo.setEmpNo(referEmpNo[i]);
	    		cnt=referDao.insertRefer(referVo);
	    		logger.info("참조자 처리 결과 cnt={}",cnt);
	    	}
		}
		
		//파일 처리
		if(deleteFile!=null) { //기존파일 삭제
			for(int i=0;i<deleteFile.length;i++) {
				cnt=confirmFileDao.deleteFile(deleteFile[i]);
				logger.info("기존파일 삭제 결과 cnt={}",cnt);
			}
		}
		
		//첨부파일 처리
		if(fileList.size()!=0) {
			String fileName="", originalFileName="";
			long fileSize=0;
						
			ConfirmFileVO confirmFileVo = new ConfirmFileVO();
			confirmFileVo.setConfirmDocumentNo(vo.getConfirmDocumentNo());
						
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
		
		return cnt;
	}
	
	@Override
	public List<Map<String, Object>> selectAllByEmpNo(ConfirmVO vo) {
		return confirmDao.selectAllByEmpNo(vo);
	}

	@Override
	public int getTotalRecord(ConfirmVO vo) {
		return confirmDao.getTotalRecord(vo);
	}

	@Override
	public List<Map<String, Object>> selectAllConfirmDocument(ConfirmVO vo) {
		return confirmDao.selectAllConfirmDocument(vo);
	}

	@Override
	public int getTotalConfirmRecord(ConfirmVO vo) {
		return confirmDao.getTotalConfirmRecord(vo);
	}

	@Override
	public Map<String, Object> selectConfirmDocument(String confirmDocumentNo) {
		return confirmDao.selectConfirmDocument(confirmDocumentNo);
	}

	@Override
	public Map<String, Object> selectDeptAgree(String confirmDocumentNo) {
		return confirmDao.selectDeptAgree(confirmDocumentNo);
	}

	@Override
	public int updateConfirmState(ConfirmVO vo) {
		return confirmDao.updateConfirmState(vo);
	}

	@Override
	public int updateConfirmStateByClick(ConfirmVO vo) {
		return confirmDao.updateConfirmStateByClick(vo);
	}

	@Override
	public List<Map<String, Object>> selectAllDeptAgree(ConfirmVO vo) {
		return confirmDao.selectAllDeptAgree(vo);
	}

	@Override
	public int getTotalAgreeRecord(ConfirmVO vo) {
		return confirmDao.getTotalAgreeRecord(vo);
	}

	@Override
	public List<Map<String, Object>> selectAllCompleteDocument(ConfirmVO vo) {
		return confirmDao.selectAllCompleteDocument(vo);
	}

	@Override
	public int getTotalComplteRecord(ConfirmVO vo) {
		return confirmDao.getTotalComplteRecord(vo);
	}

	@Override
	public List<Map<String, Object>> selectAllRefer(ConfirmVO vo) {
		return confirmDao.selectAllRefer(vo);
	}

	@Override
	public int getTotalReferRecord(ConfirmVO vo) {
		return confirmDao.getTotalReferRecord(vo);
	}

	@Override
	public List<Map<String, Object>> selectAllReturn(ConfirmVO vo) {
		return confirmDao.selectAllReturn(vo);
	}

	@Override
	public int getTotalReturnRecord(ConfirmVO vo) {
		return confirmDao.getTotalReturnRecord(vo);
	}

	@Override
	public int getTotalAgreeRecordMain(ConfirmVO vo) {
		return confirmDao.getTotalAgreeRecordMain(vo);
	}
	
	@Transactional
	@Override
	public int returnConfirmAndDept(ConfirmVO vo) {
		int cnt=confirmDao.returnConfirm(vo);
		if(cnt>0) {
			if(vo.getSearchKeyword()!=null && !vo.getSearchKeyword().isEmpty() ) {
				cnt=deptAgreeDao.returnDeptAgree(vo.getConfirmDocumentNo());
			}
		}
		return cnt;
	}

	@Override
	public List<Map<String, Object>> selectAllByAdmin(ConfirmVO vo) {
		return confirmDao.selectAllByAdmin(vo);
	}

	@Override
	public int getTotalRecordAdmin(ConfirmVO vo) {
		return confirmDao.getTotalRecordAdmin(vo);
	}
	
	@Transactional
	@Override
	public int updateConfirmDelFlag(String[] confirmDocumentNo) {
		int cnt=0;
		int confirm=0;
		for(int i=0;i<confirmDocumentNo.length;i++) {
			cnt=confirmDao.updateConfirmDelFlag(confirmDocumentNo[i]);
			
			if(cnt>0) {
				Map<String, Object> map=selectConfirmDocument(confirmDocumentNo[i]);
				Object obj = map.get("DOCUMENT_NO");
				int documentNo = ((BigDecimal) obj).intValue();
				
				DocumentFormVO formVo = documentFormDao.selectFormByNo(documentNo);
				if(formVo==null) {
					confirm=confirmDao.searchByDocumentFormNo(documentNo);
					if(confirm==0) {
						cnt=documentFormDao.formDelete(documentNo);
					}
				}
			}
		}
		
		return cnt;
	}

	@Override
	public int searchByDocumentFormNo(int documentNo) {
		return confirmDao.searchByDocumentFormNo(documentNo);
	}

	@Override
	public List<Map<String, Object>> selectConfirmList5(int empNo) {
		return confirmDao.selectConfirmList5(empNo);
	}

}
