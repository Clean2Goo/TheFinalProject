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
    <meta name="contextPath" content="${pageContext.request.contextPath}">
    <title>내 리뷰</title>
    <link rel="stylesheet" href="${contextPath}/resources/assets/css/myReviews.css"/>
</head>
<body>
    <main>
        <h1>내 리뷰 관리</h1>
        <section id="review-list-container">
            <table>
                <thead>
                    <tr>
                        <th>세차장 이름</th>
                        <th>리뷰 내용</th>
                        <th>평점</th>
                        <th>작성일</th>
                        <th>관리</th>
                    </tr>
                </thead>
                <tbody id="review-list">
                    <!-- JavaScript로 동적 렌더링 -->
                </tbody>
            </table>
        </section>
    </main>

    <!-- 리뷰 수정 모달 -->
    <div id="edit-modal" class="modal">
        <div class="modal-content">
            <span id="close-edit-modal" class="close">&times;</span>
            <h2>리뷰 수정</h2>
            <form id="edit-form">
                <label for="edit-content">리뷰 내용:</label>
                <textarea id="edit-content" rows="4"></textarea>
                <label for="edit-score">평점 (1~5):</label>
                <input id="edit-score" type="number" min="1" max="5"/>
                <button type="submit">저장</button>
            </form>
        </div>
    </div>

    <script src="${contextPath}/resources/js/myReviews.js"></script>
</body>
</html>
