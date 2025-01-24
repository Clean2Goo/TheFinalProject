package com.mySpring.myapp.manager.controller;

import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import com.mySpring.myapp.carwash.model.CarWash;
import com.mySpring.myapp.manager.service.ManagerService;

@RestController
@RequestMapping("/api/manager/carwashes")
public class ManagerRestController {

    @Autowired
    private ManagerService managerService;

    // 모든 세차장 조회
    @GetMapping
    public ResponseEntity<List<CarWash>> getAllCarwashes() {
        List<CarWash> carwashes = managerService.getAllCarwashes();
        return ResponseEntity.ok(carwashes);
    }

    // 특정 세차장 조회
    @GetMapping("/{washId}")
    public ResponseEntity<CarWash> getCarwashById(@PathVariable String washId) {
        CarWash carwash = managerService.getCarwashById(washId);
        if (carwash != null) {
            return ResponseEntity.ok(carwash);
        }
        return ResponseEntity.notFound().build();
    }

    // 특정 사용자의 세차장 조회
    @GetMapping("/user/{userId}")
    public ResponseEntity<List<CarWash>> getCarwashesByUserId(@PathVariable String userId) {
        List<CarWash> carwashes = managerService.getCarwashesByUserId(userId);
        return ResponseEntity.ok(carwashes);
    }

    // 현재 로그인한 사용자의 세차장 조회
    @GetMapping("/user")
    public ResponseEntity<List<CarWash>> getCarwashesByLoggedInUser(HttpSession session) {
        String userId = (String) session.getAttribute("userId");
        System.out.println("Session userId: " + userId); // 확인용 로그
        if (userId == null) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).build();
        }
        List<CarWash> carwashes = managerService.getCarwashesByUserId(userId);
        return ResponseEntity.ok(carwashes);
    }

    // 세차장 추가
    @PostMapping
    public ResponseEntity<String> addCarwash(@RequestBody CarWash carwash) {
        managerService.saveCarwash(carwash);
        return ResponseEntity.ok("세차장이 성공적으로 추가되었습니다.");
    }

    // 세차장 수정
    @PutMapping("/{washId}")
    public ResponseEntity<String> updateCarwash(@PathVariable String washId, @RequestBody CarWash carwash) {
        carwash.setWashId(washId); // URL에서 받은 ID를 설정
        managerService.saveCarwash(carwash);
        return ResponseEntity.ok("세차장 정보가 성공적으로 수정되었습니다.");
    }

    // 세차장 삭제
    @DeleteMapping("/{washId}")
    public ResponseEntity<String> deleteCarwash(@PathVariable String washId) {
        managerService.deleteCarwash(washId);
        return ResponseEntity.ok("세차장이 성공적으로 삭제되었습니다.");
    }

    // 테스트용 메서드: 세션에 userId 설정
//    @GetMapping("/test-login")
//    public ResponseEntity<String> testLogin(HttpSession session) {
//        session.setAttribute("userId", "Operator"); // 테스트용 ID 설정
//        return ResponseEntity.ok("Test user logged in with ID: Operator");
//    }
}
