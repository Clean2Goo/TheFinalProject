package com.mySpring.myapp.reviews.controller;

import com.mySpring.myapp.member.vo.MemberVO;
import com.mySpring.myapp.reviews.model.Review;
import com.mySpring.myapp.reviews.service.ReviewService;
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

    // 리뷰 작성 (rsvId2 포함)
    @PostMapping
    public ResponseEntity<String> addReview(@RequestBody Review review, HttpServletRequest request) {
        try {
            HttpSession session = request.getSession(false);
            if (session == null || session.getAttribute("member") == null) {
                return ResponseEntity.status(401).body("로그인이 필요합니다.");
            }
            MemberVO member = (MemberVO) session.getAttribute("member");
            review.setUserId(member.getId());
            
            // rsvId2 값이 포함되어 있어야 함
            reviewService.saveReview(review, member.getId());
            return ResponseEntity.ok()
                    .header(HttpHeaders.CONTENT_TYPE, "application/json; charset=UTF-8")
                    .body("리뷰가 성공적으로 저장되었습니다.");
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(500)
                    .body("리뷰 저장 중 오류: " + e.getMessage());
        }
    }

    // 세차장별 리뷰 조회
    @GetMapping("/byWashId/{washId}")
    public ResponseEntity<?> getReviewsByWashId(@PathVariable String washId) {
        try {
            List<Review> reviews = reviewService.getReviewsByWashId(washId);
            return ResponseEntity.ok(reviews);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(500).body("리뷰 조회 오류: " + e.getMessage());
        }
    }

    // 예약 건별 리뷰 조회 (rsvId2 기준)
    @GetMapping("/{rsvId}")
    public ResponseEntity<?> getReviewsByRsvId(@PathVariable String rsvId) {
        try {
            List<Review> reviews = reviewService.getReviewsByRsvId(rsvId);
            return ResponseEntity.ok(reviews);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(500).body("리뷰 조회 오류: " + e.getMessage());
        }
    }

    // 내 리뷰 조회
    @GetMapping("/myReviews")
    public ResponseEntity<?> getMyReviews(HttpServletRequest request) {
        try {
            HttpSession session = request.getSession(false);
            if (session == null || session.getAttribute("member") == null) {
                return ResponseEntity.status(401).body("로그인이 필요합니다.");
            }
            MemberVO member = (MemberVO) session.getAttribute("member");
            List<Review> myReviews = reviewService.getReviewsByUserId(member.getId());
            for (Review review : myReviews) {
                reviewService.enrichReviewWithWashName(review);
            }
            return ResponseEntity.ok(myReviews);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(500).body("내 리뷰 조회 오류: " + e.getMessage());
        }
    }

    // 예약 건별 리뷰 존재 확인
    @GetMapping("/{rsvId}/exists")
    public ResponseEntity<Boolean> checkReviewExists(@PathVariable String rsvId) {
        try {
            boolean exists = reviewService.checkReviewExists(rsvId);
            return ResponseEntity.ok(exists);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(500).body(false);
        }
    }

    // 전체 리뷰 조회
    @GetMapping
    public ResponseEntity<List<Review>> getAllReviews() {
        try {
            List<Review> reviews = reviewService.getAllReviews();
            return ResponseEntity.ok(reviews);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(500).body(null);
        }
    }

    // 리뷰 삭제
    @DeleteMapping("/{rwId}")
    public ResponseEntity<?> deleteReview(@PathVariable String rwId, HttpServletRequest request) {
        try {
            HttpSession session = request.getSession(false);
            if (session == null || session.getAttribute("member") == null) {
                return ResponseEntity.status(401).body("로그인이 필요합니다.");
            }
            MemberVO member = (MemberVO) session.getAttribute("member");
            reviewService.deleteUserReview(rwId, member.getId());
            return ResponseEntity.ok("리뷰가 삭제되었습니다.");
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(500).body("리뷰 삭제 오류: " + e.getMessage());
        }
    }

    // 관리자용 리뷰 조회
    @GetMapping("/admin/reviews")
    public ResponseEntity<?> getAdminReviews(HttpServletRequest request) {
        try {
            HttpSession session = request.getSession(false);
            if (session == null || session.getAttribute("member") == null) {
                return ResponseEntity.status(401).body("로그인이 필요합니다.");
            }
            MemberVO admin = (MemberVO) session.getAttribute("member");
            List<Review> adminReviews = reviewService.getReviewsByOwnerId(admin.getId());
            return ResponseEntity.ok(adminReviews);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(500).body("관리자 리뷰 조회 오류: " + e.getMessage());
        }
    }

    // 리뷰 수정
    @PutMapping("/{rwId}")
    public ResponseEntity<?> updateReview(@PathVariable String rwId, @RequestBody Review updatedReview, HttpServletRequest request) {
        try {
            HttpSession session = request.getSession(false);
            if (session == null || session.getAttribute("member") == null) {
                return ResponseEntity.status(401).body("로그인이 필요합니다.");
            }
            MemberVO member = (MemberVO) session.getAttribute("member");
            reviewService.updateReview(rwId, updatedReview, member.getId());
            return ResponseEntity.ok("리뷰가 수정되었습니다.");
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(500).body("리뷰 수정 오류: " + e.getMessage());
        }
    }
}
