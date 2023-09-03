package com.ez.gw.reservation.model;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ReservationServiceImpl implements ReservationService {
	private final ReservationDAO reservationDao;

	@Override
	public int insertReservation(ReservationVO reservationVo) {
		return reservationDao.insertReservation(reservationVo);
	}

	@Override
	public int checkIsBooked(ReservationVO reservationVo) {
		return reservationDao.checkIsBooked(reservationVo);
	}

	@Override
	public List<Map<String, Object>> selectAllReservation() {
		return reservationDao.selectAllReservation();
	}

	@Override
	public Map<String, Object> detailReservation(int reservationNo) {
		return reservationDao.detailReservation(reservationNo);
	}

	@Override
	public int delReservation(int reservationNo) {
		return reservationDao.delReservation(reservationNo);
	}

	@Override
	public ReservationVO showReservationByNo(int reservationNo) {
		return reservationDao.showReservationByNo(reservationNo);
	}

	@Override
	public int updateReservation(ReservationVO resVo) {
		return reservationDao.updateReservation(resVo);
	}

	
	
}
