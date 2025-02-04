<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>세차장 예약 관리</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/adminReservations.css">
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
                    <th>취소 여부</th>
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
                        <td>${reservation.status}</td>
                        <td>${reservation.cancelYn == 'Y' ? '취소됨' : '정상'}</td>
                        <td>
                            <button onclick="updateStatus('${reservation.rsvnId}', '이용완료')">이용완료</button>
                            <button onclick="cancelReservation('${reservation.rsvnId}')">예약 취소</button>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <script src="${pageContext.request.contextPath}/resources/js/adminReservations.js"></script>
</body>
</html>
