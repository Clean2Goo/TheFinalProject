package com.mySpring.myapp.manager.service;

import com.mySpring.myapp.carwash.model.CarWash;

import java.util.List;

public interface ManagerService {


    List<CarWash> getAllCarwashes();


    CarWash getCarwashById(String washId);


    List<CarWash> getCarwashesByUserId(String userId);


    void saveCarwash(CarWash carwash);


    void deleteCarwash(String washId);
}
