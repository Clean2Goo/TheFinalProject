<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="${contextPath}/resources/assets/css/viewNotice.css"> 

<main>
	<section>
		<article>
			<div class="notice-container">
				<div class="notice-box">
					<h1 class="board-header">공지사항</h1>
					<h1 class="board-title">${notice.title}</h1>
					<div class="board-info">
					<p class="board-author"><strong>작성자:</strong> ${notice.id}</p>
					<p class="board-date"><strong>작성일:</strong> ${notice.writedate}</p>
					</div>
					<p class="board-content">${notice.content}</p>
					<c:if test="${not empty notice.imagefilename}">
						<img src="${contextPath}/resources/assets/images/${notice.imagefilename}" alt="첨부 이미지" />
					</c:if>
					
					<!-- 목록버튼 -->
					<div class="board-actions">
        			<button onclick="window.location.href='${pageContext.request.contextPath}/notice/listNotices.do';">목록</button>
     				</div>
     				
     				  <!-- 이전글 목록 -->
<div class="board-navigation">
  <div class="navigation-label">PREV ▲</div>
  <a 
    href="/board/${board.prev_board.id}?page=${param.page}&searchKeyword=${param.searchKeyword}" 
    class="<c:if test='${empty board.prev_board}'>disabled</c:if>">
    <c:choose>
      <c:when test="${empty board.prev_board}">
        이전 글이 없습니다.
      </c:when>
      <c:otherwise>
        <span style="color: blue;">${board.prev_board.title}</span>
      </c:otherwise>
    </c:choose>
  </a>
</div>

<!-- 다음글 목록 -->
<div class="board-navigation">
  <div class="navigation-label">NEXT ▼</div>
  <a 
    href="/board/${board.next_board.id}?page=${param.page}&searchKeyword=${param.searchKeyword}" 
    class="<c:if test='${empty board.next_board}'>disabled</c:if>">
    <c:choose>
      <c:when test="${empty board.next_board}">
        다음 글이 없습니다.
      </c:when>
      <c:otherwise>
        <span style="color: blue;">${board.next_board.title}</span>
      </c:otherwise>
    </c:choose>
  </a>
</div>
     				
					
					
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
