package com.mySpring.myapp.reviews.service;

import com.mySpring.myapp.carwash.repository.CarWashRepository;
import com.mySpring.myapp.reviews.model.Review;
import com.mySpring.myapp.reviews.repository.ReviewRepository;
import com.mySpring.myapp.reservation.dao.ReservationDAO;
import com.mySpring.myapp.reservation.vo.ReservationVO;

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

    @Autowired
    private ReservationDAO reservationDAO;

    private static final Logger logger = Logger.getLogger(ReviewService.class.getName());

    /**
     * 리뷰 삭제
     */
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
    }

    /**
     * 모든 리뷰 조회
     */
    public List<Review> getAllReviews() {
        logger.info("Fetching all reviews from database.");
        List<Review> reviews = reviewRepository.findAll();
        enrichReviewsWithWashName(reviews);
        return reviews;
    }

    /**
     * 예약 ID(rsvId) 기준 리뷰 조회
     */
    public List<Review> getReviewsByRsvId(String rsvId) {
        logger.info("Fetching reviews for rsvId: " + rsvId);
        List<Review> reviews = reviewRepository.findByRsvId(rsvId);
        enrichReviewsWithWashName(reviews);
        return reviews;
    }

    /**
     * 세차장 ID(washId) 기준 리뷰 조회
     */
    public List<Review> getReviewsByWashId(String washId) {
        logger.info("Fetching reviews for washId: " + washId);
        List<Review> reviews = reviewRepository.findByWashId(washId);
        enrichReviewsWithWashName(reviews);
        return reviews;
    }

    /**
     * 예약 ID2(rsvId2) 기준 리뷰 존재 여부 확인
     */
    public boolean checkReviewExists(String rsvId2) {
        return reviewRepository.existsByRsvId2(rsvId2);
    }

    /**
     * 사용자 ID(userId) 기준 리뷰 조회
     */
    public List<Review> getReviewsByUserId(String userId) {
        logger.info("Fetching reviews for userId: " + userId);
        List<Review> reviews = reviewRepository.findByUserId(userId);
        enrichReviewsWithWashName(reviews);
        return reviews;
    }

    /**
     * 관리자(세차장 주인) ID 기준 리뷰 조회
     */
    public List<Review> getReviewsByOwnerId(String ownerId) {
        List<String> washIds = carWashRepository.findWashIdsByOwnerId(ownerId);
        if (washIds.isEmpty()) {
            return List.of();
        }
        List<Review> reviews = reviewRepository.findByWashIdIn(washIds);
        enrichReviewsWithWashName(reviews);
        return reviews;
    }

    /**
     * 리뷰 저장
     */
    @Transactional
    public void saveReview(Review review, String userId) {
        if (review.getRsvId2() == null || review.getRsvId2().isEmpty()) {
            throw new RuntimeException("예약 ID (rsvId2) 값이 필요합니다.");
        }

        ReservationVO reservation = reservationDAO.findReservationById(review.getRsvId2());
        if (reservation == null) {
            throw new RuntimeException("해당 예약 ID(" + review.getRsvId2() + ")에 대한 예약이 존재하지 않습니다.");
        }

        if (reviewRepository.existsByRsvId2(review.getRsvId2())) {
            throw new RuntimeException("이미 리뷰가 작성된 예약입니다.");
        }

        // RSVNID에는 세차장 ID 저장
        review.setRsvId(reservation.getWashId());

        // WASHID에도 세차장 ID 저장
        review.setWashId(reservation.getWashId());

        // RSVNID2는 예약 ID 저장
        review.setRsvId2(reservation.getRsvnId());

        if (review.getRwId() == null || review.getRwId().isEmpty()) {
            review.setRwId(UUID.randomUUID().toString());
        }

        review.setUserId(userId);
        logger.info("Saving review for userId: " + userId + " with data: " + review);
        reviewRepository.save(review);
    }

    /**
     * 리뷰 ID(rwId) 기준 단일 리뷰 조회
     */
    public Review getReviewByRwId(String rwId) {
        logger.info("Fetching review with ID: " + rwId);
        Review review = reviewRepository.findByRwId(rwId).orElseThrow(() -> {
            logger.warning("Review with ID " + rwId + " not found.");
            return new RuntimeException("Review not found.");
        });

        enrichReviewWithWashName(review);
        return review;
    }

    /**
     * 리뷰 수정
     */
    @Transactional
    public void updateReview(String rwId, Review updatedReview, String userId) {
        logger.info("Updating review with ID: " + rwId + " by userId: " + userId);

        Review existingReview = getReviewByRwId(rwId);

        if (!existingReview.getUserId().equals(userId)) {
            logger.warning("User ID mismatch. User " + userId + " tried to update review owned by " + existingReview.getUserId());
            throw new RuntimeException("본인의 리뷰만 수정할 수 있습니다.");
        }

        updatedReview.setRsvId(existingReview.getRsvId());
        updatedReview.setRsvId2(existingReview.getRsvId2());
        updatedReview.setCrtDate(existingReview.getCrtDate());

        updatedReview.setRwId(rwId);
        updatedReview.setUserId(userId);

        reviewRepository.save(updatedReview);
        logger.info("Review with ID: " + rwId + " updated successfully.");
    }

    /**
     * 세차장 이름 정보 추가 (여러 개)
     */
    private void enrichReviewsWithWashName(List<Review> reviews) {
        for (Review review : reviews) {
            enrichReviewWithWashName(review);
        }
    }

    /**
     * 세차장 이름 정보 추가 (단일 개체)
     */
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
