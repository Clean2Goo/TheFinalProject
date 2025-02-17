package com.mySpring.myapp.reviews.repository;

import com.mySpring.myapp.reviews.model.Review;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Repository
public interface ReviewRepository extends JpaRepository<Review, String> {

    // 특정 예약 ID(RSVNID) 기준으로 리뷰 찾기
    List<Review> findByRsvId(String rsvId);
    
    // 리뷰 ID로 개별 리뷰 찾기
    Optional<Review> findByRwId(String rwId);
    
    // 특정 리뷰 ID 존재 여부 확인
    boolean existsByRwId(String rwId);
    
    // 특정 예약 ID(RSVNID) 존재 여부 확인
    boolean existsByRsvId(String rsvId);

    // 예약 건별 ID(RSVNID2) 관련 메서드 추가
    boolean existsByRsvId2(String rsvId2);  // 예약 ID(RSVNID2) 기준으로 중복 체크
    List<Review> findByRsvId2(String rsvId2); // 예약 ID(RSVNID2) 기준으로 리뷰 조회

    // 세차장 및 사용자 관련 메서드
    List<Review> findByWashId(String washId);
    List<Review> findByWashIdIn(List<String> washIds);
    List<Review> findByUserId(String userId);

    @Transactional
    void deleteByRwId(String rwId);
}
