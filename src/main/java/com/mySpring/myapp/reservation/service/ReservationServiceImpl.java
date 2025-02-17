package com.mySpring.myapp.reservation.service;

import com.mySpring.myapp.reservation.dao.ReservationDAO;
import com.mySpring.myapp.reservation.vo.ReservationVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("reservationService")
@Transactional
public class ReservationServiceImpl implements ReservationService {

    @Autowired
    private ReservationDAO reservationDAO;

    @Override
    public List<ReservationVO> listReservations(String userId) {
        return reservationDAO.listReservations(userId);
    }

    @Override
    public void cancelReservation(String rsvnId) {
        reservationDAO.updateReservationStatus(rsvnId);
    }

    @Override
    public void saveReservation(ReservationVO reservation) {
        reservationDAO.insertReservation(reservation);
    }
    @Override
    public void updateReservationStatus(String rsvnId, String status) {
        reservationDAO.updateReservationStatusDynamic(rsvnId, status);
    }

    
    @Override
    public void updateReservationStatusCompleted(String rsvnId, String status) {
        reservationDAO.updateReservationStatusCompleted(rsvnId, status);
    }

    // 추가된 기능: 관리자용 예약 목록 조회
    @Override
    public List<ReservationVO> getReservationsByOwnerId(String ownerId) {
        return reservationDAO.getReservationsByOwnerId(ownerId);
    }
}
