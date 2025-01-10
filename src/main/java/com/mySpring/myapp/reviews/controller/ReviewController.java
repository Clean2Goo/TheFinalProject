package com.mySpring.myapp.reviews.controller;

import com.mySpring.myapp.reviews.model.Review;
import com.mySpring.myapp.reviews.service.ReviewService;
import com.mySpring.myapp.member.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@RestController
@RequestMapping("/api/reviews")
public class ReviewController {

    @Autowired
    private ReviewService reviewService;

    // 리뷰 저장
    @PostMapping
    public ResponseEntity<String> addReview(@RequestBody Review review, HttpServletRequest request) {
        try {
            // 로그인 상태 확인
            HttpSession session = request.getSession(false);
            if (session == null || session.getAttribute("member") == null) {
                return ResponseEntity.status(401).body("로그인이 필요합니다.");
            }

            // 로그인된 사용자 정보 가져오기
            MemberVO member = (MemberVO) session.getAttribute("member");
            review.setUserId(member.getId()); // 리뷰 작성자 ID 설정

            // 리뷰 저장
            reviewService.saveReview(review, member.getId());
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
    public ResponseEntity<?> deleteReview(@PathVariable String rwId, HttpServletRequest request) {
        try {
            // 로그인 상태 확인
            HttpSession session = request.getSession(false);
            if (session == null || session.getAttribute("member") == null) {
                return ResponseEntity.status(401).body("로그인이 필요합니다.");
            }

            // 로그인된 사용자 정보 가져오기
            MemberVO member = (MemberVO) session.getAttribute("member");

            // 리뷰 삭제
            reviewService.deleteReviewByRwId(rwId, member.getId());
            return ResponseEntity.ok("리뷰가 성공적으로 삭제되었습니다.");
        } catch (Exception e) {
            return ResponseEntity.status(500).body("리뷰 삭제 중 오류가 발생했습니다: " + e.getMessage());
        }
    }

    // 리뷰 수정
    @PutMapping("/{rwId}")
    public ResponseEntity<?> updateReview(@PathVariable String rwId, @RequestBody Review updatedReview, HttpServletRequest request) {
        try {
            // 로그인 상태 확인
            HttpSession session = request.getSession(false);
            if (session == null || session.getAttribute("member") == null) {
                return ResponseEntity.status(401).body("로그인이 필요합니다.");
            }

            // 로그인된 사용자 정보 가져오기
            MemberVO member = (MemberVO) session.getAttribute("member");

            // 리뷰 수정
            reviewService.updateReview(rwId, updatedReview, member.getId());
            return ResponseEntity.ok("리뷰가 성공적으로 수정되었습니다.");
        } catch (Exception e) {
            return ResponseEntity.status(500).body("리뷰 수정 중 오류가 발생했습니다: " + e.getMessage());
        }
    }
}
