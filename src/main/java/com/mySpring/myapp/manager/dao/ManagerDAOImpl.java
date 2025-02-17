package com.mySpring.myapp.manager.dao;

import com.mySpring.myapp.carwash.model.CarWash;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ManagerDAOImpl implements ManagerDAO {

    @Autowired
    private SqlSession sqlSession;

    private static final String NAMESPACE = "com.mySpring.myapp.mapper.ManagerMapper";

    @Override
    public List<CarWash> findAll() {
        return sqlSession.selectList(NAMESPACE + ".findAll");
    }

    @Override
    public CarWash findById(String washId) {
        return sqlSession.selectOne(NAMESPACE + ".findById", washId);
    }

    @Override
    public List<CarWash> findByUserId(String userId) {
        return sqlSession.selectList(NAMESPACE + ".findByUserId", userId);
    }

    @Override
    public void save(CarWash carwash) {
        if (carwash.getWashId() == null || carwash.getWashId().isEmpty()) {
            sqlSession.insert(NAMESPACE + ".insert", carwash);
        } else {
            sqlSession.update(NAMESPACE + ".update", carwash);
        }
    }

    @Override
    public void deleteById(String washId) {
        sqlSession.delete(NAMESPACE + ".deleteById", washId);
    }
}
