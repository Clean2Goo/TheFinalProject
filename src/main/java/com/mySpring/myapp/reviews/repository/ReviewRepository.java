package com.mySpring.myapp.reviews.repository;

import com.mySpring.myapp.reviews.model.Review;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Optional;

@Repository
public interface ReviewRepository extends JpaRepository<Review, String> {

    List<Review> findByRsvId(String rsvId);

    Optional<Review> findByRwId(String rwId);

    boolean existsByRwId(String rwId);

    boolean existsByRsvIdAndUserId(String rsvId, String userId);

    List<Review> findByWashId(String washId);

    @Transactional
    void deleteByRwId(String rwId);

    List<Review> findByUserId(String userId);

    
    @Query("SELECT ROUND(AVG(r.rwvScore), 1) FROM Review r WHERE r.washId = :washId")
    Double findAverageScoreByWashId(@Param("washId") String washId);
}
