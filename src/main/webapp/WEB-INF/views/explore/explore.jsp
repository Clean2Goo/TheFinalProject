<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>WashWise - 세차장 탐색</title>
    <link rel="stylesheet" href="${contextPath}/resources/assets/css/explore.css"/>
    <meta name="sessionMember" content="${sessionScope.member.id}">
    <meta name="description" content="WashWise에서 세차장을 탐색하고 예약하세요.">
    <meta property="og:title" content="WashWise - 세차장 탐색">
    <meta name="contextPath" content="${contextPath}">
    
    <meta property="og:description" content="WashWise에서 세차장을 탐색하고 예약하세요.">
    <meta property="og:image" content="${contextPath}/resources/images/logo.png">
</head>
<body>

    <main class="ui-search-map">
        <div class="map-container">
            <section class="recommend-section">
                <h2>추천 세차장</h2>
                <div class="search-filter-container">
                    <input type="text" id="search" class="search-bar" placeholder="세차장을 검색하세요">
                    <div class="filter-dropdown">
                        <button class="filter-button">필터 ▼</button>
                        <div class="filter-options">
                            <label><input type="checkbox" value="자동세차"> 자동세차</label>
                            <label><input type="checkbox" value="전문세차"> 전문세차</label>
                            <label><input type="checkbox" value="출장세차"> 출장세차</label>
                            <label><input type="checkbox" value="셀프세차"> 셀프세차</label>
                        </div>
                    </div>
                </div>

                <!-- 추천 리스트 -->
                <div id="recommended-list"></div>

                <!-- 페이지네이션 버튼 -->
                <div id="pagination"></div>
            </section>

            <section class="map-section">
                <div id="map" style="width: 100%; height: 100%;"></div>
            </section>
        </div>

        <!-- 슬라이딩 팝업 -->
        <div id="sliding-popup" class="sliding-popup">
            <span class="close-btn">×</span>
            <img id="popup-carwash-image" src="" alt="세차장 이미지" class="popup-image" />
            <h3 id="popup-carwash-name">데이터없음</h3>
            <p><strong>주소:</strong> <span id="popup-carwash-address">데이터없음</span></p>
            <p><strong>전화번호:</strong> <span id="popup-carwash-phone">데이터없음</span></p>

            <div class="popup-buttons">
                 <form action="${contextPath}/carwash/reservationStep1.do" method="post">
            <input type="hidden" id="popup-wash-id" name="washId" value="">
            <input type="hidden" id="popup-wash-name" name="washName" value="">
            <button type="submit" class="reserve-button">예약하기</button>
        </form>
                <button id="popup-detail-button" class="detail-button" aria-label="상세 보기">상세 보기</button>
            </div>

            <!-- 리뷰 섹션 -->
            <div id="review-section">
                <h4>리뷰</h4>
                <!-- 리뷰 목록 -->
                <ul id="review-list">
                    <!-- 동적으로 추가될 리뷰 목록 -->
                </ul>

                <!-- 페이지네이션 -->
                <div id="review-pagination" class="pagination-container">
                    <button id="prev-review-button" class="pagination-button" disabled>이전</button>
                    <span id="review-page-info">1 / 1</span>
                    <button id="next-review-button" class="pagination-button" disabled>다음</button>
                </div>
            </div>
        </div>

        <!-- 상세 정보 컨테이너 -->
        <div id="detail-container" class="detail-container" style="display: none;">
            <!-- JavaScript에서 동적으로 내용을 렌더링합니다. -->
        </div>
    </main>

    <!-- Kakao 지도 API 및 JavaScript -->
    <script src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=7ab4aae6118318ec748c741c836d4e4c&libraries=services"></script>
    <script src="${contextPath}/resources/js/explore.js"></script>
</body>
</html>
