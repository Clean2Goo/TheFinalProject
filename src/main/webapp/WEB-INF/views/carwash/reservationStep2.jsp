<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%request.setCharacterEncoding("UTF-8");%>

<main class="ui-reservation">
	<section>
		<article>
			<div class="h3-title">
				<div class="ui-stepper">
					<ol>
						<li>
							<span class="icon"></span><span class="label">Step01. 세차 옵션 선택</span>
						</li>
						<li class="current">
							<span class="icon"></span><span class="label">Step02. 선택 옵션 확인</span>
						</li>
						<li>
							<span class="icon"></span><span class="label">Step03. 예약 완료</span>
						</li>
					</ol>
				</div>
				<h3 class="tac">아래 선택 사항으로<br/> 예약을 진행 하시겠습니까?</h3>

				<div class="posa">
					<h6><em>확인용 : 개발완료시 삭제</em></h6>
					<p>선택한 세차장 ID: ${washId}</p>
					<p>선택한 세차장명: ${carWashDetail.washName}</p>
					<p>유저 ID: ${userId}</p>
					<p>유저 네임: ${member.name}</p>
					<p>세차유형: ${washType}</p>
					<p>세차옵션: ${carTypeCost}</p>
					<p>세차시간: ${rsvnTime}</p>
					<p>직원 ID (작업보류): ${staffId}</p>
				</div>
			</div>
			<div class="content">
				<div class="custom-box">
					<div class="dl-list">
						<dl>
							<dt>세차장명</dt><dd><strong>${washName}</strong></dd>
							<dt>예약자명</dt><dd><strong>${member.name}</strong></dd>
							<dt>세차일시</dt><dd><strong><em>${rsvnDate} / ${rsvnTime}</em></strong></dd>
							<dt>세차유형</dt><dd>${washType}</dd>
							<dt>세차옵션</dt><dd>${carTypeCost}</dd>
						</dl>
					</div>
				</div>
				<form action="${contextPath}/carwash/carWashReserve.do" method="POST" style="width: 100%;">
					<input type="hidden" name="userId" value="${userId}">
					<input type="hidden" name="userName" value="${member.name}">
					<input type="hidden" name="washType" value="${washType}">
					<input type="hidden" name="washId" value="${washId}">
					<input type="hidden" name="rsvnDate" value="${rsvnDate}">
					<input type="hidden" name="rsvnTime" value="${rsvnTime}">
					<input type="hidden" name="carTypeCost" value="${carTypeCost}">
					<!--
						<input type="hidden" name="staffId" value="${staffId}">
						-->
						<div class="ux-button-bar">
							<button class="ux-button contained primary" type="submit">
								<span class="label">예약하기</span>
							</button>
						</div>
					</form>
				</div>
			</div>
		</article>
	</section>
</main>