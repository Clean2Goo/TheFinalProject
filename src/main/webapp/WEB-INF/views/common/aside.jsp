<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="if" uri="http://java.sun.com/jsp/jstl/core"%>
<% request.setCharacterEncoding("UTF-8");%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<section>
	<article>
		<div class="myPage-menu">
			<div class="menu-list">
				<c:choose>
					<c:when test="${isLogOn == true  && member!= null}">
						<h4>이름: ${member.name}님!</h4>
						<h4>구분: ${member.userType}</h4>
					</c:when>
				</c:choose>
				<ul>
					<li>
						<a href="${contextPath}/member/myPage.do" class="ux-link">내 정보</a>
					</li>
					<li>
						<a href="${contextPath}/member/favorites.do" class="ux-link">즐겨찾기 목록</a>
					</li>
				</ul>
			</div>
		</div>
	</article>
</section>
