package com.ez.gw.reservation.model;

import java.util.List;

public interface ReservationService {
	int insertReservation(ReservationVO reservationVo);
	int checkIsBooked(ReservationVO reservationVo);
	List<ReservationVO> selectAllReservation();
}
