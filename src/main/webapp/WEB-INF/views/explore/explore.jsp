<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta name="sessionMember" content="${sessionScope.member.id}">
    <meta name="contextPath" content="${contextPath}">
</head>
<body>
    <main class="ui-search-map">
        <div class="map-container">
            <section class="recommend-section">
                <div class="search-filter-container">
					<div class="field ">
						<div class="ui-input">
							<div class="input outlined">
								<input type="text" id="search" class="search-bar" placeholder="세차장을 검색하세요">
							</div>
						</div>
					</div>
                    <div class="filter-dropdown">
                        <button class="ux-button contained primary filter-button">
							<span class="label">
								필터 ▼
							</span>
						</button>
                        <div class="filter-options">
							<div class="ui-input">
								<div class="input">
									<label class="custom-radio custom-checkbox">
										<input type="checkbox" value="자동세차">
										<span class="icon"></span>
										<span class="label">자동세차</span>
									</label>
									<label class="custom-radio custom-checkbox">
										<input type="checkbox" value="전문세차">
										<span class="icon"></span>
										<span class="label">전문세차</span>
									</label>
									<label class="custom-radio custom-checkbox">
										<input type="checkbox" value="출장세차">
										<span class="icon"></span>
										<span class="label">출장세차</span>
									</label>
									<label class="custom-radio custom-checkbox">
										<input type="checkbox" value="셀프세차">
										<span class="icon"></span>
										<span class="label">셀프세차</span>
									</label>
								</div>
							</div>
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
			<div class="popup-header">
				<h5 id="popup-carwash-name">데이터없음</h5>
				<button id="close-review-popup" class="ux-button icon-menu popup-close-button">
					<span class="icon"><i class="fa-solid fa-xmark"></i></span><span class="label">팝업 닫기</span>
				</button>
			</div>
			<div class="popup-content">
				<div class="group">
					<div class="popup-carwash-image-wrap">
						<img id="popup-carwash-image" src="" alt="세차장 이미지" class="popup-image" />
					</div>
					<div class="popup-carwash-info-wrap">
						<p><span id="popup-carwash-address">데이터없음</span></p>
						<p class="desc"><span id="popup-carwash-phone">데이터없음</span></p>
					</div>
					<div class="ux-button-bar has-submit-form">
						<button id="popup-detail-button" class="ux-button outlined" aria-label="상세 보기"> <span class="label">상세 보기 </span></button>
						 <form action="${contextPath}/carwash/reservationStep1.do" method="post">
							<input type="hidden" id="popup-wash-id" name="washId" value="">
							<input type="hidden" id="popup-wash-name" name="washName" value="">
							<button type="submit" class="ux-button contained primary"> <span class="label">예약하기</span> </button>
						</form>
					</div>
				</div>
				<!-- 리뷰 섹션 -->
				<div class="group" id="review-section">
					<h6>리뷰</h6>
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
