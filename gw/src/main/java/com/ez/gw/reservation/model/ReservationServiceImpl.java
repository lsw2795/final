package com.ez.gw.reservation.model;

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
	
	
}
