package com.mySpring.myapp.carwash.dao;

import com.mySpring.myapp.carwash.model.CarWash;
import com.mySpring.myapp.carwash.model.Staff;

import java.util.List;

public interface CarWashDAO {
    List<CarWash> getRecommendedCarWashes(); // 추천 세차장을 가져오는 메서드
    List<CarWash> getAllCarWashes();        // 모든 세차장을 가져오는 메서드
    List<CarWash> selectCarWashesInGangnam();  // 강남구 특정 조건 세차장 조회
    CarWash selectCarWasheById(int washId);    // 해당 아이디 세차장 정보 조회
    List<Staff> selectStaffByWashId(int washId);
}
