package com.mySpring.myapp.reservation.dao;

import com.mySpring.myapp.reservation.vo.ReservationVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository("reservationDAO")
public class ReservationDAOImpl implements ReservationDAO {

    @Autowired
    private SqlSession sqlSession;

    @Override
    public List<ReservationVO> listReservations(String userId) throws DataAccessException {
        return sqlSession.selectList("mapper.reservation.listReservations", userId);
    }

    @Override
    public void updateReservationStatus(String rsvnId) {
        Map<String, Object> params = new HashMap<>();
        params.put("rsvnId", rsvnId);

        sqlSession.update("mapper.reservation.updateReservationStatus", params);
    }

    @Override
    public void insertReservation(ReservationVO reservation) throws DataAccessException {
        sqlSession.insert("mapper.reservation.insertReservation", reservation);
    }
    @Override
    public void updateReservationStatusDynamic(String rsvnId, String status) {
        Map<String, Object> params = new HashMap<>();
        params.put("rsvnId", rsvnId);
        params.put("status", status);
        sqlSession.update("mapper.reservation.updateReservationStatusDynamic", params);
    }

    @Override
    public void updateReservationStatusCompleted(String rsvnId, String status) {
        Map<String, Object> params = new HashMap<>();
        params.put("rsvnId", rsvnId);
        params.put("status", status);

        sqlSession.update("mapper.reservation.updateReservationStatusCompleted", params);
    }

    // 추가된 기능: 관리자용 예약 목록 조회
    @Override
    public List<ReservationVO> getReservationsByOwnerId(String ownerId) {
        return sqlSession.selectList("mapper.reservation.getReservationsByOwnerId", ownerId);
    }
}
