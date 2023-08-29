package com.ez.gw.reservation.model;

import java.util.List;
import java.util.Map;

public interface ReservationService {
	int insertReservation(ReservationVO reservationVo);
	int checkIsBooked(ReservationVO reservationVo);
	List<Map<String, Object>> selectAllReservation();
}
