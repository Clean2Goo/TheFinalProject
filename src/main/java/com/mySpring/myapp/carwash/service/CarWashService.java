package com.mySpring.myapp.carwash.service;

import com.mySpring.myapp.carwash.dao.CarWashDAO;
import com.mySpring.myapp.carwash.model.CarWash;
import com.mySpring.myapp.carwash.repository.CarWashRepository;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.http.*;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

@Service
public class CarWashService {

    private static final Logger logger = Logger.getLogger(CarWashService.class.getName());

    @Autowired
    private CarWashRepository carWashRepository;

    @Autowired
    private RestTemplate restTemplate;
    
    //beaver 
    @Autowired 
    private CarWashDAO carWashDAO;

    // 모든 세차장 데이터를 조회
    public List<CarWash> getAllCarWashes() {
        logger.info("Fetching all car washes from database.");
        return carWashRepository.findAll();
    }

    // 주소로 세차장 검색
    public List<CarWash> findCarWashesByAddr(String addr) {
        logger.info("Searching for car washes with address containing: " + addr);
        return carWashRepository.findByWashAddrContaining(addr);
    }

	//beaver 추가 강남구 특정 조건 세차장 조회
	 public List<CarWash> selectCarWashesInGangnam() {
        return carWashDAO.selectCarWashesInGangnam();
    }
	//beaver 추가 해당 아이디 세차장 정보 조회
	public CarWash selectCarWasheById(int washId) {
        return carWashDAO.selectCarWasheById(washId); //
    }

    // 카카오 API로 데이터 요청
    public String fetchDataFromKakao(String apiUrl, String apiKey) {
        try {
            logger.info("Fetching data from Kakao API with URL: " + apiUrl);
            HttpHeaders headers = new HttpHeaders();
            headers.set("Authorization", "KakaoAK " + apiKey);
            HttpEntity<String> entity = new HttpEntity<>(headers);

            ResponseEntity<String> response = restTemplate.exchange(apiUrl, HttpMethod.GET, entity, String.class);

            if (response.getStatusCode() == HttpStatus.OK) {
                logger.info("Successfully fetched data from Kakao API.");
                return response.getBody(); // JSON 데이터를 반환
            } else {
                logger.severe("Failed to fetch data from Kakao API. Status: " + response.getStatusCode());
                throw new RuntimeException("Failed to fetch data from Kakao API: " + response.getStatusCode());
            }
        } catch (Exception e) {
            logger.severe("An error occurred while fetching data from Kakao API: " + e.getMessage());
            throw new RuntimeException("An error occurred while fetching data from Kakao API.", e);
        }
    }

    // 카카오 API 응답을 받아 세차장 데이터를 저장
    public void saveCarWashesFromKakao(String jsonResponse) throws Exception {
        logger.info("Saving car washes from Kakao API response.");
        ObjectMapper objectMapper = new ObjectMapper();
        JsonNode root = objectMapper.readTree(jsonResponse);
        JsonNode documents = root.get("documents");

        if (documents != null && documents.isArray()) {
            for (JsonNode doc : documents) {
                try {
                    CarWash carWash = new CarWash();
                    carWash.setWashId(doc.get("id").asText(""));
                    carWash.setUserId("defaultUser");
                    carWash.setWashName(doc.get("place_name").asText(""));

                    String washAddr = doc.hasNonNull("road_address_name")
                            ? doc.get("road_address_name").asText()
                            : (doc.hasNonNull("address_name") ? doc.get("address_name").asText() : "주소 정보 없음");
                    carWash.setWashAddr(washAddr != null && !washAddr.isEmpty() ? washAddr : "주소 정보 없음");

                    carWash.setWashLat(doc.get("y").asDouble());
                    carWash.setWashLng(doc.get("x").asDouble());
                    carWash.setWashInfo("카카오 API에서 가져온 데이터");
                    carWash.setWashTel(doc.hasNonNull("phone") ? doc.get("phone").asText("") : "미등록");
                    carWash.setWashType("일반");
                    carWash.setWashableCar("승용차, SUV");
                    carWash.setOpenHrs("09:00-18:00");
                    carWash.setMaxCar(10);
                    carWash.setVacancy(5);
                    carWash.setNewYn("Y");
                    carWash.setRvwCount(0);
                    carWash.setRating(new BigDecimal("0.0"));
                    carWash.setCrtDate(new java.sql.Date(System.currentTimeMillis()));

                    List<String> imageUrls = fetchAllImagesFromKakao(carWash.getWashAddr() + " 세차장");
                    if (!imageUrls.isEmpty()) {
                        carWash.setWashImg(imageUrls.get(0)); // 첫 번째 이미지를 기본값으로 설정
                    } else {
                        carWash.setWashImg("/resources/assets/images/default_car_wash.jpg");
                    }

                    if (carWash.getWashId() != null && !carWashRepository.existsByWashId(carWash.getWashId())) {
                        carWashRepository.save(carWash);
                    }
                } catch (Exception e) {
                    logger.severe("Error saving car wash: " + e.getMessage());
                }
            }
        } else {
            logger.warning("No documents found in Kakao API response.");
        }
    }

