<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%request.setCharacterEncoding("UTF-8");%>

	
<main class="ui-subpage">
	<section>
		<article>
			<div class="h3-title">
				<h3>세차장 정보</h3>
			</div>
			<div class="content">
				<!-- 데이터가 없을 경우 표시 -->
				<c:if test="${empty carWashDetail}">
					<div>데이터가 없습니다.</div>
				</c:if>
				<c:if test="${not empty carWashDetail}">
					<div class="ux-divider"></div>
					<div class="h4 subpage-custom">
						<div class="content">
							<div class="item-photo-book">
								<img src="${carWashDetail.washImg}" alt="">
							</div>
						</div>
						<div class="content">
							<div class="custom-flex-box">
								<div class="group">
									<div class="flex">
										<h4>${carWashDetail.washName}</h4>
										<button class="ux-button icon-menu mt8">
											<span class="icon"><i class="fa-regular fa-star"></i></span><span class="label">즐겨찾기</span>
										</button>
									</div>
									<p class="info-location"><span class="icon"></span><span class="label">${carWashDetail.washAddr}</span></p>
								</div>
								<div class="dl-list">
									<dl>
										<dt>세차 타입</dt><dd><span>${carWashDetail.washType}</span></dd>
										<dt>세차 가능 차종</dt><dd><span>${carWashDetail.washableCar}</span></dd>
										<dt>평점</dt><dd><span>${carWashDetail.rating}</span></dd>
										<dt>운영 시간</dt><dd><span>${carWashDetail.openHrs}</span></dd>
										<dt>수용가능차량 수</dt><dd><span>${carWashDetail.maxCar}</span> 대</dd>
									</dl>
								</div>
								<form class="check-login-form" action="${contextPath}/carwash/reservationStep1.do" method="post">
								    <input type="hidden" name="washId" value="${carWashDetail.washId}">
									<div class="ux-button-bar">
										<button class="ux-button contained primary" type="submit"><span class="label">바로 예약 하기</span></button>
									</div>
								</form>
							</div>
						</div>
					</div>
					<div class="ux-divider"></div>
					<div class="h4">
						<div class="h4-title">
							<h4>매장 소개</h4>
						</div>
						<div class="content">
							<p class="text-intro">${carWashDetail.washInfo}<br/><br/>
							</p>
						</div>
					</div>
					<div class="ux-divider"></div>
					<div class="h4">
						<div class="h4-title">
							<h4>고객상담 </h4>
							<h4 class="info-num"><span>${carWashDetail.washTel}</span></h4>
						</div>
					</div>
					<div class="ux-divider"></div>
					<div class="h4">
						<div class="h4-title">
							<h4>세차비용 안내 </h4>
						</div>
						<div class="content">
							<div class="table data-grid">
								<table>
									<caption>세차비용 테이블</caption>
									<colgroup>
										<col width="">
										<col width="">
										<col width="">
										<col width="">
										<col width="">
										<col width="">
									<col>
									</colgroup>
									<thead>
										<tr>
											<th scope="col">구분</th>
											<th scope="col">소형</th>
											<th scope="col">중형</th>
											<th scope="col">준중형</th>
											<th scope="col">대형</th>
											<th scope="col">SUV</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<th>기계</th>
											<td>10,000</td>
											<td>13,000</td>
											<td>15,000</td>
											<td>20,000</td>
											<td>25,000</td>
										</tr>
										<tr>
											<th>전문가</th>
											<td>28,000</td>
											<td>33,000</td>
											<td>38,000</td>
											<td>40,000</td>
											<td>50,000</td>
										</tr>
										<tr>
											<th>출장</th>
											<td>40,000</td>
											<td>45,000</td>
											<td>50,000</td>
											<td>55,000</td>
											<td>60,000</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<div class="ux-divider"></div>
					<div class="h4">
						<div class="h4-title">
							<h4>편의시설 및 서비스</h4>
						</div>
						<div class="content">
							<ul class="icon-list col-2">
								<li>
									<p><span class="icon"><i class="fa-regular fa-calendar-check"></i></span>
									<sapn class="label">예약</sapn></p>
								</li>
								<li>
									<p><span class="icon"><i class="fa-solid fa-wifi"></i></span>
									<sapn class="label">무선인터넷</sapn></p>
								</li>
								<li>
									<p><span class="icon"><i class="fa-solid fa-cat"></i></span>
									<sapn class="label">반려동물동반</sapn></p>
								</li>
								<li>
									<p><span class="icon"><i class="fa-solid fa-restroom"></i></span>
									<sapn class="label">남/녀 화장실구분</sapn></p>
								</li>
								<li>
									<p><span class="icon"><i class="fa-solid fa-chair"></i></span>
									<sapn class="label">대기공간</sapn></p>
								</li>
							</ul>
							<ul class="icon-list col-2">
								<li>
									<p><span class="icon"><i class="fa-solid fa-square-parking"></i></span>
									<sapn class="label">주차가능</sapn></p>
								</li>
								<li>
									<p><span class="icon"><i class="fa-solid fa-car-side"></i></span>
									<sapn class="label">발렛가능</sapn></p>
								</li>
							</ul>
						</div>
					</div>
					<div class="ux-divider"></div>
					<div class="h4">
						<div class="h4-title">
							<h4>예약전 안내사항</h4>
						</div>
						<div class="content">
							<ul class="middot-list">
								<li>
									<p>예약시간 5분 이상 지연시 세차 진행이 어려울수 있습니다.</p>
								</li>
								<li>
									<p>오염도가 심할 경우 추가금이 발생할수 있습니다.<span class="desc">( 최초 응대시 확인 후 안내해 드리겠습니다.)</span></p>
								</li>
								<li>
									<p>카시트 탈부착은 고객님이 직접 진행 해주시기 바랍니다.<span class="desc">( 탈부착시 가죽 손상 등 적지 않은 시시비비가 발생하여 진행하지 않음.)</span></p>
								</li>
								<li>
									<p>트렁크 등 적재된 짐이 많을 경우 간단히 정리후 방문해 주세요.</p>
								</li>
								<li>
									<p>세차 가격은 차량/코스별 상이합니다.</p>
								</li>
								<li>
									<p>차량 내 귀중품은 미리 챙겨주세요!</p>
								</li>
							</ul>
						</div>
					</div>
				</c:if>
			</div>
		</article>
	</section>
</main>