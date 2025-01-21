<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%request.setCharacterEncoding("UTF-8");%>

<main class="ui-subpage">
	<section>
		<article>
			<div class="h3-title">
				<h3>예약내역</h3>
			</div>
			<div class="content">
				<div class="h4">
					<div class="h4-title">
						<h4>이용중인 예약</h4>
					</div>
					<div class="content">
						<div class="table data-grid">
							<table>
								<caption>이용중인 예약 테이블</caption>
								<colgroup>
									<col width="120px">
									<col width="18.5%">
									<col width="18.5%">
									<col width="20.5%">
									<col width="auto">
									<col width="22.5%">
									<!-- <col width="auto"> -->
								</colgroup>
								<thead>
									<tr>
										<th scope="col">예약번호</th>
										<th scope="col">세차장명</th>
										<th scope="col">세차일시</th>
										<th scope="col">세차옵션</th>
										<th scope="col">세차전문가</th>
										<th scope="col">예약상태</th>
										<!-- <th scope="col">예약일시</th> -->
									</tr>
								</thead>
								<tbody>
									<c:if test="${empty reservations}">
										<tr>
											<td colspan="8" style="text-align: center;"><p>예약내역이 없습니다.</p></td>
										</tr>
									</c:if>
									<c:forEach var="reservation" items="${reservations}">
										<c:if test="${reservation.status == '예약중'}">
											<tr>
												<td>${reservation.rsvnId}</td>
												<td>${reservation.washName}</td>
												<td>
													${reservation.fmtRsvnDate} ${reservation.rsvnTime}
												</td>
												<td>
													<c:choose>
														<c:when test="${empty reservation.carTypeCost}">
															${reservation.washType}
														</c:when>
														<c:otherwise>
															${reservation.washType} - ${reservation.carTypeCost}
														</c:otherwise>
													</c:choose>
												</td>
												<td>
													<c:choose>
														<c:when test="${empty reservation.userName}">
															선택안함
														</c:when>
														<c:otherwise>
															${reservation.userName}
														</c:otherwise>
													</c:choose>
												</td>
												<td>
												 	<div class="table-flex-box">
														${reservation.status}
														<c:if test="${reservation.status == '예약중'}">
															<form action="${contextPath}/myPage/cancelReservation.do" method="POST">
															    <input type="hidden" name="rsvnId" value="${reservation.rsvnId}"/>
															    <button class="ux-button button-table contained cancel" type="submit">
															    	<span class="label">예약 취소</span></button>
															</form>
													    </c:if>
												 	</div>
												 </td>
												<!-- <td>
													<fmt:formatDate value="${reservation.crtDate}" pattern="yyyy년 MM월 dd일 HH:mm:ss" />
												</td> -->
											</tr>
										</c:if>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<div class="h4">
					<div class="h4-title">
						<h4>지난 이용내역</h4>
					</div>
					<div class="content">
						<div class="table data-grid">
							<table>
								<caption>지난 이용내역 테이블</caption>
								<colgroup>
									<col width="120px">
									<col width="18.5%">
									<col width="18.5%">
									<col width="20.5%">
									<col width="auto">
									<col width="22.5%">
									<!-- <col width="auto"> -->
								</colgroup>
								<thead>
									<tr>
										<th scope="col">예약번호</th>
										<th scope="col">세차장명</th>
										<th scope="col">세차일시</th>
										<th scope="col">세차옵션</th>
										<th scope="col">세차전문가</th>
										<th scope="col">예약상태</th>
										<!-- <th scope="col">예약일시</th> -->
									</tr>
								</thead>
								<tbody>
									<c:if test="${empty reservations}">
										<tr>
											<td colspan="8" style="text-align: center;"><p>예약내역이 없습니다.</p></td>
										</tr>
									</c:if>
									<c:forEach var="reservation" items="${reservations}">
										<c:if test="${reservation.status != '예약중'}">
											<tr>
												<td>${reservation.rsvnId}</td>
												<td>${reservation.washName}</td>
												<td>
													${reservation.fmtRsvnDate} ${reservation.rsvnTime}
												</td>
												<td>
													<c:choose>
														<c:when test="${empty reservation.carTypeCost}">
															${reservation.washType}
														</c:when>
														<c:otherwise>
															${reservation.washType} - ${reservation.carTypeCost}
														</c:otherwise>
													</c:choose>
												</td>
												<td>
													<c:choose>
														<c:when test="${empty reservation.userName}">
															선택안함
														</c:when>
														<c:otherwise>
															${reservation.userName}
														</c:otherwise>
													</c:choose>
												</td>
												<td>${reservation.status}</td>
												<!-- <td>
													<fmt:formatDate value="${reservation.crtDate}" pattern="yyyy년 MM월 dd일 HH:mm:ss" />
												</td> -->
											</tr>
										</c:if>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</article>
	</section>
</main>