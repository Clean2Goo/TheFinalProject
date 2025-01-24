<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%request.setCharacterEncoding("UTF-8");%>

<main>
	<section>
		<article>
			<div class="h3-title">
				<h3>예약2단계</h3>
			</div>
			<div class="content">
				<div class="h4">
					<div class="h4-title">
						<h4>예약 확인</h4>
					</div>
					<div class="content">
						<p>선택한 세차장 ID: ${washId}</p>
						<p>선택한 세차장명: ${washName}</p>
						<p>유저 ID: ${userId}</p>
						<p>세차유형: ${washType}</p>
						<p>직원 ID (선택적):  ${staffId}</p>
						<p>예약 날짜 : ${rsvnDate}</p>
						<p>예약 시간 : ${rsvnTime}</p>
						<p>차량 타입 + 가격: ${carTypeCost}</p>
						<p>예약 상태 (디폴트): ${status}</p>
						<p>취소 여부 (디폴트): ${cancelYn}</p>
						<p>생성 날짜 (디폴트): ${crtDate}</p>
						
 						<form action="${contextPath}/carwash/carWashReserve.do" method="POST">
						    <input type="hidden" name="userId" value="${userId}">
						    <input type="hidden" name="washType" value="${washType}">
						    <input type="hidden" name="washId" value="${washId}">
						    <input type="hidden" name="rsvnDate" value="${rsvnDate}">
						    <input type="hidden" name="rsvnTime" value="${rsvnTime}">
						    <input type="hidden" name="carTypeCost" value="${carTypeCost}">
						    <!--
						    <input type="hidden" name="status" value="${status}">
						    <input type="hidden" name="cancelYn" value="${cancelYn}">
						    <input type="hidden" name="staffId" value="${staffId}">
						    <input type="hidden" name="crtDate" value="${crtDate}">
						     -->
						    <button type="submit">예약하기</button>
						</form>
 						
					</div>
				</div>
			</div>
		</article>
	</section>
</main>