<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  request.setCharacterEncoding("UTF-8");
%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<header>
	<section class="header-pc">
		<article>
			<div>
				<div class="logo">
					<a href="${contextPath}/main.do" class="ux-link h1">Clean2Go</a>
					<a href="${contextPath}/explore.do" class="ux-button custom-search" role="button">
						<i class="icon fa-solid fa-magnifying-glass"></i>
						<span class="label hidden">가고 싶은 세차장을 검색하세요!</span>
						<span id="typeItTitle" class="label">어느 세차장을 가볼까요?</span>
					</a>
				</div>
			</div>
			<div class="gnb">
				<nav>
					<ul>
						<li><a href="#" role="button" class="gnb-menu"><span class="label">회사소개</span></a></li>
						<li><a href="${contextPath}/notice/listNotices.do" role="button" class="gnb-menu"><span class="label">공지사항</span></a></li>
						<li><a href="${contextPath}/board/listArticles.do" role="button" class="gnb-menu"><span class="label">이벤트</span></a></li>
						<li><a href="#" role="button" class="gnb-menu"><span class="label">FAQ</span></a></li>
					</ul>
				</nav>
				<div class="menu-bar">
					<ul>
						<c:choose>
							<c:when test="${isLogOn == true  && member!= null}">
								<li>
									<a href="#" class="ux-button icon-menu bell noti-msg" role="button">
										<i class="icon fa-regular fa-bell"></i>
										<span class="label">알림</span>
										<div class="badge"><span class="count">3</span></div>
									</a>
								</li>
								<li>
									<button class="ux-button custom-profile">
										<div class="user-profile-wrap">
											<div class="user-profile-img">
												<img src="${contextPath}/resources/assets/images/profile/default.png" alt="프로필이미지">
											</div>
										</div>
										<span class="label">퀵메뉴 열기</span>
									</button>
									<div class="dropdown-wrap">
										<div class="user-profile-wrap">
											<div class="user-profile-img dropdown">
												<img src="${contextPath}/resources/assets/images/profile/default.png" alt="프로필이미지">
											</div>
											<div class="user-profile-info">
												<p class="user-name">${member.name}</p>
												<p class="user-id">${member.id}</p>
											</div>
										</div>
										<ul class="dropdown-menu">
											<li>
												<a href="${contextPath}/member/myPage.do" role="button" class="ux-button icon-button">
													<span class="icon"><i class="fa-regular fa-user"></i></span><span class="label">마이페이지</span>
												</a>
											</li>
											<li>
												<a href="${contextPath}/favorites.do" role="button" class="ux-button icon-button">
													<span class="icon"><i class="fa-regular fa-star"></i></span><span class="label">즐겨찾기</span>
												</a>
											</li>
											<!-- <li>
												<a href="#" role="button" class="ux-button icon-button">
													<span class="icon"><i class="fa-regular fa-calendar-check"></i></span><span class="label">예약내역</span>
												</a>
											</li>
											<li>
												<a href="#" role="button" class="ux-button icon-button">
													<span class="icon"><i class="fa-regular fa-bell"></i></span><span class="label">알림</span>
												</a>
											</li> -->
											<li>
												<a href="${contextPath}/member/logout.do" role="button" class="ux-button icon-button">
													<span class="icon"><i class="icon fa-solid fa-arrow-right-from-bracket"></i></span><span class="label">로그아웃</span>
												</a>
											</li>
										</ul>
									</div>
								</li>
							</c:when>
							<c:otherwise>
								<li><a href="${contextPath}/member/loginForm.do" role="button" class="ux-button button-sign"><span class="label">로그인</span></a></li>
								<li><a href="${contextPath}/member/memberForm.do" role="button" class="ux-button button-sign"><span class="label">회원가입</span></a></li>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
			</div>
		</article>
	</section>
</header>