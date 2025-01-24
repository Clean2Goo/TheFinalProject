package com.mySpring.myapp.manager.service;

import com.mySpring.myapp.carwash.model.CarWash;
import com.mySpring.myapp.manager.dao.ManagerDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class ManagerServiceImpl implements ManagerService {

    @Autowired
    private ManagerDAO managerDAO;


    @Override
    public List<CarWash> getAllCarwashes() {
        return managerDAO.findAll();
    }


    @Override
    public CarWash getCarwashById(String washId) {
        return managerDAO.findById(washId);
    }


    @Override
    public List<CarWash> getCarwashesByUserId(String userId) {
        return managerDAO.findByUserId(userId);
    }

    @Override
    public void saveCarwash(CarWash carwash) {
        managerDAO.save(carwash);
    }

    @Override
    public void deleteCarwash(String washId) {
        managerDAO.deleteById(washId);
    }
}
