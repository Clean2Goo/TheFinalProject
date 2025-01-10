<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="if" uri="http://java.sun.com/jsp/jstl/core"%>
<% request.setCharacterEncoding("UTF-8");%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<header>
	<section>
		<article>
			<ul>
				<li>
		  			<a href="${contextPath}/admin.do"><h1>Clean2go 관리자메인</h1></a>
				</li>
			</ul>
			<ul>
				<li>
			 		<c:choose>
						<c:when test="${isLogOn == true  && member!= null}">
							<div class="user-menu">
								<img src="${contextPath}/resources/assets/images/user_icon.png" height="40"alt="User Menu" class="user_icon">
								<ul class="dropdown-menu">
									<li>${member.id}</li>
									<li><img src="${contextPath}/resources/assets/images/user_icon.png" alt="User Icon" class="dropdown-user-icon"></li>
									<li class="welcome-message">환영합니다, ${member.name}님.</li>
									<li>구분: ${member.userType}</li>
									<!--
									<li><a href="${contextPath}/member/myPage.do" >관리자-마이페이지</a></li>
									-->
									<li><a href="${contextPath}/member/adminLogout.do" class="logout-button">로그아웃</a></li>
								</ul>
							</div>
						</c:when>
					</c:choose>
			  	</li>
			  	<li>
			  		<a href="${contextPath}/main.do">Clean2go 홈</a>
			  	</li>
		  </ul>
		</article>
	</section>
</header>

