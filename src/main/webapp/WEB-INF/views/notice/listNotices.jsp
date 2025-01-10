<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />


<main>
	<section>
		<article>
			<div class="notice-list-container">
				<h1>공지사항 목록</h1>
				<!-- 공지사항 작성 버튼 (관리자만 보임) -->
				<c:if test="${member.userType == 'systemOperator'}">
					<a href="${contextPath}/notice/adminWriteForm.do"" class="notice-write-btn">공지사항 작성</a>
				</c:if>
				<!-- 공지사항 테이블 -->
				<table class="notice-table">
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<c:if test="${member.userType == 'systemOperator'}">
								<th>게시물관리</th>
							</c:if>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${noticesList}" var="notice">
							<tr>
								<td>${notice.noticeno}</td>
								<td>
									
									<!-- 고객 -->
									<c:if test="${member.userType == 'customer'}">
										 <a href="${contextPath}/notice/viewNotice.do?noticeno=${notice.noticeno}">
											 ${notice.title}
										 </a>
									</c:if>
									<!-- 어드민 -->
									<c:if test="${member.userType != 'customer'}">
										 <a href="${contextPath}/notice/adminViewNotice.do?noticeno=${notice.noticeno}">
											 ${notice.title}
										 </a>
									</c:if>
								</td>
								<td>${notice.id}</td>
								<td>${notice.writedate}</td>
								<!-- 게시글 삭제 (슈퍼 관리자만 보임) -->
								<c:if test="${member.userType == 'systemOperator'}">
									<td>
										<form action="${contextPath}/notice/adminDeleteNotice.do" method="post" style="display: inline;">
											<input type="hidden" name="noticeno" value="${notice.noticeno}" />
											<button type="submit" class="delete-btn">삭제</button>
										</form>
									</td>
								</c:if>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</article>
	</section>
</main>
