package com.mySpring.myapp.reviews.repository;

import com.mySpring.myapp.reviews.model.Review;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import java.util.List;

public interface ReviewRepository extends JpaRepository<Review, String> {

    List<Review> findByRsvId(String rsvId);

    @Query("SELECT COUNT(r) > 0 FROM Review r WHERE r.rwId = :rwId")
    boolean existsByRwId(@Param("rwId") String rwId);

    @Query("DELETE FROM Review r WHERE r.rwId = :rwId")
    void deleteByRwId(@Param("rwId") String rwId);
}
