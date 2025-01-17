<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"   isELIgnored="false"  %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
 <c:set var="contextPath"  value="${pageContext.request.contextPath}"  />


<%
  request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>마이 페이지</title>
  <script src="http://code.jquery.com/jquery-latest.js"></script>
  <link rel="stylesheet" href="${contextPath}/resources/assets/css/myPage.css">
</head>
<body>
	<main>
		<section class="mypage-container">
            <h2>나의 예약 목록</h2>

            <!-- 예약 리스트 테이블 -->
            <table class="reservation-table">
                <thead>
                    <tr>
                        <th>예약 ID</th>
                        <th>서비스 종류</th>
                        <th>예약 시간</th>
                        <th>상태</th>
                        <th>취소</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- 예약 정보 반복 출력 -->
                    <c:forEach var="reservation" items="${reservations}">
                        <tr>
                            <td>${reservation.reservationid}</td>
                            <td>${reservation.servicetype}</td>
                            <td>${reservation.reservationtime}</td>
                            <td>${reservation.status}</td>
                            <td>
                                <form action="cancelReservation.jsp" method="POST">
                                    <input type="hidden" name="reservation_id" value="${reservation.reservationid}">
                                    <button type="submit" class="cancel-btn" ${reservation.status eq '취소됨' ? 'disabled' : ''}>취소</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </section>
	</main>
</body>
</html>