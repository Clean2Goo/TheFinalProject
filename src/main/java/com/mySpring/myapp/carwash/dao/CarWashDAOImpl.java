package com.mySpring.myapp.carwash.dao;

import com.mySpring.myapp.carwash.model.CarWash;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CarWashDAOImpl implements CarWashDAO {

    @Autowired
    private SqlSession sqlSession;

    private static final String NAMESPACE = "com.mySpring.myapp.mapper.CarWashMapper";

    @Override
    public List<CarWash> getRecommendedCarWashes() {
        return sqlSession.selectList(NAMESPACE + ".getRecommendedCarWashes");
    }

    @Override
    public List<CarWash> getAllCarWashes() {
        return sqlSession.selectList(NAMESPACE + ".getAllCarWashes");
    }

	@Override
    public List<CarWash> selectCarWashesInGangnam() {
        return sqlSession.selectList(NAMESPACE + ".selectCarWashesInGangnam");
    }

	@Override
    public CarWash selectCarWasheById(int washId) {
        return sqlSession.selectOne(NAMESPACE + ".selectCarWasheById",washId);
    }


}
