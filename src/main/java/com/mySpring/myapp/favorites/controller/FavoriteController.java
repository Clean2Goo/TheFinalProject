package com.mySpring.myapp.favorites.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import com.mySpring.myapp.favorites.service.FavoriteService;
import com.mySpring.myapp.favorites.vo.FavoriteVO;

@RestController
@RequestMapping("/api/favorites")
public class FavoriteController {

    private static final Logger logger = LoggerFactory.getLogger(FavoriteController.class);

    @Autowired
    private FavoriteService favoriteService;


    private String getLoggedInUserId(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        logger.info("Session ID: {}", session != null ? session.getId() : "세션 없음");
        logger.info("Session userId: {}", session != null ? session.getAttribute("userId") : "유저 없음");

        if (session == null || session.getAttribute("userId") == null) {
            throw new IllegalArgumentException("로그인 상태가 아닙니다.");
        }
        return (String) session.getAttribute("userId");
    }


    @PostMapping("/redirectToReservation")
    public ResponseEntity<String> redirectToReservation(@RequestParam("washId") String washId) {
        logger.info("예약 리디렉션 요청: washId={}", washId);
        return ResponseEntity.ok("/carwash/reservationStep1.do?washId=" + washId);
    }


    @PostMapping("/add")
    public ResponseEntity<String> addFavorite(@RequestBody FavoriteVO favoriteData, HttpServletRequest request) {
        try {
            String userId = getLoggedInUserId(request);
            favoriteData.setUserId(userId);
            logger.info("즐겨찾기 추가: userId={}, washId={}", userId, favoriteData.getWashId());

            favoriteService.addFavorite(favoriteData);
            return ResponseEntity.ok("즐겨찾기 추가 성공");
        } catch (IllegalArgumentException e) {
            logger.error("유효하지 않은 데이터: {}", e.getMessage());
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("유효하지 않은 데이터: " + e.getMessage());
        } catch (Exception e) {
            logger.error("즐겨찾기 추가 오류", e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("즐겨찾기 추가 실패: " + e.getMessage());
        }
    }


    @PostMapping("/remove")
    public ResponseEntity<String> removeFavorite(@RequestBody FavoriteVO favoriteData, HttpServletRequest request) {
        try {
            String userId = getLoggedInUserId(request);
            favoriteData.setUserId(userId);
            logger.info("즐겨찾기 삭제: userId={}, washId={}", userId, favoriteData.getWashId());

            favoriteService.removeFavorite(favoriteData);
            return ResponseEntity.ok("즐겨찾기 삭제 성공");
        } catch (IllegalArgumentException e) {
            logger.error("유효하지 않은 데이터: {}", e.getMessage());
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("유효하지 않은 데이터: " + e.getMessage());
        } catch (Exception e) {
            logger.error("즐겨찾기 삭제 오류", e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("즐겨찾기 삭제 실패: " + e.getMessage());
        }
    }


    @GetMapping("/{userId}")
    public ResponseEntity<List<FavoriteVO>> getFavoritesByUserId(@PathVariable String userId, HttpServletRequest request) {
        try {
            String sessionUserId = getLoggedInUserId(request);
            if (!userId.equals(sessionUserId)) {
                throw new IllegalArgumentException("본인의 즐겨찾기 목록만 조회할 수 있습니다.");
            }
            logger.info("즐겨찾기 목록 조회: userId={}", userId);

            List<FavoriteVO> favorites = favoriteService.getFavoritesByUserId(userId);
            return ResponseEntity.ok(favorites);
        } catch (IllegalArgumentException e) {
            logger.error("잘못된 접근: {}", e.getMessage());
            return ResponseEntity.status(HttpStatus.FORBIDDEN).body(null);
        } catch (Exception e) {
            logger.error("즐겨찾기 조회 오류: {}", userId, e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
        }
    }


    @GetMapping
    public ResponseEntity<List<FavoriteVO>> getFavorites(HttpServletRequest request) {
        try {
            String userId = getLoggedInUserId(request);
            logger.info("전체 즐겨찾기 목록 조회: userId={}", userId);

            List<FavoriteVO> favorites = favoriteService.getFavoritesByUserId(userId);
            return ResponseEntity.ok(favorites);
        } catch (IllegalArgumentException e) {
            logger.error("유효하지 않은 데이터: {}", e.getMessage());
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(null);
        } catch (Exception e) {
            logger.error("즐겨찾기 조회 오류", e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
        }
    }
}
