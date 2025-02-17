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
						<li class="current">
							<span class="icon"></span><span class="label">Step01. 세차 옵션 선택</span>
						</li>
						<li>
							<span class="icon"></span><span class="label">Step02. 선택 옵션 확인</span>
						</li>
						<li>
							<span class="icon"></span><span class="label">Step03. 예약 완료</span>
						</li>
					</ol>
				</div>
				<h3 class="tac">${carWashDetail.washName}에서<br/> 예약을 진행합니다.</h3>

				<div class="posa">
					<h6><em>확인용 : 개발완료시 삭제</em></h6>
					<p>선택한 세차장 ID: ${washId}</p>
					<p>선택한 세차장명: ${carWashDetail.washName}</p>
					<p>유저 ID: ${userId}</p>
					<p>유저 네임: ${member.name}</p>
				</div>
			</div>
			<div class="content">
				<form class="ui-form reserv" action="${contextPath}/carwash/reservationStep2.do" method="POST">
					<fieldset>
						<input type="hidden" name="washId" value="${washId}">
						<input type="hidden" name="washName" value="${carWashDetail.washName}">
						<input type="hidden" name="userId" value="${userId}">
						<input type="hidden" name="userName" value="${member.name}">
						<ul>
							<li>
								<div class="field">
									<label class="label" for="rsvnDate">예약하실 날짜를 선택해주세요</label>
									<div class="ui-input">
										<div class="input outlined">
											<input type="date" id="rsvnDate" name="rsvnDate" value="" placeholder="날짜 선택" required>
										</div>
									</div>
								</div>
							</li>
							<li>
								<div class="field">
									<p class="label" for="rsvnTime">세차시간을 선택해주세요</ㅔ>
									<div class="ui-input">
										<div class="input">
											<label class="custom-radio contained" for="time1">
												<input type="radio" id="time1" name="rsvnTime" value="09:00" required>
												<span class="icon"></span>
												<span class="label">09:00</span>
											</label>
											<label class="custom-radio contained" for="time2">
												<input type="radio" id="time2" name="rsvnTime" value="10:00" required>
												<span class="icon"></span>
												<span class="label">10:00</span>
											</label>
											<label class="custom-radio contained" for="time3">
												<input type="radio" id="time3" name="rsvnTime" value="11:00" required>
												<span class="icon"></span>
												<span class="label">11:00</span>
											</label>
											<label class="custom-radio contained" for="time4">
												<input type="radio" id="time4" name="rsvnTime" value="12:00" required>
												<span class="icon"></span>
												<span class="label">12:00</span>
											</label>
											<label class="custom-radio contained" for="time5">
												<input type="radio" id="time5" name="rsvnTime" value="13:00" required>
												<span class="icon"></span>
												<span class="label">13:00</span>
											</label>
											<label class="custom-radio contained" for="time6">
												<input type="radio" id="time6" name="rsvnTime" value="14:00" required>
												<span class="icon"></span>
												<span class="label">14:00</span>
											</label>
											<label class="custom-radio contained" for="time7">
												<input type="radio" id="time7" name="rsvnTime" value="15:00" required>
												<span class="icon"></span>
												<span class="label">15:00</span>
											</label>
											<label class="custom-radio contained" for="time8">
												<input type="radio" id="time8" name="rsvnTime" value="16:00" required>
												<span class="icon"></span>
												<span class="label">16:00</span>
											</label>
											<label class="custom-radio contained" for="time9">
												<input type="radio" id="time9" name="rsvnTime" value="17:00" required>
												<span class="icon"></span>
												<span class="label">17:00</span>
											</label>
											<label class="custom-radio contained" for="time10">
												<input type="radio" id="time10" name="rsvnTime" value="18:00" required>
												<span class="icon"></span>
												<span class="label">18:00</span>
											</label>
										</div>
									</div>
								</div>
							</li>
							<li>
								<div class="field">
									<p class="label" for="washType">세차유형을 선택해주세요</p>
									<div class="ui-input">
										<div class="input">
											<label class="custom-radio contained" for="self">
												<input type="radio" id="self" name="washType" value="셀프세차" onclick="setCarTypeCost()">
												<span class="icon"></span>
												<span class="label">셀프세차</span>
											</label>
											<label class="custom-radio contained" for="auto">
												<input type="radio" id="auto" name="washType" value="자동세차" onclick="setCarTypeCost()">
												<span class="icon"></span>
												<span class="label">자동세차</span>
											</label>
											<label class="custom-radio contained" for="expert">
												<input type="radio" id="expert" name="washType" value="전문세차" onclick="setCarTypeCost()">
												<span class="icon"></span>
												<span class="label">전문세차</span>
											</label>
											<!-- <label class="custom-radio contained" for="visit">
												<input type="radio" id="visit" name="washType" value="출장세차">
												<span class="icon"></span>
												<span class="label">출장세차</span>
											</label> -->
										</div>
									</div>
								</div>
							</li>
							<li id="carTypeCostContainer" class="cartype-cost" style="display: none;">
								<div class="field">
									<p class="label" for="carTypeCost">세차옵션을 선택해주세요</p>
									<div class="ui-input">
										<!-- 셀프세차 -->
										<div id="selfCarTypeCost" class="type-cost" style="display: none;">
											<div class="input">
												<label class="custom-radio contained" for="selfCarTypeCost">
													<input type="radio" id="selfCarTypeCost" name="carTypeCost" value="매장방문시 코인 사용" required checked="checked">
													<span class="icon"></span>
													<span class="label">매장방문시 코인 사용</span>
												</label>
											</div>
										</div>
										<!-- 자동세차 -->
										<div id="autoCarTypeCost" class="type-cost" style="display: none;">
											<div class="input">
												<label class="custom-radio contained" for="compact">
													<input type="radio" id="compact" name="carTypeCost" value="소형 10,000" required>
													<span class="icon"></span>
													<span class="label">소형 10,000</span>
												</label>
												<label class="custom-radio contained" for="mid">
													<input type="radio" id="mid" name="carTypeCost" value="중형 13,000">
													<span class="icon"></span>
													<span class="label">중형 13,000</span>
												</label>
												<label class="custom-radio contained" for="large">
													<input type="radio" id="large" name="carTypeCost" value="준중형 15,000">
													<span class="icon"></span>
													<span class="label">준중형 15,000</span>
												</label>
												<label class="custom-radio contained" for="subcompact">
													<input type="radio" id="subcompact" name="carTypeCost" value="대형 20,000">
													<span class="icon"></span>
													<span class="label">대형 20,000</span>
												</label>
												<label class="custom-radio contained" for="suv">
													<input type="radio" id="suv" name="carTypeCost" value="SUV 25,000">
													<span class="icon"></span>
													<span class="label">SUV 25,000</span>
												</label>
											</div>
										</div>
										<!-- 전문세차 -->
										<div id="expertCarTypeCost" class="type-cost" style="display: none;">
											<div class="input">
												<label class="custom-radio contained" for="compact_expert">
													<input type="radio" id="compact_expert" name="carTypeCost" value="소형 28,000" required>
													<span class="icon"></span>
													<span class="label">소형 28,000</span>
												</label>
												<label class="custom-radio contained" for="mid_expert">
													<input type="radio" id="mid_expert" name="carTypeCost" value="중형 33,000">
													<span class="icon"></span>
													<span class="label">중형 33,000</span>
												</label>
												<label class="custom-radio contained" for="large_expert">
												<input type="radio" id="large_expert" name="carTypeCost" value="준중형 38,000">
												<span class="icon"></span>
												<span class="label">준중형 38,000</span>
												</label>
												<label class="custom-radio contained" for="subcompact_expert">
													<input type="radio" id="subcompact_expert" name="carTypeCost" value="대형 40,000">
													<span class="icon"></span>
													<span class="label">대형 40,000</span>
												</label>
												<label class="custom-radio contained" for="suv_expert">
													<input type="radio" id="suv_expert" name="carTypeCost" value="SUV 50,000">
													<span class="icon"></span>
													<span class="label">SUV 50,000</span>
												</label>
											</div>
											<div class="msg">
												<p>매장방문시 작업 가능한 전문가로 자동 배정 됩니다.</p>
											</div>
										</div>
									</div>
								</div>
							</li>
							<!-- 전문가선택
							<label>전문가선택:</label><br>
							<input type="radio" id="staff1" name="staffId" value="1">
							<label for="staff1">staff1</label><br>

							<input type="radio" id="staff2" name="staffId" value="2">
							<label for="staff2">staff2</label><br>

							<input type="radio" id="staff3" name="staffId" value="3">
							<label for="staff3">staff3</label><br> -->
						</ul>
					</fieldset>
					<div class="ux-button-bar">
						<button class="ux-button contained primary next" type="submit"><span class="label">다음</span></button>
					</div>
				</form>
			</div>
		</article>
		<script>
			function setCarTypeCost() {
				const washType = document.querySelector('input[name="washType"]:checked').value;

				const carTypeCostContainer = document.getElementById('carTypeCostContainer');
				const selfCarTypeCost = document.getElementById('selfCarTypeCost');
				const autoCarTypeCost = document.getElementById('autoCarTypeCost');
				const expertCarTypeCost = document.getElementById('expertCarTypeCost');

				carTypeCostContainer.style.display = 'none';
				selfCarTypeCost.style.display = 'none';
				autoCarTypeCost.style.display = 'none';
				expertCarTypeCost.style.display = 'none';

				if (washType === '셀프세차') {
					carTypeCostContainer.style.display = 'block';
					selfCarTypeCost.style.display = 'block';
				} else if (washType === '자동세차') {
					carTypeCostContainer.style.display = 'block';
					autoCarTypeCost.style.display = 'block';
				} else if (
					washType === '전문세차') {
					carTypeCostContainer.style.display = 'block';
					expertCarTypeCost.style.display = 'block';
				}
			}
		</script>
	</section>
</main>