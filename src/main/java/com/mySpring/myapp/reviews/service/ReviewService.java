package com.mySpring.myapp.reviews.service;

import com.mySpring.myapp.carwash.repository.CarWashRepository;
import com.mySpring.myapp.reviews.model.Review;
import com.mySpring.myapp.reviews.repository.ReviewRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.UUID;
import java.util.logging.Logger;

import org.springframework.transaction.annotation.Transactional;

@Service
public class ReviewService {

    @Autowired
    private ReviewRepository reviewRepository;

    @Autowired
    private CarWashRepository carWashRepository; // 세차장 정보를 위한 Repository

    private static final Logger logger = Logger.getLogger(ReviewService.class.getName());

    @Transactional
    public void deleteUserReview(String rwId, String userId) {
        logger.info("Deleting review with ID: " + rwId + " by userId: " + userId);

        // 기존 리뷰 조회
        Optional<Review> optionalReview = reviewRepository.findByRwId(rwId);
        if (optionalReview.isEmpty()) {
            logger.warning("Review with ID " + rwId + " not found.");
            throw new RuntimeException("리뷰를 찾을 수 없습니다.");
        }

        Review review = optionalReview.get();

        // 작성자 검증
        if (!review.getUserId().equals(userId)) {
            logger.warning("User ID mismatch. User " + userId + " tried to delete review owned by " + review.getUserId());
            throw new RuntimeException("본인의 리뷰만 삭제할 수 있습니다.");
        }

        reviewRepository.deleteByRwId(rwId);
    }

    public List<Review> getAllReviews() {
        logger.info("Fetching all reviews from database.");
        List<Review> reviews = reviewRepository.findAll();
        enrichReviewsWithWashName(reviews); // 세차장 이름 추가
        return reviews;
    }

    public List<Review> getReviewsByRsvId(String rsvId) {
        logger.info("Fetching reviews for rsvId: " + rsvId);
        List<Review> reviews = reviewRepository.findByRsvId(rsvId);
        enrichReviewsWithWashName(reviews); // 세차장 이름 추가
        return reviews;
    }

    public boolean checkReviewExists(String rsvId) {
        return reviewRepository.existsByRsvId(rsvId);
    }


    public List<Review> getReviewsByUserId(String userId) {
        logger.info("Fetching reviews for userId: " + userId);
        List<Review> reviews = reviewRepository.findByUserId(userId);
        enrichReviewsWithWashName(reviews); // 세차장 이름 추가
        return reviews;
    }

    @Transactional
    public void saveReview(Review review, String userId) {
        if (review.getRwId() == null || review.getRwId().isEmpty()) {
            review.setRwId(UUID.randomUUID().toString());
        }
        review.setUserId(userId); // 작성자 ID 설정
        logger.info("Saving review for userId: " + userId + " with data: " + review);
        reviewRepository.save(review);
    }

    public Review getReviewByRwId(String rwId) {
        logger.info("Fetching review with ID: " + rwId);
        Review review = reviewRepository.findByRwId(rwId).orElseThrow(() -> {
            logger.warning("Review with ID " + rwId + " not found.");
            return new RuntimeException("Review not found.");
        });

        // 세차장 이름 추가
        enrichReviewWithWashName(review);

        return review;
    }

    @Transactional
    public void updateReview(String rwId, Review updatedReview, String userId) {
        logger.info("Updating review with ID: " + rwId + " by userId: " + userId);

        // 기존 리뷰 조회
        Review existingReview = getReviewByRwId(rwId);

        // 작성자 검증
        if (!existingReview.getUserId().equals(userId)) {
            logger.warning("User ID mismatch. User " + userId + " tried to update review owned by " + existingReview.getUserId());
            throw new RuntimeException("본인의 리뷰만 수정할 수 있습니다.");
        }

        // 기존의 예약 ID와 생성 날짜 유지
        updatedReview.setRsvId(existingReview.getRsvId());
        updatedReview.setCrtDate(existingReview.getCrtDate());

        // 기존 리뷰의 식별자 및 작성자 유지
        updatedReview.setRwId(rwId);
        updatedReview.setUserId(userId);

        // 업데이트 처리
        reviewRepository.save(updatedReview);
        logger.info("Review with ID: " + rwId + " updated successfully.");
    }

    // 세차장 이름 추가 로직
    private void enrichReviewsWithWashName(List<Review> reviews) {
        for (Review review : reviews) {
            enrichReviewWithWashName(review);
        }
    }

    public void enrichReviewWithWashName(Review review) {
        if (review.getRsvId() != null) {
            carWashRepository.findByWashId(review.getRsvId()).ifPresent(carWash -> {
                review.setWashName(carWash.getWashName());
            });
        }
    }
}
