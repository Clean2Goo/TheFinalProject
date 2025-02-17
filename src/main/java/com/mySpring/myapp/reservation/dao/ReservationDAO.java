package com.mySpring.myapp.reservation.dao;

import com.mySpring.myapp.reservation.vo.ReservationVO;
import java.util.List;

import org.springframework.dao.DataAccessException;

public interface ReservationDAO {
    List<ReservationVO> listReservations(String userId) throws DataAccessException; // 예약 목록 조회
    void updateReservationStatus(String rsvnId) throws DataAccessException; // 예약 취소
    void insertReservation(ReservationVO reservation); // 예약 내역 저장
    void updateReservationStatusCompleted(String rsvnId, String status); // 예약 상태 완료로 업데이트

    ReservationVO findReservationById(String rsvnId) throws DataAccessException;

    List<ReservationVO> getReservationsByOwnerId(String ownerId);

    void updateReservationStatusDynamic(String rsvnId, String status);
}
