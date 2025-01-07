package com.mySpring.myapp.reviews.service;

import com.mySpring.myapp.reviews.model.Review;
import com.mySpring.myapp.reviews.repository.ReviewRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;
import java.util.logging.Logger;

@Service
public class ReviewService {

    private static final Logger logger = Logger.getLogger(ReviewService.class.getName());

    @Autowired
    private ReviewRepository reviewRepository;

    // 모든 리뷰 조회
    public List<Review> getAllReviews() {
        logger.info("Fetching all reviews from database.");
        return reviewRepository.findAll();
    }

    // 특정 세차장의 리뷰 조회
    public List<Review> getReviewsByRsvId(String rsvId) {
        logger.info("Fetching reviews for rsvId: " + rsvId);
        return reviewRepository.findByRsvId(rsvId);
    }

    // 리뷰 저장
    public void saveReview(Review review) {
        if (review.getRwId() == null || review.getRwId().isEmpty()) {
            review.setRwId(UUID.randomUUID().toString());
        }
        logger.info("Saving review: " + review);
        reviewRepository.save(review);
    }

    // 특정 리뷰 삭제
    public void deleteReviewByRwId(String rwId) {
        logger.info("Deleting review with ID: " + rwId);
        if (reviewRepository.existsByRwId(rwId)) {
            reviewRepository.deleteByRwId(rwId);
        } else {
            logger.warning("Review with ID " + rwId + " not found.");
            throw new RuntimeException("Review not found.");
        }
    }

    // 리뷰 수정
    public void updateReview(String rwId, Review updatedReview) {
        logger.info("Updating review with ID: " + rwId);
        if (reviewRepository.existsByRwId(rwId)) {
            updatedReview.setRwId(rwId);
            reviewRepository.save(updatedReview);
        } else {
            logger.warning("Review with ID " + rwId + " not found.");
            throw new RuntimeException("Review not found.");
        }
    }
}
