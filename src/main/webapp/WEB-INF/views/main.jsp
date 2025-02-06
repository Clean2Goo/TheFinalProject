<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"   isELIgnored="false"  %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<%request.setCharacterEncoding("UTF-8");%>


<main class="ui-index">
	<!-- 섹션 1 -->
	<section class="section1">
		<article >
			<div class="section-title">
				<h3>세차, 이제 더 스마트하게</h3>
				<h3>원하는 시간에 간편하게</h3>
				<h3>언제 어디서든 웨이팅없이!</h3>
				<h4>당신의 일상에 여유를 더합니다.</h4>
				<h4>Clean 2 go로 빠르게 예약하세요</h4>
			</div>
			<div class="content">
				<div class="ux-button-bar">
					<a href="${contextPath}/explore.do" class="ux-button contained primary" role="button">
						<span class="label">세차장 검색</span>
					</a>
				</div>
			</div>
		</article>
	</section>
	<!-- 섹션 2 -->
	<section class="section2">
		<article class="has-swiper">
			<div class="section-title">
				<h3>강남구 추천 세차장</h3>
			</div>
			<div class="content recommand">
				<div class="swiper-container recommand-swiper">
					<div class="swiper-wrapper">
						<c:if test="${not empty carWashesListInGangnam}">
							<c:forEach var="item" items="${carWashesListInGangnam}">
							<div class="swiper-slide recommand-slide">
								<a class="recommand" href="${contextPath}/carwash/carWashDetail.do?washId=${item.washId}">
									<div class="item-image">
										<img class="img" src=${item.washImg} alt="세차장대표이미지">
									</div>
									<div class="item-info">
										<h4 class="info-title">${item.washName}</h4>
										<p class="info-location">
											<span class="icon"></span><span class="label">${item.washAddr}</span>
										</p>
									</div>
								</a>
							</div>

							</c:forEach>
						</c:if>
					</div>
				</div>
			</div>
		</article>
	</section>
	<!-- 섹션 3 -->
	<!-- <section class="section3">
		<article >
			<div class="section-title fdr">
				<h3>섹션3333 회사소개</h3>
				<a href="#" role="button" class="ux-button text-button" >
					<span class="label">더보기</span><span class="icon rang"></span>
				</a>
			</div>
			<div class="content">
				<div>회사소개</div>
			</div>
		</article>
	</section> -->
	<!-- 섹션 4 -->
	<section class="section4">
		<article >
			<div class="section-title fdr">
				<h3>Events</h3>
				<a href="${contextPath}/board/listArticles.do" role="button" class="ux-button text-button more-view-button" >
					<span class="label">더보기</span><span class="icon rang"></span>
				</a>
			</div>
			<div class="content">
				<div class="swiper-container event-swiper">
					<div class="swiper-wrapper">
						<div class="swiper-slide event-slide s1">
							<a class="event" href="#">
								<div class="item-image">
									<img class="img" src="${contextPath}/resources/assets/images/temp/temp.jpg" alt="이벤트배너">
								</div>
							</a>
						</div>
						<div class="swiper-slide event-slide s2">
							<a class="event" href="#">
								<div class="item-image">
									<img class="img" src="${contextPath}/resources/assets/images/temp/temp.jpg" alt="이벤트배너">
								</div>
							</a>
						</div>
						<div class="swiper-slide event-slide s3">
							<a class="event" href="#">
								<div class="item-image">
									<img class="img" src="${contextPath}/resources/assets/images/temp/temp.jpg" alt="이벤트배너">
								</div>
							</a>
						</div>
					</div>
				</div>
			</div>
		</article>
	</section>
	<!-- 섹션 5 -->
	<section class="section5">
		<article >
			<div class="section-title fdr">
				<h3>FAQ top3</h3>
				<a href="${contextPath}/faq/listFaqs.do" role="button" class="ux-button text-button more-view-button" >
					<span class="label">더보기</span><span class="icon rang"></span>
				</a>
			</div>
			<div class="content">
				<div class="ui-accordion exclusive">
					<!--  .accordion.accordion-expanded -->
					<dl class="accordion">
						<dt class="accordion-get">
							<div class="type">
								<span class="icon"><img src="${contextPath}/resources/assets/images/common/acd_q.png" alt=""></span>
							</div>
							<div class="accordion-title">
								<div><span class="label">세차 예약은 어떻게 하나요?</span></div>
								<div><span class="icon angle"></span></div>
							</div>
						</dt>
						<dd class="accordion-set">
							<div class="accordion-content text">
								<p>클린투고 공식 홈페이지에 접속해 원하는 지역의 세차장을 검색하세요.</p>
								<p>예약 가능한 세차장을 선택하고, 원하는 날짜와 시간을 선택하여 예약을 완료하세요.</p>
								<p><strong><em>모든 예약은 클린투고 공식 홈페이지에서 진행됩니다.</em></strong></p>
							</div>
						</dd>
					</dl>
					<dl class="accordion">
						<dt class="accordion-get">
							<div class="type">
								<span class="icon"><img src="${contextPath}/resources/assets/images/common/acd_q.png" alt=""></span>
							</div>
							<div class="accordion-title">
								<div><span class="label"> 예약을 취소하거나 변경할 수 있나요?</span></div>
								<div><span class="icon angle"></span></div>
							</div>
						</dt>
						<dd class="accordion-set">
							<div class="accordion-content text">
								<p>예약 취소 및 변경은 <strong><em>예약 내역 페이지</em></strong>에서 가능합니다.</strong></p>
								<p>예약 변경은 <strong><em>세차장별 정책에 따라 제한</em></strong>될 수 있으며, <strong><em>일부 세차장은 취소 수수료가 부과될 수 있습니다.</em></strong></p>
							</div>
						</dd>
					</dl>
					<dl class="accordion">
						<dt class="accordion-get">
							<div class="type">
								<span class="icon"><img src="${contextPath}/resources/assets/images/common/acd_q.png" alt=""></span>
							</div>
							<div class="accordion-title">
								<div><span class="label">쿠폰은 어떻게 사용하나요?</span></div>
								<div><span class="icon angle"></span></div>
							</div>
						</dt>
						<dd class="accordion-set">
							<div class="accordion-content text">
								<p>예약 결제 시, <strong><em>이메일로 받은 쿠폰을 현장에서 직원에게 제시하시면 할인이 적용됩니다.</em></strong></p>
								<p>쿠폰 사용 가능 여부는 예약 페이지에서 확인할 수 있습니다.</p>
							</div>
						</dd>
					</dl>
				</div>
			</div>
		</article>
	</section>
</main>
