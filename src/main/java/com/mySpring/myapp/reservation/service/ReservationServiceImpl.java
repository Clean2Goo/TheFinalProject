package com.mySpring.myapp.reservation.service;

import com.mySpring.myapp.reservation.dao.ReservationDAO;
import com.mySpring.myapp.reservation.vo.ReservationVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("reservationService")
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
}
