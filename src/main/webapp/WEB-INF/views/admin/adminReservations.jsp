<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% request.setCharacterEncoding("UTF-8"); %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>세차장 예약 관리</title>
    <link rel="stylesheet" href="${contextPath}/resources/assets/css/adminReservations.css">
    <style>
        .reservation-table {
            width: 100%;
            border-collapse: collapse;
        }
        .reservation-table th, .reservation-table td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: center;
        }
        .reservation-table th {
            background-color: #f4f4f4;
        }
        .btn {
            padding: 5px 10px;
            cursor: pointer;
            border: none;
            border-radius: 4px;
        }
        .btn.complete { background-color: #4CAF50; color: white; }
        .btn.cancel { background-color: #f44336; color: white; }
    </style>
</head>
<body>
    <div class="container">
        <h1>세차장 예약 관리</h1>
        <table class="reservation-table">
            <thead>
                <tr>
                    <th>예약 ID</th>
                    <th>사용자 ID</th>
                    <th>세차장명</th>
                    <th>세차 타입</th>
                    <th>예약 날짜</th>
                    <th>예약 시간</th>
                    <th>차량 유형/비용</th>
                    <th>상태</th>
                    <th>관리</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="reservation" items="${reservations}">
                    <tr>
                        <td>${reservation.rsvnId}</td>
                        <td>${reservation.userId}</td>
                        <td>${reservation.washName}</td>
                        <td>${reservation.washType}</td>
                        <td><fmt:formatDate value="${reservation.rsvnDate}" pattern="yyyy-MM-dd" /></td>
                        <td>${reservation.rsvnTime}</td>
                        <td>${reservation.carTypeCost}</td>
                        <td id="status-${reservation.rsvnId}">${reservation.status}</td>
                        <td>
                            <c:if test="${reservation.status == '예약중'}">
						        <button type="button" class="update-status" data-rsvnid="${reservation.rsvnId}" data-status="이용완료">이용완료</button>
						        <button type="button" class="update-status" data-rsvnid="${reservation.rsvnId}" data-status="예약취소">예약취소</button>
						    </c:if>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <script src="${contextPath}/resources/js/adminReservations.js"></script>
</body>
</html>