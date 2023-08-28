package com.ez.gw.reservation.model;

public interface ReservationService {
	int insertReservation(ReservationVO reservationVo);
	int checkIsBooked(ReservationVO reservationVo);
}
