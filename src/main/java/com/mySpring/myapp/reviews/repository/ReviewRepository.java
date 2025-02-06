package com.mySpring.myapp.reviews.repository;

import com.mySpring.myapp.reviews.model.Review;

import org.apache.ibatis.annotations.Param;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
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

    List<Review> findByWashId(String washId); 

    List<Review> findByWashIdIn(List<String> washIds); 

    List<Review> findByUserId(String userId);

    @Transactional
    void deleteByRwId(String rwId);

}
