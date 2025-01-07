package com.mySpring.myapp.carwash.dao;

import com.mySpring.myapp.carwash.model.CarWash;
import java.util.List;

public interface CarWashDAO {
    List<CarWash> getRecommendedCarWashes(); // 추천 세차장을 가져오는 메서드
    List<CarWash> getAllCarWashes();        // 모든 세차장을 가져오는 메서드
}
