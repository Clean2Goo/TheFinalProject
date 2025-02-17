<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% request.setCharacterEncoding("UTF-8"); %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<main>
	<section>
		<article>
			<div class="h3-title">
				<h3>세차장 예약 관리</h3>
			</div>
			<div class="content">
				<div class="data-grid">
					<table class="reservation-table">
						<caption>세차장 예약자 테이블</caption>
						<colgroup>

						</colgroup>
						<thead>
							<tr>
								<th>예약 ID</th>
								<th>예약자 ID</th>
								<th>세차장명</th>
								<th>예약일시</th>
								<th>세차옵션</th>
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
									<td><fmt:formatDate value="${reservation.rsvnDate}" pattern="yyyy-MM-dd" /> / ${reservation.rsvnTime}</td>
									<td>${reservation.washType} - ${reservation.carTypeCost}</td>
									<td id="status-${reservation.rsvnId}">${reservation.status}</td>
									<td>
										<c:if test="${reservation.status == '예약중'}">
											<div class="table-flex-box">
												<button type="button" class="ux-button contained button-table primary update-status" data-rsvnid="${reservation.rsvnId}" data-status="이용완료">이용완료</button>
												<button type="button" class="ux-button contained button-table remove update-status" data-rsvnid="${reservation.rsvnId}" data-status="예약취소">예약취소</button>
											</div>
										</c:if>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</article>
	</section>
</main>


    <script src="${contextPath}/resources/js/adminReservations.js"></script>