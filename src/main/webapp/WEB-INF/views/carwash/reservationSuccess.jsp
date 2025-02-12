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
						<li>
							<span class="icon"></span><span class="label">Step02. 선택 옵션 확인</span>
						</li>
						<li class="current">
							<span class="icon"></span><span class="label">Step03. 예약 완료</span>
						</li>
					</ol>
				</div>
				<h3 class="tac">${member.name}님! 예약이 완료되었습니다.</h3>

				<div class="posa">
					<h6><em>확인용 : 개발완료시 삭제</em></h6>
					<p>선택한 세차장 ID: ${washId}</p>
					<p>유저 ID: ${userId}</p>
					<p>세차유형: ${washType}</p>
					<p>유저 네임: ${member.name}</p>
					<p>예약 날짜 : ${rsvnDate}</p>
					<p>예약 시간 : ${rsvnTime}</p>
					<p>차량 타입 + 가격: ${carTypeCost}</p>
					<p>직원 ID (작업보류):  ${staffId}</p>
				</div>
			</div>
			<div class="content">
				<div class="ui-result">
					<div id="lottie-result" class="lottie complete"></div>
					<div class="result-text">
						<h4>저희 <em>Clean2go</em>를 <br/> 이용해주셔서 감사합니다.</h4>
						<p>고객님의 시간을 항상 최우선으로 생각하겠습니다.</p>
					</div>
				</div>
				<div class="ux-button-bar">
					<a href="${contextPath}/myPage/listReservations.do" class="ux-button outlined" role="button">
						<span class="label">예약내역 보기</span>
					</a>
					<a href="${contextPath}/main.do" class="ux-button contained primary" role="button">
						<span class="label">메인으로 이동</span>
					</a>
				</div>
			</div>
		</article>
	</section>
	<script>

	</script>
</main>