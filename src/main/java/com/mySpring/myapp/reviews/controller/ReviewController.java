package com.mySpring.myapp.reviews.controller;

import com.mySpring.myapp.reviews.model.Review;
import com.mySpring.myapp.reviews.service.ReviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders; // 올바른 HttpHeaders 임포트
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/reviews")
public class ReviewController {

    @Autowired
    private ReviewService reviewService;

    // 리뷰 저장
    @PostMapping
    public ResponseEntity<String> addReview(@RequestBody Review review) {
        try {
            reviewService.saveReview(review);
            return ResponseEntity.ok()
                .header(HttpHeaders.CONTENT_TYPE, "application/json; charset=UTF-8")
                .body("리뷰가 성공적으로 저장되었습니다.");
        } catch (Exception e) {
            return ResponseEntity.status(500).body("리뷰 저장 중 오류가 발생했습니다: " + e.getMessage());
        }
    }

    // 특정 세차장(rsvId)의 리뷰 가져오기
    @GetMapping("/{rsvId}")
    public ResponseEntity<?> getReviewsByRsvId(@PathVariable String rsvId) {
        try {
            List<Review> reviews = reviewService.getReviewsByRsvId(rsvId);
            return ResponseEntity.ok(reviews);
        } catch (Exception e) {
            return ResponseEntity.status(500).body("리뷰 조회 중 오류가 발생했습니다: " + e.getMessage());
        }
    }

    // 모든 리뷰 조회 (GET /api/reviews)
    @GetMapping
    public ResponseEntity<List<Review>> getAllReviews() {
        try {
            List<Review> reviews = reviewService.getAllReviews();
            return ResponseEntity.ok(reviews);
        } catch (Exception e) {
            return ResponseEntity.status(500).body(null);
        }
    }

    // 특정 리뷰 삭제
    @DeleteMapping("/{rwId}")
    public ResponseEntity<?> deleteReview(@PathVariable String rwId) {
        try {
            reviewService.deleteReviewByRwId(rwId);
            return ResponseEntity.ok("리뷰가 성공적으로 삭제되었습니다.");
        } catch (Exception e) {
            return ResponseEntity.status(500).body("리뷰 삭제 중 오류가 발생했습니다: " + e.getMessage());
        }
    }

    // 리뷰 수정
    @PutMapping("/{rwId}")
    public ResponseEntity<?> updateReview(@PathVariable String rwId, @RequestBody Review updatedReview) {
        try {
            reviewService.updateReview(rwId, updatedReview);
            return ResponseEntity.ok("리뷰가 성공적으로 수정되었습니다.");
        } catch (Exception e) {
            return ResponseEntity.status(500).body("리뷰 수정 중 오류가 발생했습니다: " + e.getMessage());
        }
    }
}
