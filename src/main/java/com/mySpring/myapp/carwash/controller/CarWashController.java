package com.mySpring.myapp.carwash.controller;

import com.mySpring.myapp.carwash.model.CarWash;
import com.mySpring.myapp.carwash.model.Staff;
import com.mySpring.myapp.carwash.service.CarWashService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//beaver: json,jsp 모두 활용 가능한 컨트롤러로 변경 | 기존  @RestController, @RequestMapping("/api") 제거
@Controller
public class CarWashController {

    @Autowired
    private CarWashService carWashService;

    // 모든 세차장 데이터를 JSON 형식으로 반환 // beaver: @Controller적용으로 인한 코드 수정
    @GetMapping("/api/carwashes")
    public ResponseEntity<List<CarWash>> getAllCarWashes() {
        List<CarWash> carWashes = carWashService.getAllCarWashes();
        return ResponseEntity.ok(carWashes);
    }

    // 카카오 API를 통해 세차장 데이터를 가져오고 데이터베이스에 저장 //beaver: /api/ 경로삽입
    @RequestMapping(value = "/api/fetch-carwashes", method = {RequestMethod.GET, RequestMethod.POST})
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

    // 특정 세차장을 주소로 검색하여 반환 //beaver: /api/ 경로삽입
    @GetMapping("/api/search-carwash")
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

    // explore.do 페이지 접속 시 자동으로 이미지와 데이터를 갱신 //beaver: /api/ 경로삽입
    @GetMapping("/api/update-images")
    public ResponseEntity<String> updateImagesForWashAddrWithSuffix() {
        try {
            carWashService.fetchImagesForWashAddrWithSuffix();
            return ResponseEntity.ok("WASHADDR를 기반으로 모든 이미지가 성공적으로 업데이트되었습니다.");
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(500).body("이미지 업데이트 중 오류가 발생했습니다: " + e.getMessage());
        }
    }

	//beaver 해당 아이디 세차장 정보 조회
	@RequestMapping(value = "/carwash/carWashDetail.do", method = RequestMethod.GET)
	public ModelAndView carWashDetail(@RequestParam("washId") int washId, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		CarWash carWash = carWashService.selectCarWasheById(washId);
		
		if (carWash == null) {
			throw new Exception("Carwash detail not found for ID: " + washId);
		}
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		mav.addObject("carWashDetail", carWash);
		
	   // 스태프 리스트 추가
	    List<Staff> staffList = carWash.getStaffList();
	    mav.addObject("staffList", staffList);
	    
		System.out.println("staffList" + staffList );
		System.out.println("carWashDetail.do?washId=" + washId + " 데이터 조회");
		return mav;
	}


}