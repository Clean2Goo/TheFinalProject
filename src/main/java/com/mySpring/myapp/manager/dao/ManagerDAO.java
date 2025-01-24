package com.mySpring.myapp.manager.dao;

import com.mySpring.myapp.carwash.model.CarWash;
import java.util.List;

public interface ManagerDAO {


    List<CarWash> findAll();

    CarWash findById(String washId);

    List<CarWash> findByUserId(String userId);

    void save(CarWash carwash);


    void deleteById(String washId);
}
