<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="if" uri="http://java.sun.com/jsp/jstl/core"%>
<% request.setCharacterEncoding("UTF-8");%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<section>
	<article>
		<div class="admin-menu">
			<div class="menu-list">
				<c:choose>
					<c:when test="${isLogOn == true  && member!= null}">
						<h4>이름: ${member.name}님!</h4>
						<h4>구분: ${member.userType}</h4>
					</c:when>
				</c:choose>
				<ul>
					<c:if test="${isLogOn && member.userType == 'systemOperator'}">
						<li>
							<a href="${contextPath}/member/adminListMembers.do" class="ux-link">전체회원목록창</a>
						</li>
					</c:if>
					<li>
						<a href="${contextPath}/notice/adminListNotices.do" class="ux-link">공지사항 목록</a>
					</li>
					<c:if test="${isLogOn && member.userType == 'systemOperator'}">
						<li>
							<a href="${contextPath}/notice/adminWriteForm.do" class="ux-link">공지사항 작성</a>
						</li>
					</c:if>
					<li>
						<a href="" class="ux-link">이벤트 목록</a>
					</li>
					<c:if test="${isLogOn && member.userType == 'systemOperator'}">
						<li>
							<a href="" class="ux-link">이벤트 작성</a>
						</li>
					</c:if>
					<li>
						<a href="" class="ux-link">자주묻는질문 목록</a>
					</li>
					<c:if test="${isLogOn && member.userType == 'systemOperator'}">
						<li>
							<a href="" class="ux-link">자주묻는질문 작성</a>
						</li>
					</c:if>
				</ul>
			</div>
			<div class="button-bar">
				<button type="button" class="ux-button button-logout button-rang"
					onclick="location.href='${contextPath}/member/adminLogout.do'">
					<span class="label">어드민-로그아웃</span><span class="icon"></span>
				</button>
			</div>
		</div>
	</article>
</section>
