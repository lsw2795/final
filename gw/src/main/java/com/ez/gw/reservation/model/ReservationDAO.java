package com.ez.gw.reservation.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ReservationDAO {
	int insertReservation(ReservationVO reservationVo);
	int checkIsBooked(ReservationVO reservationVo);
	List<ReservationVO> selectAllReservation();
}
