<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%request.setCharacterEncoding("UTF-8");%>

<main>
	<section>
		<article>
			<div class="h3-title">
				<h3>예약1단계</h3>
			</div>
			<div class="content">
				<div class="h4">
					<div class="h4-title">
						<h4>h4타이틀</h4>
					</div>
					<div class="content">
					<p>선택한 세차장 ID: ${washId}</p>
					<p>선택한 세차장명: ${carWashDetail.washName}</p>
					<p>유저 ID: ${userId}</p>
					
					 <form action="${contextPath}/carwash/reservationStep2.do" method="POST">
					    <input type="hidden" name="washId" value="${washId}">
					    <input type="hidden" name="washName" value="${carWashDetail.washName}">
					    <input type="hidden" name="userId" value="${userId}">
					    
					    <!-- 세차날짜 -->
					    <label for="rsvnDate">예약 날짜:</label>
    					<input type="date" id="rsvnDate" name="rsvnDate" required>
    					<br>
    					
    					
					    <!-- 세차유형 -->
					    <input type="radio" id="auto" name="washType" value="자동세차" required>
					    <label for="auto">자동세차</label><br>
					
					    <input type="radio" id="self" name="washType" value="셀프세차">
					    <label for="self">셀프세차</label><br>
					
					    <input type="radio" id="expert" name="washType" value="전문세차">
					    <label for="expert">전문세차</label><br>
					
					    <input type="radio" id="visit" name="washType" value="출장세차">
					    <label for="visit">출장세차</label>
					    <br>
    					
    					
					    <!-- 전문가선택
    					<label>전문가선택:</label><br>
					    <input type="radio" id="staff1" name="staffId" value="1">
					    <label for="staff1">staff1</label><br>
					    
					    <input type="radio" id="staff2" name="staffId" value="2">
					    <label for="staff2">staff2</label><br>
					
					    <input type="radio" id="staff3" name="staffId" value="3">
					    <label for="staff3">staff3</label><br> -->
					    
					   
					    <!-- 예약시간 -->
    					<label>예약 시간:</label><br>
					    <input type="radio" id="time1" name="rsvnTime" value="10:00" required>
					    <label for="time1">10:00</label><br>
					    
					    <input type="radio" id="time2" name="rsvnTime" value="11:00">
					    <label for="time2">11:00</label><br>
					
					    <input type="radio" id="time3" name="rsvnTime" value="12:00">
					    <label for="time3">12:00</label><br>
					    
					    
					    <!-- 전문가 세차옵션 -->
					    <label>전문가 세차 옵션:</label><br>
					    <input type="radio" id="compact" name="carTypeCost" value="소형 28,000" required>
					    <label for="compact">소형 28,000</label><br>
					
					    <input type="radio" id="mid" name="carTypeCost" value="중형 33,000">
					    <label for="mid">중형 33,000</label><br>
					
					    <input type="radio" id="large" name="carTypeCost" value="준중형 38,000">
					    <label for="large">준중형 38,000</label><br>
					
					    <input type="radio" id="subcompact" name="carTypeCost" value="대형 40,000">
					    <label for="subcompact">대형 40,000</label><br>
					
					    <input type="radio" id="suv" name="carTypeCost" value="SUV 50,000">
					    <label for="suv">SUV 50,000</label>
					    <br>
					    
					    
					    
					    <!-- 상태 (기본값 스케쥴드) 
					    <input type="hidden" name="status" value="예약중">-->
					
					    <!-- 취소 여부 (기본값 N) 
					    <input type="hidden" name="cancelYn" value="N">-->
					
					   
					    <button type="submit">다음</button>
					</form>
					</div>
				</div>
			</div>
		</article>
	</section>
</main>