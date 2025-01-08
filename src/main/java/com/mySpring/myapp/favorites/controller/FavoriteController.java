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
import com.mySpring.myapp.favorites.service.FavoriteService;
import com.mySpring.myapp.favorites.vo.FavoriteVO;

@RestController
@RequestMapping("/api/favorites")
public class FavoriteController {

    private static final Logger logger = LoggerFactory.getLogger(FavoriteController.class);

    @Autowired
    private FavoriteService favoriteService;

    // 공통 메서드: 로그인된 userId 가져오기
    private String getLoggedInUserId(HttpServletRequest request) {
        HttpSession session = request.getSession(false); // 기존 세션 확인
        logger.info("Session ID: {}", session.getId()); // 세션 ID 로그
        logger.info("Session userId: {}", session.getAttribute("userId")); // userId 로그
        if (session == null || session.getAttribute("userId") == null) {
            throw new IllegalArgumentException("로그인 상태가 아닙니다.");
        }
        return (String) session.getAttribute("userId");
    }


    // 즐겨찾기 추가
    @PostMapping("/add")
    public ResponseEntity<String> addFavorite(@RequestBody FavoriteVO favoriteData, HttpServletRequest request) {
        try {
            String userId = getLoggedInUserId(request);
            favoriteData.setUserId(userId);
            logger.info("Adding favorite for userId: {} and washId: {}", userId, favoriteData.getWashId());
            favoriteService.addFavorite(favoriteData);
            return ResponseEntity.ok("즐겨찾기 추가 성공");
        } catch (IllegalArgumentException e) {
            logger.error("Invalid data: {}", e.getMessage());
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("유효하지 않은 데이터: " + e.getMessage());
        } catch (Exception e) {
            logger.error("Error adding favorite", e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("즐겨찾기 추가 실패: " + e.getMessage());
        }
    }

    // 즐겨찾기 삭제
    @PostMapping("/remove")
    public ResponseEntity<String> removeFavorite(@RequestBody FavoriteVO favoriteData, HttpServletRequest request) {
        try {
            String userId = getLoggedInUserId(request);
            favoriteData.setUserId(userId);
            logger.info("Removing favorite for userId: {} and washId: {}", userId, favoriteData.getWashId());
            favoriteService.removeFavorite(favoriteData);
            return ResponseEntity.ok("즐겨찾기 삭제 성공");
        } catch (IllegalArgumentException e) {
            logger.error("Invalid data: {}", e.getMessage());
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("유효하지 않은 데이터: " + e.getMessage());
        } catch (Exception e) {
            logger.error("Error removing favorite", e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("즐겨찾기 삭제 실패: " + e.getMessage());
        }
    }

    // 특정 유저의 즐겨찾기 목록 조회
    @GetMapping("/{userId}")
    public ResponseEntity<List<FavoriteVO>> getFavoritesByUserId(@PathVariable String userId, HttpServletRequest request) {
        try {
            String sessionUserId = getLoggedInUserId(request);
            if (!userId.equals(sessionUserId)) {
                throw new IllegalArgumentException("본인의 즐겨찾기 목록만 조회할 수 있습니다.");
            }
            logger.info("Fetching favorites for userId: {}", userId);
            List<FavoriteVO> favorites = favoriteService.getFavoritesByUserId(userId);
            return ResponseEntity.ok(favorites);
        } catch (IllegalArgumentException e) {
            logger.error("Invalid access: {}", e.getMessage());
            return ResponseEntity.status(HttpStatus.FORBIDDEN).body(null);
        } catch (Exception e) {
            logger.error("Error fetching favorites for userId: {}", userId, e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
        }
    }

    // 모든 유저의 즐겨찾기 목록 조회
    @GetMapping
    public ResponseEntity<List<FavoriteVO>> getAllFavorites() {
        try {
            logger.info("Fetching all favorites");
            List<FavoriteVO> favorites = favoriteService.getAllFavorites();
            logger.info("Fetched favorites: {}", favorites); // 로그 추가
            return ResponseEntity.ok(favorites);
        } catch (Exception e) {
            logger.error("Error fetching all favorites", e); // 예외 로그
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
        }
    }
}
