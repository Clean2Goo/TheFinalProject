package com.mySpring.myapp.reservation.service;

import com.mySpring.myapp.reservation.vo.ReservationVO;
import java.util.List;

public interface ReservationService {
    List<ReservationVO> listReservations(String userId); // 예약 목록 조회
    void cancelReservation(String rsvnId); // 예약 내역 취소
    void saveReservation(ReservationVO reservation); // 예약 내역 저장
    void updateReservationStatusCompleted(String rsvnId, String status); // 예약 상태 업데이트
    
    // 추가된 기능: 관리자용 예약 목록 조회
    List<ReservationVO> getReservationsByOwnerId(String ownerId);
    
    void updateReservationStatus(String rsvnId, String status);

}
