<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"/>


<main>
	<section>
		<article>
			<div class="notice-container">
				<div class="notice-box">
					<h1>${notice.title}</h1>
					<p><strong>작성자:</strong> ${notice.id}</p>
					<p><strong>작성일:</strong> ${notice.writedate}</p>
					<p>${notice.content}</p>
					<c:if test="${not empty notice.imagefilename}">
						<img src="${contextPath}/resources/assets/images/${notice.imagefilename}" alt="첨부 이미지" />
					</c:if>
					<!-- 고객 -->
					<c:if test="${!isLogOn || member.userType == 'customer'}">
						<a class="back-button" href="${contextPath}/notice/listNotices.do">고객-목록으로 돌아가기</a>
					</c:if>
					<!-- 어드민-->
					<c:if test="${isLogOn && member.userType != 'customer'}">
						<a class="back-button" href="${contextPath}/notice/adminListNotices.do">어드민-목록으로 돌아가기</a>
					</c:if>
				</div>
			</div>
		</article>
	</section>
</main>
