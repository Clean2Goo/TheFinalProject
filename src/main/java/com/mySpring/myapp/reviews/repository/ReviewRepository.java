package com.mySpring.myapp.reviews.repository;

import com.mySpring.myapp.reviews.model.Review;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Repository
public interface ReviewRepository extends JpaRepository<Review, String> {

    // 특정 예약 ID로 리뷰 목록 조회
    List<Review> findByRsvId(String rsvId);

    // 특정 리뷰 ID로 리뷰 조회
    Optional<Review> findByRwId(String rwId);

    // 리뷰 ID로 리뷰 존재 여부 확인
    boolean existsByRwId(String rwId);

    // 예약 ID로 리뷰 존재 여부 확인
    boolean existsByRsvId(String rsvId);

    // 리뷰 ID로 리뷰 삭제
    @Transactional
    void deleteByRwId(String rwId);

    // 특정 사용자 ID로 리뷰 조회
    List<Review> findByUserId(String userId);
}
