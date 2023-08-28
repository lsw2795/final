package com.ez.gw.reservation.model;

import java.util.List;

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
	public List<ReservationVO> selectAllReservation() {
		return reservationDao.selectAllReservation();
	}
	
	
}
