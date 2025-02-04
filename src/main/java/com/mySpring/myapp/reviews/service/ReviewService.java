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
    private CarWashRepository carWashRepository;

    private static final Logger logger = Logger.getLogger(ReviewService.class.getName());

    @Transactional
    public void deleteUserReview(String rwId, String userId) {
        logger.info("Deleting review with ID: " + rwId + " by userId: " + userId);

        Optional<Review> optionalReview = reviewRepository.findByRwId(rwId);
        if (optionalReview.isEmpty()) {
            logger.warning("Review with ID " + rwId + " not found.");
            throw new RuntimeException("리뷰를 찾을 수 없습니다.");
        }

        Review review = optionalReview.get();

        if (!review.getUserId().equals(userId)) {
            logger.warning("User ID mismatch. User " + userId + " tried to delete review owned by " + review.getUserId());
            throw new RuntimeException("본인의 리뷰만 삭제할 수 있습니다.");
        }

        reviewRepository.deleteByRwId(rwId);
        updateCarWashRating(review.getWashId());
    }

    public List<Review> getAllReviews() {
        logger.info("Fetching all reviews from database.");
        List<Review> reviews = reviewRepository.findAll();
        enrichReviewsWithWashName(reviews);
        return reviews;
    }

    public List<Review> getReviewsByRsvId(String rsvId) {
        logger.info("Fetching reviews for rsvId: " + rsvId);
        List<Review> reviews = reviewRepository.findByRsvId(rsvId);
        enrichReviewsWithWashName(reviews);
        return reviews;
    }

    public List<Review> getReviewsByWashId(String washId) {
        logger.info("Fetching reviews for washId: " + washId);
        List<Review> reviews = reviewRepository.findByWashId(washId);
        enrichReviewsWithWashName(reviews);
        return reviews;
    }

    public boolean checkReviewExists(String rsvId, String userId) {
        return reviewRepository.existsByRsvIdAndUserId(rsvId, userId);
    }

    public List<Review> getReviewsByUserId(String userId) {
        logger.info("Fetching reviews for userId: " + userId);
        List<Review> reviews = reviewRepository.findByUserId(userId);
        enrichReviewsWithWashName(reviews);
        return reviews;
    }

    @Transactional
    public void saveReview(Review review, String userId) {
        if (review.getRwId() == null || review.getRwId().isEmpty()) {
            review.setRwId(UUID.randomUUID().toString());
        }
        review.setUserId(userId);
        logger.info("Saving review for userId: " + userId + " with data: " + review);
        reviewRepository.save(review); 

        updateCarWashRating(review.getWashId());
    }

    public Review getReviewByRwId(String rwId) {
        logger.info("Fetching review with ID: " + rwId);
        Review review = reviewRepository.findByRwId(rwId).orElseThrow(() -> {
            logger.warning("Review with ID " + rwId + " not found.");
            return new RuntimeException("Review not found.");
        });

        enrichReviewWithWashName(review);
        return review;
    }

    @Transactional
    public void updateReview(String rwId, Review updatedReview, String userId) {
        logger.info("Updating review with ID: " + rwId + " by userId: " + userId);

        Review existingReview = getReviewByRwId(rwId);

        if (!existingReview.getUserId().equals(userId)) {
            logger.warning("User ID mismatch. User " + userId + " tried to update review owned by " + existingReview.getUserId());
            throw new RuntimeException("본인의 리뷰만 수정할 수 있습니다.");
        }

        updatedReview.setRsvId(existingReview.getRsvId());
        updatedReview.setCrtDate(existingReview.getCrtDate());
        updatedReview.setRwId(rwId);
        updatedReview.setUserId(userId);

        reviewRepository.save(updatedReview); 
        logger.info("Review with ID: " + rwId + " updated successfully.");

        updateCarWashRating(updatedReview.getWashId());
    }

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

    @Transactional
    public void updateCarWashRating(String washId) {
        if (washId == null) return;

        Double averageRating = reviewRepository.findAverageScoreByWashId(washId);
        logger.info("Fetched average rating for washId: " + washId + " is: " + averageRating);

        if (averageRating == null) {
            averageRating = 0.0;
        }

        averageRating = Math.round(averageRating * 10.0) / 10.0;

        int updatedRows = carWashRepository.updateRatingByWashId(washId, averageRating);
        logger.info("Updated rating for washId: " + washId + " to: " + averageRating + ", rows affected: " + updatedRows);

        if (updatedRows == 0) {
            logger.warning("No rows were updated for washId: " + washId + ". Check if the washId exists in CARWASHES table.");
        }
    }
}
