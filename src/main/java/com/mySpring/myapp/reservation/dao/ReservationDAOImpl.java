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

    public void updateReservationStatus(String rsvnId) {
        Map<String, Object> params = new HashMap<>();
        params.put("rsvnId", rsvnId);
        
        sqlSession.update("updateReservationStatus", params);
    }

	
}
