<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<% request.setCharacterEncoding("UTF-8"); %>
<c:set var="hasActiveReservation" value="false" /><!-- //beaver 이용중인 내역 초기화  -->
<c:set var="hasPastReservation" value="false" /> <!-- //beaver 지난 이용내역 초기화 -->

<!DOCTYPE html>
<head>
    <meta name="sessionMember" content="${sessionScope.member.id}">
</head>
<body>
<main class="ui-subpage">
	<section>
		<article>
			<div class="h3-title col">
				<h3>예약내역</h3>
				<div class="ui-page-desc">
					<div class="middot-list">
						<ul>
							<li>진행중인 예약과 지난 예약내역을 확인 할 수 있습니다.</li>
							<li>이용이 종료된 예약건에 대해 리뷰를 작성 할 수 있으며, 작성한 리뷰는 리뷰내역에서 확인 가능합니다.</li>
						</ul>
					</div>
				</div>
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
									<col class="col-8">
									<col class="col-16">
									<col class="col-16">
									<col class="col-auto">
									<!-- <col class="auto"> -->
									<col class="col-auto">
								</colgroup>
								<thead>
									<tr>
										<th scope="col">No.</th>
										<th scope="col">세차장명</th>
										<th scope="col">세차일시</th>
										<th scope="col">세차옵션</th>
										<!-- <th scope="col">세차전문가</th> -->
										<th scope="col">예약상태</th>
									</tr>
								</thead>
								<tbody>
									<c:if test="${empty reservations}">
										<tr>
											<td colspan="5" style="text-align: center;"><p>예약내역이 없습니다.</p></td>
										</tr>
									</c:if>
									<c:if test="${not empty reservations}">
										<c:forEach var="reservation" items="${reservations}">
											<c:if test="${reservation.status == '예약중'}">
												<c:set var="hasActiveReservation" value="true" />
												<tr>
													<td>${reservation.rsvnId}</td>
													<td>${reservation.washName}</td>
													<td>${reservation.fmtRsvnDate} ${reservation.rsvnTime}</td>
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
													<!-- <td>
														<c:choose>
															<c:when test="${empty reservation.userName}">
																선택안함
															</c:when>
															<c:otherwise>
																${reservation.userName}
															</c:otherwise>
														</c:choose>
													</td> -->
													<td>
													 	<div class="table-flex-box">
															${reservation.status}
															<c:if test="${reservation.status == '예약중'}">
																<form action="${contextPath}/myPage/cancelReservation.do" method="POST" onsubmit="return confirmCancellation();">
																	<input type="hidden" name="rsvnId" value="${reservation.rsvnId}"/>
																	<button class="ux-button button-table contained cancel" type="submit">
																		<span class="label">예약 취소</span>
																	</button>
																</form>
														    </c:if>
													 	</div>
													 </td>
												</tr>
											</c:if>
										</c:forEach>
										<c:if test="${!hasActiveReservation}">
												<tr>
													<td colspan="5" style="text-align: center;"><p> 최근 예약내역이 없습니다.</p></td>
												</tr>
											</c:if>
										</c:if>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<!--//beaver 지난 이용내역 섹션: 예약건이 하나라도 있을 경우에만 출력 -->
				<c:if test="${not empty reservations}">
					<div class="h4">
						<div class="h4-title">
							<h4>지난 이용내역</h4>
						</div>
						<div class="content">
							<div class="table data-grid">
								<table>
									<caption>지난 이용내역 테이블</caption>
									<colgroup>
										<col class="col-8">
										<col class="col-16">
										<col class="col-16">
										<col class="col-auto">
										<!-- <col class="auto"> -->
										<col class="col-auto">
									</colgroup>
									<thead>
										<tr>
											<th scope="col">No.</th>
											<th scope="col">세차장명</th>
											<th scope="col">세차일시</th>
											<th scope="col">세차옵션</th>
											<!-- <th scope="col">세차전문가</th> -->
											<th scope="col">예약상태</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="reservation" items="${reservations}">
											<c:if test="${reservation.status != '예약중'}">
												<!-- 지난 예약이 있을 경우 -->
												<c:set var="hasPastReservation" value="true" />
												<tr>
													<td>${reservation.rsvnId}</td>
													<td>${reservation.washName}</td>
													<td>${reservation.fmtRsvnDate} ${reservation.rsvnTime}</td>
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
													<!-- <td>
														<c:choose>
															<c:when test="${empty reservation.userName}">
																선택안함
															</c:when>
															<c:otherwise>
																${reservation.userName}
															</c:otherwise>
														</c:choose>
													</td> -->
													<td>
														<div class="table-flex-box">
															${reservation.status}
															<c:if test="${reservation.status == '이용완료'}">
																<button class="ux-button contained primary button-table review-button"
																	data-reservation-id2="${reservation.rsvnId}"
																	data-wash-name="${reservation.washName}">
																	<span class="label">리뷰 작성</span>
																</button>
															</c:if>
														</div>
													</td>
												</tr>
											</c:if>
										</c:forEach>
										<!-- 지난 예약이 없을 경우 -->
										<c:if test="${!hasPastReservation}">
											<tr>
												<td colspan="5" style="text-align: center;"><p>지난 예약내역이 없습니다.</p></td>
											</tr>
										</c:if>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</c:if>
			</div>
		</article>
	</section>
</main>

<!-- 리뷰 팝업 -->
<div id="review-popup" class="popup rsvn-review" style="display:none;">
	<div class="popup-container">
		<div class="popup-header">
			<div class="popup-title">
				<h5 id="popup-wash-name">리뷰 작성</h5>
			</div>
			<button id="close-review-popup" class="ux-button icon-menu popup-close-button">
				<span class="icon"><i class="fa-solid fa-xmark"></i></span><span class="label">팝업 닫기</span>
			</button>
		</div>
		<div class="popup-content">
			<ul id="review-list"></ul>
			<div id="review-pagination">
				<button id="prev-review-button" disabled>이전</button>
				<span id="review-page-info">1 / 1</span>
				<button id="next-review-button" disabled>다음</button>
			</div>
			<form class="ui-form write dialog" id="review-form">
				<input type="hidden" id="popup-reservation-id">
				<input type="hidden" id="popup-wash-id">
				<ul>
					<li>
						<div class="field ">
							<label class="label" for="review-content">내용</label>
							<div class="ui-input">
								<div class="input outlined">
									<textarea id="review-content" name="review-content" class="custom-textarea" placeholder="리뷰를 입력하세요"></textarea>
								</div>
							</div>
						</div>
					</li>
					<li>
						<div class="field">
							<label class="label">평점 선택</label>
							<div class="ui-input">
								<div class="input outlined">
									<select name="review-score" class="selectmenu" id="review-score">
										<option value="">점수 선택</option>
											<option value="1">1점</option>
											<option value="2">2점</option>
											<option value="3">3점</option>
											<option value="4">4점</option>
											<option value="5">5점</option>
									</select>
								</div>
							</div>
						</div>
					</li>
					<li>
						<div class="ux-button-bar">
							<button class="ux-button contained primary" type="submit"><span class="label">리뷰 저장</span></button>
						</div>
					</li>
				</ul>
			</form>
		</div>
	</div>
</div>

<script src="${contextPath}/resources/js/reservation.js"></script>
</body>
</html>