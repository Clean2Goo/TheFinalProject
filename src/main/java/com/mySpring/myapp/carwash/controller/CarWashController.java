package com.mySpring.myapp.carwash.controller;

import com.mySpring.myapp.carwash.model.CarWash;
import com.mySpring.myapp.carwash.service.CarWashService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.net.URLEncoder;
import java.util.List;

@RestController
@RequestMapping("/api")
public class CarWashController {

    @Autowired
    private CarWashService carWashService;

    // 모든 세차장 데이터를 JSON 형식으로 반환
    @GetMapping("/carwashes")
    public List<CarWash> getAllCarWashes() {
        return carWashService.getAllCarWashes();
    }

    // 카카오 API를 통해 세차장 데이터를 가져오고 데이터베이스에 저장
    @RequestMapping(value = "/fetch-carwashes", method = {RequestMethod.GET, RequestMethod.POST})
    public ResponseEntity<String> fetchAndSaveCarWashes(@RequestParam String query) {
        try {
            String apiUrl = "https://dapi.kakao.com/v2/local/search/keyword.json?query=" + URLEncoder.encode(query, "UTF-8");
            String apiKey = "2faa154995bdeadd1c4e0be55aa11b75";

            String jsonResponse = carWashService.fetchDataFromKakao(apiUrl, apiKey);
            if (jsonResponse != null) {
                carWashService.saveCarWashesFromKakao(jsonResponse);
                return ResponseEntity.ok("카카오 API 데이터를 성공적으로 가져와 저장했습니다.");
            } else {
                return ResponseEntity.status(500).body("카카오 API 데이터 가져오기에 실패했습니다.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(500).body("오류가 발생했습니다: " + e.getMessage());
        }
    }

    // 특정 세차장을 주소로 검색하여 반환
    @GetMapping("/search-carwash")
    public ResponseEntity<?> searchCarWashByAddr(@RequestParam String addr) {
        try {
            List<CarWash> carWashes = carWashService.findCarWashesByAddr(addr);
            if (carWashes.isEmpty()) {
                return ResponseEntity.ok("해당 주소의 세차장을 찾을 수 없습니다.");
            }
            return ResponseEntity.ok(carWashes);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(500).body("오류가 발생했습니다: " + e.getMessage());
        }
    }

    // explore.do 페이지 접속 시 자동으로 이미지와 데이터를 갱신
    @GetMapping("/update-images")
    public ResponseEntity<String> updateImagesForWashAddrWithSuffix() {
        try {
            carWashService.fetchImagesForWashAddrWithSuffix();
            return ResponseEntity.ok("WASHADDR를 기반으로 모든 이미지가 성공적으로 업데이트되었습니다.");
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(500).body("이미지 업데이트 중 오류가 발생했습니다: " + e.getMessage());
        }
    }
}