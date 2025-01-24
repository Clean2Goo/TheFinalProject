<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
    <meta name="contextPath" content="${pageContext.request.contextPath}">
    <meta charset="UTF-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/manager.css"/>
    <title>세차장 관리</title>
</head>
<body>
    <main>
        <div>
            <!-- 추가 버튼 -->
            <button id="add-carwash-btn">세차장 추가</button>

            <!-- 세차장 목록 -->
            <table border="1">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>세차장 이름</th>
                        <th>주소</th>
                        <th>전화번호</th>
                        <th>관리</th>
                    </tr>
                </thead>
                <tbody id="carwash-list">
                    <!-- JavaScript로 동적으로 채워질 내용 -->
                </tbody>
            </table>
        </div>

        <!-- 세차장 수정/추가 모델 -->
        <div id="carwash-model" class="model" style="display: none;">
            <div class="model-content">
                <span class="close-btn">×</span>
                <h2 id="model-title">세차장 정보 수정</h2>
                <form id="carwash-form">
    <input type="hidden" id="carwash-id">

    <label for="carwash-name">세차장 이름:</label>
    <input type="text" id="carwash-name" required>

    <label for="carwash-address">주소:</label>
    <input type="text" id="carwash-address" required>

    <label for="carwash-lat">위도 (Latitude):</label>
    <input type="text" id="carwash-lat" placeholder="37.5665" required>

    <label for="carwash-lng">경도 (Longitude):</label>
    <input type="text" id="carwash-lng" placeholder="126.9780" required>

    <label for="carwash-info">세차장 설명:</label>
    <textarea id="carwash-info" rows="4" required></textarea>

    <label for="carwash-image">이미지 URL:</label>
    <input type="text" id="carwash-image">

    <label for="carwash-phone">전화번호:</label>
    <input type="text" id="carwash-phone" required>

    <label for="carwash-hours">운영 시간:</label>
    <input type="text" id="carwash-hours" required>

    <label for="carwash-type">세차 유형:</label>
    <input type="text" id="carwash-type" placeholder="예: 기계 세차, 셀프 세차" required>

    <button type="submit" id="save-carwash-btn">저장</button>
</form>

            </div>
        </div>
    </main>

    <!-- JavaScript 파일 -->
    <script src="${pageContext.request.contextPath}/resources/js/manager.js"></script>
</body>
</html>
