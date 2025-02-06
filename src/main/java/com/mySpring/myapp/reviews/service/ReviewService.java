package com.mySpring.myapp.reviews.service;

import com.mySpring.myapp.carwash.repository.CarWashRepository;
import com.mySpring.myapp.reviews.model.Review;
import com.mySpring.myapp.reviews.repository.ReviewRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;
import java.util.UUID;
import java.util.logging.Logger;

@Service
public class ReviewService {

    @Autowired
    private ReviewRepository reviewRepository;

    @Autowired
    private CarWashRepository carWashRepository; // 세차장 정보

    private static final Logger logger = Logger.getLogger(ReviewService.class.getName());

    @Transactional
    public void deleteUserReview(String rwId, String userId) {
        logger.info("Delete review: " + rwId + ", user: " + userId);
        Optional<Review> optionalReview = reviewRepository.findByRwId(rwId);
        if (optionalReview.isEmpty()) {
            logger.warning("Review not found: " + rwId);
            throw new RuntimeException("리뷰를 찾을 수 없습니다.");
        }
        Review review = optionalReview.get();
        if (!review.getUserId().equals(userId)) {
            logger.warning("User mismatch for review: " + rwId);
            throw new RuntimeException("본인의 리뷰만 삭제할 수 있습니다.");
        }
        reviewRepository.deleteByRwId(rwId);
    }

    public List<Review> getReviewsByOwnerId(String ownerId) {
        List<String> washIds = carWashRepository.findWashIdsByOwnerId(ownerId);
        List<Review> reviews = reviewRepository.findByWashIdIn(washIds);
        enrichReviewsWithWashName(reviews);
        return reviews;
    }

    public List<Review> getAllReviews() {
        logger.info("Fetching all reviews.");
        List<Review> reviews = reviewRepository.findAll();
        enrichReviewsWithWashName(reviews);
        return reviews;
    }

    // rsvId2 기준으로 리뷰 조회
    public List<Review> getReviewsByRsvId(String rsvId2) {
        logger.info("Fetching reviews for rsvId2: " + rsvId2);
        List<Review> reviews = reviewRepository.findByRsvId2(rsvId2);
        enrichReviewsWithWashName(reviews);
        return reviews;
    }

    public List<Review> getReviewsByWashId(String washId) {
        logger.info("Fetching reviews for washId: " + washId);
        List<Review> reviews = reviewRepository.findByWashId(washId);
        enrichReviewsWithWashName(reviews);
        return reviews;
    }

    // rsvId2 기준으로 존재 여부 체크
    public boolean checkReviewExists(String rsvId2) {
        return reviewRepository.existsByRsvId2(rsvId2);
    }

    public List<Review> getReviewsByUserId(String userId) {
        logger.info("Fetching reviews for user: " + userId);
        List<Review> reviews = reviewRepository.findByUserId(userId);
        enrichReviewsWithWashName(reviews);
        return reviews;
    }

    @Transactional
    public void saveReview(Review review, String userId) {
        // 중복 리뷰 체크 (rsvId2 기준)
        if (review.getRsvId2() != null && reviewRepository.existsByRsvId2(review.getRsvId2())) {
            throw new RuntimeException("이미 리뷰가 작성된 예약입니다.");
        }
        if (review.getRwId() == null || review.getRwId().isEmpty()) {
            review.setRwId(UUID.randomUUID().toString());
        }
        review.setUserId(userId);
        logger.info("Saving review for user: " + userId);
        logger.info("Review Content: " + review.getContent());
        logger.info("Review RSVNID2: " + review.getRsvId2());
        reviewRepository.save(review);
    }

    public Review getReviewByRwId(String rwId) {
        logger.info("Fetching review: " + rwId);
        Review review = reviewRepository.findByRwId(rwId).orElseThrow(() -> {
            logger.warning("Review not found: " + rwId);
            return new RuntimeException("Review not found.");
        });
        enrichReviewWithWashName(review);
        return review;
    }

    @Transactional
    public void updateReview(String rwId, Review updatedReview, String userId) {
        logger.info("Updating review: " + rwId + ", user: " + userId);
        Review existingReview = getReviewByRwId(rwId);
        if (!existingReview.getUserId().equals(userId)) {
            logger.warning("User mismatch for review update: " + rwId);
            throw new RuntimeException("본인의 리뷰만 수정할 수 있습니다.");
        }
        // 기존 예약 ID와 작성일 유지
        updatedReview.setRsvId(existingReview.getRsvId());
        updatedReview.setCrtDate(existingReview.getCrtDate());
        updatedReview.setRwId(rwId);
        updatedReview.setUserId(userId);
        reviewRepository.save(updatedReview);
        logger.info("Review updated: " + rwId);
    }

    // 세차장 이름 채우기
    private void enrichReviewsWithWashName(List<Review> reviews) {
        for (Review review : reviews) {
            enrichReviewWithWashName(review);
        }
    }

    public void enrichReviewWithWashName(Review review) {
        if (review.getWashId() != null) {
            carWashRepository.findByWashId(review.getWashId()).ifPresent(carWash -> {
                review.setWashName(carWash.getWashName());
            });
        } else if (review.getRsvId() != null) {
            carWashRepository.findByWashId(review.getRsvId()).ifPresent(carWash -> {
                review.setWashName(carWash.getWashName());
            });
        }
    }
}
