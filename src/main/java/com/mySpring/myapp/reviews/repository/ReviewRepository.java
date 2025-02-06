package com.mySpring.myapp.reviews.repository;

import com.mySpring.myapp.reviews.model.Review;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Repository
public interface ReviewRepository extends JpaRepository<Review, String> {

    List<Review> findByRsvId(String rsvId);
    Optional<Review> findByRwId(String rwId);
    boolean existsByRwId(String rwId);
    boolean existsByRsvId(String rsvId);

    // 새 예약 건별 예약 ID (rsvId2) 관련 메서드
    boolean existsByRsvId2(String rsvId2);
    List<Review> findByRsvId2(String rsvId2);

    // 세차장 및 사용자 관련 메서드
    List<Review> findByWashId(String washId);
    List<Review> findByWashIdIn(List<String> washIds);
    List<Review> findByUserId(String userId);

    @Transactional
    void deleteByRwId(String rwId);
}
