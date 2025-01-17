<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="if" uri="http://java.sun.com/jsp/jstl/core"%>
<% request.setCharacterEncoding("UTF-8");%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<header>
	<section>
		<article>
			<div>
				<div class="logo">
					<a href="${contextPath}/admin.do" class="ux-link h1">Clean2Go admin system</a>
				</div>
			</div>
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
												<span class="icon"><i class="icon fa-regular fa-user"></i></span><span class="label">마이페이지</span>
											</a>
										</li>
										<!-- <li>
											<a href="#" role="button" class="ux-button icon-button">
												<span class="icon"><i class="icon fa-regular fa-calendar-check"></i></span><span class="label">예약내역</span>
											</a>
										</li>
										<li>
											<a href="#" role="button" class="ux-button icon-button">
												<span class="icon"><i class="icon fa-regular fa-star"></i></span><span class="label">즐겨찾기</span>
											</a>
										</li>
										<li>
											<a href="#" role="button" class="ux-button icon-button">
												<span class="icon"><i class="icon fa-regular fa-bell"></i></span><span class="label">알림</span>
											</a>
										</li> -->
										<li>
											<a href="${contextPath}/member/adminLogout.do" role="button" class="ux-button icon-button">
												<span class="icon"><i class="icon fa-solid fa-arrow-right-from-bracket"></i></span><span class="label">로그아웃</span>
											</a>
										</li>
									</ul>
								</div>
							</li>
						</c:when>
					</c:choose>
					<li><a href="${contextPath}/main.do">HOME</a></li>
				</ul>
			</div>
		</article>
	</section>
</header>