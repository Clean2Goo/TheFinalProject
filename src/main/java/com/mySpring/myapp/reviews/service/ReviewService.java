package com.mySpring.myapp.reviews.service;

import com.mySpring.myapp.reviews.model.Review;
import com.mySpring.myapp.reviews.repository.ReviewRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
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
    public void saveReview(Review review, String userId) {
        if (review.getRwId() == null || review.getRwId().isEmpty()) {
            review.setRwId(UUID.randomUUID().toString());
        }
        review.setUserId(userId); // 작성자 ID 설정
        logger.info("Saving review for userId: " + userId + " with data: " + review);
        reviewRepository.save(review);
    }

    // 특정 리뷰 조회
    public Review getReviewByRwId(String rwId) {
        logger.info("Fetching review with ID: " + rwId);
        return reviewRepository.findByRwId(rwId).orElseThrow(() -> {
            logger.warning("Review with ID " + rwId + " not found.");
            return new RuntimeException("Review not found.");
        });
    }

    // 특정 리뷰 삭제
    public void deleteReviewByRwId(String rwId, String userId) {
        logger.info("Deleting review with ID: " + rwId + " by userId: " + userId);
        Review review = getReviewByRwId(rwId);

        // 작성자 검증
        if (!review.getUserId().equals(userId)) {
            logger.warning("User ID mismatch. User " + userId + " tried to delete review owned by " + review.getUserId());
            throw new RuntimeException("본인의 리뷰만 삭제할 수 있습니다.");
        }

        reviewRepository.deleteByRwId(rwId);
    }

    // 리뷰 수정
    public void updateReview(String rwId, Review updatedReview, String userId) {
        logger.info("Updating review with ID: " + rwId + " by userId: " + userId);
        Review existingReview = getReviewByRwId(rwId);

        // 작성자 검증
        if (!existingReview.getUserId().equals(userId)) {
            logger.warning("User ID mismatch. User " + userId + " tried to update review owned by " + existingReview.getUserId());
            throw new RuntimeException("본인의 리뷰만 수정할 수 있습니다.");
        }

        updatedReview.setRwId(rwId);
        updatedReview.setUserId(userId); // 작성자 ID 유지
        reviewRepository.save(updatedReview);
    }
}
