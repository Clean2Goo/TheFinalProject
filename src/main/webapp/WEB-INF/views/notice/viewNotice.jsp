<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="${contextPath}/resources/assets/css/viewNotice.css">

<main>
	<section>
		<article>
			<div class="h3-title">
				<h3>공지사항</h3>
			</div>
			<div class="content">
				<div class="bbs-read">
					<div class="bbs-title">
						<h4 class="subject">${notice.title}</h4>
						<ul class="info-list">
							<li>
								<p>작성자 : <span class="author">${notice.id}</span></p>
							</li>
							<li>
								<p>등록일 : <span class="date">${notice.writedate}</span></p>
							</li>
						</ul>
					</div>
					<div class="bbs-content">
						<p>${notice.content}</p>
					</div>
					<div class="bbs-navigation">
						<!-- 이전 글 표시 -->
						<c:if test="${not empty prevNotice}">
							<div class="nav prev">
								<p class="label">이전 글<span class="icon"></span></p>
								<!-- 고객 / 로그인정보 없을시 -->
								<c:if test="${!isLogOn || member.userType == 'customer'}">
									<a href="${contextPath}/notice/viewNotice.do?noticeno=${prevNotice.noticeno}" class="subject">${prevNotice.title}</a>
								</c:if>
								<!-- 어드민: 로그인했을 때만 표시 -->
								<c:if test="${isLogOn && member.userType != 'customer'}">
									<a href="${contextPath}/notice/adminViewNotice.do?noticeno=${prevNotice.noticeno}" class="subject">${prevNotice.title}</a>
								</c:if>
								<p class="date">${prevNotice.writedate}</p>
							</div>
						</c:if>
						<c:if test="${empty prevNotice}">
							<div class="nav prev">
								<p class="label">이전 글<span class="icon"></span></p>
								<p class="subject">이전 글이 없습니다.</p>
							</div>
						</c:if>

						<!-- 다음 글 표시 -->
						<c:if test="${not empty nextNotice}">
							<div class="nav next">
								<p class="label">다음 글<span class="icon"></span></p>
								<!-- 고객 / 로그인정보 없을시 -->
								<c:if test="${!isLogOn || member.userType == 'customer'}">
									<a href="${contextPath}/notice/viewNotice.do?noticeno=${nextNotice.noticeno}" class="subject">${nextNotice.title}</a>
								</c:if>
								<!-- 어드민: 로그인했을 때만 표시 -->
								<c:if test="${isLogOn && member.userType != 'customer'}">
									<a href="${contextPath}/notice/adminViewNotice.do?noticeno=${nextNotice.noticeno}" class="subject">${nextNotice.title}</a>
								</c:if>
								<p class="date">${nextNotice.writedate}</p>
							</div>
						</c:if>
						<c:if test="${empty nextNotice}">
							<div class="nav next">
								<p class="label">다음 글<span class="icon"></span></p>
								<p class="subject">다음 글이 없습니다.</p>
							</div>
						</c:if>
					</div>
				</div>
				<div class="ux-button-bar">
					<!-- 고객 / 로그인정보 없을시 -->
					<c:if test="${!isLogOn || member.userType == 'customer'}">
						<a class="ux-button outlined" href="${contextPath}/notice/listNotices.do">목록보기</a>
					</c:if>
					<!-- 어드민: 로그인했을 때만 표시-->
					<c:if test="${isLogOn && member.userType != 'customer'}">
						<a class="ux-button outlined" href="${contextPath}/notice/adminListNotices.do">어드민-목록보기</a>
					</c:if>
				</div>
			</div>
		</article>
	</section>
</main>
