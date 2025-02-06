<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% request.setCharacterEncoding("UTF-8"); %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>리뷰 관리</title>
    <link rel="stylesheet" href="${contextPath}/resources/assets/css/adminReview.css">
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: center;
        }
        th {
            background-color: #f4f4f4;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>리뷰 관리</h1>
        <table id="reviewTable">
            <thead>
                <tr>
                    <th>작성자 ID</th>
                    <th>세차장 이름</th>
                    <th>리뷰 내용</th>
                    <th>리뷰 점수</th>
                    <th>작성일</th>
                </tr>
            </thead>
            <tbody>
                <!-- JS로 데이터가 채워질 예정 -->
            </tbody>
        </table>
    </div>

    <script src="${contextPath}/resources/js/adminReview.js"></script>
</body>
</html>
