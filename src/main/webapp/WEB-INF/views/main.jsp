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
				<h3>섹션2222 강남구 세차장 추전</h3>
			</div>
			<div class="content recommand">
				<div class="swiper-container recommand-swiper">
					<div class="swiper-wrapper">
						<c:if test="${not empty carWashesListInGangnam}">
							<c:forEach var="item" items="${carWashesListInGangnam}">
							<div class="swiper-slide recommand-slide">
								<a class="recommand" href="${contextPath}/carwash/detail.do?washId=${item.washId}">
									<div class="item-image">
										<img class="img" src="${contextPath}/resources/assets/images/carwashes/temp.jpg" alt="세차장대표사진">
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
					<!-- <div class="swiper-button-next"></div>
					<div class="swiper-button-prev"></div> -->
				</div>
			</div>
		</article>
	</section>
	<!-- 섹션 3 -->
	<section class="section3">
		<article >
			<div class="section-title fdr">
				<h3>섹션3333 회사소개</h3>
				<a href="#" role="button" class="ux-button text-button" >
					<span class="label">더보기</span>
				</a>
			</div>
			<div class="content">
				<div>회사소개</div>
			</div>
		</article>
	</section>
	<!-- 섹션 4 -->
	<section class="section4">
		<article >
			<div class="section-title fdr">
				<h3>섹션4444 이벤트</h3>
				<a href="#" role="button" class="ux-button text-button" >
					<span class="label">더보기</span>
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
					</div>
				</div>
			</div>
		</article>
	</section>
	<!-- 섹션 5 -->
	<section class="section5">
		<article >
			<div class="section-title fdr">
				<h3>섹션5555 FAQ</h3>
				<a href="#" role="button" class="ux-button text-button" >
					<span class="label">더보기</span>
				</a>
			</div>
			<div class="content">
				<div class="ui-accordion exclusive">
					<dl class="accordion accordion-expanded">
						<dt class="accordion-get">
							<div class="type">
								<span class="icon"><img src="${contextPath}/resources/assets/images/common/acd_q.png" alt=""></span><span class="label">홈페이지이용</span>
							</div>
							<div class="accordion-title">
								<div><span class="label">질문 타이틀</span></div>
								<div><span class="icon angle"></span></div>
							</div>
						</dt>
						<dd class="accordion-set">
							<div class="accordion-content text">
								<p>질문에 대한 답변이 들어가는 영역입니다.질문에 대한 답변이 들어가는 영역입니다.질문에 대한 답변이 들어가는 영역입니다</p>
								<p>질문에 대한 답변이 들어가는 영역입니다.질문에 대한 답변이 들어가는 영역입니다.질문에 대한 답변이 들어가는 영역입니다</p>
							</div>
						</dd>
					</dl>
					<dl class="accordion">
						<dt class="accordion-get">
							<div class="type">
								<span class="icon"><img src="${contextPath}/resources/assets/images/common/acd_q.png" alt=""></span><span class="label">홈페이지이용</span>
							</div>
							<div class="accordion-title">
								<div><span class="label">질문 타이틀</span></div>
								<div><span class="icon angle"></span></div>
							</div>
						</dt>
						<dd class="accordion-set">
							<div class="accordion-content text">
								<p>질문에 대한 답변이 들어가는 영역입니다.질문에 대한 답변이 들어가는 영역입니다.질문에 대한 답변이 들어가는 영역입니다</p>
							</div>
						</dd>
					</dl>
				</div>
			</div>
		</article>
	</section>
</main>
