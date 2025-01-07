package com.mySpring.myapp.explore.service;

import org.springframework.stereotype.Service;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.mySpring.myapp.carwash.model.CarWash;
import com.mySpring.myapp.carwash.repository.CarWashRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
import org.springframework.web.util.UriComponentsBuilder;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Service
public class KakaoApiService {

    private static final Logger logger = LoggerFactory.getLogger(KakaoApiService.class);

    private final String kakaoApiKey = "2faa154995bdeadd1c4e0be55aa11b75";

    private final RestTemplate restTemplate = new RestTemplate();

    @Autowired
    private CarWashRepository carWashRepository;

    public void fetchAndSaveCarWashes(String keyword, double x, double y, int radius) throws Exception {
        // URL과 파라미터를 동적으로 생성
        String url = UriComponentsBuilder.fromHttpUrl("https://dapi.kakao.com/v2/local/search/keyword.json")
                .queryParam("page", 1)
                .queryParam("size", 15)
                .queryParam("sort", "accuracy")
                .queryParam("query", keyword)
                .queryParam("x", x)
                .queryParam("y", y)
                .queryParam("radius", radius)
                .build()
                .toUriString();

        // HTTP 헤더 설정
        HttpHeaders headers = new HttpHeaders();
        headers.set("Authorization", "KakaoAK " + kakaoApiKey);

        HttpEntity<Void> requestEntity = new HttpEntity<>(headers);

        try {
            // API 호출
            ResponseEntity<String> response = restTemplate.exchange(
                url,
                HttpMethod.GET,
                requestEntity,
                String.class
            );

            String jsonResponse = response.getBody();
            logger.info("Response: {}", jsonResponse);

            // 응답 데이터를 DB에 저장
            saveCarWashesFromResponse(jsonResponse);

        } catch (HttpClientErrorException e) {
            logger.error("HTTP Error: {}, Response Body: {}", e.getStatusCode(), e.getResponseBodyAsString());
            throw e;
        } catch (Exception e) {
            logger.error("Unexpected Error", e);
            throw e;
        }
    }

    private void saveCarWashesFromResponse(String jsonResponse) throws Exception {
        ObjectMapper objectMapper = new ObjectMapper();
        JsonNode root = objectMapper.readTree(jsonResponse);
        JsonNode documents = root.get("documents");

        if (documents != null && documents.isArray()) {
            for (JsonNode doc : documents) {
                try {
                    CarWash carWash = new CarWash();

                    carWash.setWashId(doc.get("id").asText());
                    carWash.setWashName(doc.get("place_name").asText());
                    carWash.setWashAddr(
                        doc.has("road_address_name") && !doc.get("road_address_name").isNull()
                            ? doc.get("road_address_name").asText()
                            : (doc.has("address_name") && !doc.get("address_name").isNull()
                                ? doc.get("address_name").asText()
                                : "주소 정보 없음")
                    );

                    carWash.setWashLat(Double.parseDouble(doc.get("y").asText()));
                    carWash.setWashLng(Double.parseDouble(doc.get("x").asText()));
                    carWash.setWashTel(doc.has("phone") && !doc.get("phone").isNull() ? doc.get("phone").asText() : "미등록");

                    // 주소 검증 후 저장
                    if (carWash.getWashAddr() == null || carWash.getWashAddr().equals("주소 정보 없음")) {
                        logger.warn("Car wash '{}' does not have a valid address. Skipping save.", carWash.getWashName());
                        continue; // 저장하지 않고 다음 데이터로 넘어감
                    }

                    if (!carWashRepository.existsByWashId(carWash.getWashId())) {
                        carWashRepository.save(carWash);
                        logger.info("Saved CarWash: {}", carWash.getWashName());
                    } else {
                        logger.info("CarWash already exists: {}", carWash.getWashName());
                    }
                } catch (Exception e) {
                    logger.error("Error saving car wash: ", e);
                }
            }
        } else {
            logger.warn("No car wash data found in API response.");
        }
    }
}
