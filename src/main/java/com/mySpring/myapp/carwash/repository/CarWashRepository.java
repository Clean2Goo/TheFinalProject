package com.mySpring.myapp.carwash.repository;

import com.mySpring.myapp.carwash.model.CarWash;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Optional;

@Repository
public interface CarWashRepository extends JpaRepository<CarWash, String> {

    boolean existsByWashId(String washId);

    // 이름으로 세차장을 검색하는 메서드
    List<CarWash> findByWashNameContaining(String name);

    // 주소로 세차장을 검색하는 메서드
    List<CarWash> findByWashAddrContaining(String addr);

    Optional<CarWash> findByWashId(String washId);

    // 평균 평점을 직접 받아서 업데이트하는 쿼리
    @Transactional
    @Modifying(clearAutomatically = true)
    @Query("UPDATE CarWash c SET c.rating = :rating WHERE c.washId = :washId")
    int updateRatingByWashId(@Param("washId") String washId, @Param("rating") Double rating);
}