    // WASHADDR에 '세차장'을 붙여 이미지 검색 및 업데이트
    public void fetchImagesForWashAddrWithSuffix() {
        logger.info("Fetching images for all WASHADDRs from the database.");
        List<CarWash> carWashes = carWashRepository.findAll();

        for (CarWash carWash : carWashes) {
            try {
                String query = carWash.getWashAddr() + " 세차장";
                List<String> imageUrls = fetchAllImagesFromKakao(query);

                if (!imageUrls.isEmpty()) {
                    carWash.setWashImg(imageUrls.get(0));
                    carWashRepository.save(carWash);
                }
            } catch (Exception e) {
                logger.severe("Error fetching image for WASHADDR: " + carWash.getWashAddr() + ". Error: " + e.getMessage());
            }
        }
    }

    // 카카오 이미지 검색 API를 사용하여 네이버 블로그의 이미지 URL만 가져오기
    public List<String> fetchAllImagesFromKakao(String query) {
        List<String> imageUrls = new ArrayList<>();

        try {
            logger.info("Fetching images for query: " + query);
            String apiKey = "2faa154995bdeadd1c4e0be55aa11b75";

            UriComponentsBuilder uriBuilder = UriComponentsBuilder.fromHttpUrl("https://dapi.kakao.com/v2/search/image")
                .queryParam("query", query)
                .queryParam("sort", "accuracy")
                .queryParam("size", "30");

            HttpHeaders headers = new HttpHeaders();
            headers.set("Authorization", "KakaoAK " + apiKey);
            HttpEntity<String> entity = new HttpEntity<>(headers);

            ResponseEntity<String> response = restTemplate.exchange(uriBuilder.toUriString(), HttpMethod.GET, entity, String.class);

            if (response.getStatusCode() == HttpStatus.OK) {
                ObjectMapper objectMapper = new ObjectMapper();
                JsonNode root = objectMapper.readTree(response.getBody());
                JsonNode documents = root.get("documents");

                if (documents != null && documents.isArray()) {
                    for (JsonNode doc : documents) {
                        String imageUrl = doc.get("image_url").asText("");
                        String displaySitename = doc.hasNonNull("display_sitename") ? doc.get("display_sitename").asText("") : "";

                        // 필터 조건: 네이버 블로그 및 이미지 크기 체크
                        if (displaySitename.contains("네이버블로그") && imageUrl.contains("jpg")) {
                            imageUrls.add(imageUrl);
                        } else {
                            logger.info("Filtered out image from: " + displaySitename);
                        }
                    }
                }
            }
        } catch (Exception e) {
            logger.severe("An error occurred while fetching images: " + e.getMessage());
        }

        // 결과가 없을 경우 기본 이미지 추가
        if (imageUrls.isEmpty()) {
            imageUrls.add("/resources/assets/images/default_car_wash.jpg");
        }

        return imageUrls;
    }



}
