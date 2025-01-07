package com.mySpring.myapp.carwash.repository;

import com.mySpring.myapp.carwash.model.CarWash;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CarWashRepository extends JpaRepository<CarWash, String> {
    boolean existsByWashId(String washId);

    // 이름으로 세차장을 검색하는 메서드
    List<CarWash> findByWashNameContaining(String name);

    // 주소로 세차장을 검색하는 메서드
    List<CarWash> findByWashAddrContaining(String addr);

}
