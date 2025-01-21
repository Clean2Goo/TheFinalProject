package com.mySpring.myapp.reservation.dao;

import com.mySpring.myapp.reservation.vo.ReservationVO;
import java.util.List;

import org.springframework.dao.DataAccessException;

public interface ReservationDAO {
    List<ReservationVO> listReservations(String userId); // 예약 목록 조회
    void updateReservationStatus(String rsvnId) throws DataAccessException; //예약취소
}
