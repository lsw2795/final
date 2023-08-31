package com.ez.gw.addressbook.model;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.ez.gw.common.EmpSearchVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AddressBookServiceImpl implements AddressBookService{
	private final AddressBookDAO addressBookDao;

	@Override
	public List<AddressBookVO> selectAll(EmpSearchVO searchVo) {
		return addressBookDao.selectAll(searchVo);
	}

	@Override
	public int gTRSearchCount(EmpSearchVO searchVo) {
		return addressBookDao.gTRSearchCount(searchVo);
	}

	@Override
	public int insertAddr(AddressBookVO vo) {
		return addressBookDao.insertAddr(vo);
	}

	@Override
	public AddressBookVO selAddrByAddrNo(int addrbookNo) {
		return addressBookDao.selAddrByAddrNo(addrbookNo);
	}

	@Override
	public int updateAddr(AddressBookVO vo) {
		return addressBookDao.updateAddr(vo);
	}
	
	@Override
	@Transactional
	public int deleteMulti(List<AddressBookVO> list) {
		int cnt = 0;
		try {
			for(AddressBookVO vo : list) {
				int addrbookNo = vo.getAddrbookNo();
				if(addrbookNo!=0) { //체크된 질문만 삭제
					cnt = addressBookDao.deleteAddr(addrbookNo);
				}
			}//for
		}catch(RuntimeException e) {
			//선언적 트랜잭션에서는 런타임 예외가 발생하면 롤백한다.
			e.printStackTrace();
			cnt=-1;
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		return cnt;
	}

}
