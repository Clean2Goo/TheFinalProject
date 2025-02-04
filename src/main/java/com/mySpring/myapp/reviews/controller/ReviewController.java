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

    /**
     *  리뷰 작성 시 WASHID 자동 설정
     */
    @PostMapping
    public ResponseEntity<String> addReview(@RequestBody Review review, HttpServletRequest request) {
        try {
            HttpSession session = request.getSession(false);
            if (session == null || session.getAttribute("member") == null) {
                return ResponseEntity.status(401).body("로그인이 필요합니다.");
            }

            MemberVO member = (MemberVO) session.getAttribute("member");
            review.setUserId(member.getId());

           
            reviewService.saveReview(review, member.getId());

            return ResponseEntity.ok()
                    .header(HttpHeaders.CONTENT_TYPE, "application/json; charset=UTF-8")
                    .body("리뷰가 성공적으로 저장되었습니다.");
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(500).body("리뷰 저장 중 오류가 발생했습니다: " + e.getMessage());
        }
    }

    @GetMapping("/byWashId/{washId}")
    public ResponseEntity<?> getReviewsByWashId(@PathVariable String washId) {
        try {
            List<Review> reviews = reviewService.getReviewsByWashId(washId);
            return ResponseEntity.ok(reviews);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(500).body("리뷰 조회 중 오류가 발생했습니다: " + e.getMessage());
        }
    }

    @GetMapping("/{rsvId}")
    public ResponseEntity<?> getReviewsByRsvId(@PathVariable String rsvId) {
        try {
            List<Review> reviews = reviewService.getReviewsByRsvId(rsvId);
            return ResponseEntity.ok(reviews);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(500).body("리뷰 조회 중 오류가 발생했습니다: " + e.getMessage());
        }
    }

    @GetMapping("/myReviews")
    public ResponseEntity<?> getMyReviews(HttpServletRequest request) {
        try {
            HttpSession session = request.getSession(false);
            if (session == null || session.getAttribute("member") == null) {
                return ResponseEntity.status(401).body("로그인이 필요합니다.");
            }

            MemberVO member = (MemberVO) session.getAttribute("member");
            String userId = member.getId();

            List<Review> myReviews = reviewService.getReviewsByUserId(userId);

            for (Review review : myReviews) {
                reviewService.enrichReviewWithWashName(review);
            }

            return ResponseEntity.ok(myReviews);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(500).body("리뷰 조회 중 오류가 발생했습니다: " + e.getMessage());
        }
    }

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

    @DeleteMapping("/{rwId}")
    public ResponseEntity<?> deleteReview(@PathVariable String rwId, HttpServletRequest request) {
        try {
            HttpSession session = request.getSession(false);
            if (session == null || session.getAttribute("member") == null) {
                return ResponseEntity.status(401).body("로그인이 필요합니다.");
            }

            MemberVO member = (MemberVO) session.getAttribute("member");

            reviewService.deleteUserReview(rwId, member.getId());
            return ResponseEntity.ok("리뷰가 성공적으로 삭제되었습니다.");
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(500).body("리뷰 삭제 중 오류가 발생했습니다: " + e.getMessage());
        }
    }

    @PutMapping("/{rwId}")
    public ResponseEntity<?> updateReview(@PathVariable String rwId, @RequestBody Review updatedReview, HttpServletRequest request) {
        try {
            HttpSession session = request.getSession(false);
            if (session == null || session.getAttribute("member") == null) {
                return ResponseEntity.status(401).body("로그인이 필요합니다.");
            }

            MemberVO member = (MemberVO) session.getAttribute("member");

            reviewService.updateReview(rwId, updatedReview, member.getId());
            return ResponseEntity.ok("리뷰가 성공적으로 수정되었습니다.");
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(500).body("리뷰 수정 중 오류가 발생했습니다: " + e.getMessage());
        }
    }
}
