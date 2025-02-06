<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<link rel="stylesheet" href="${contextPath}/resources/assets/css/listNotice.css">

<main>
	<section>
		<article>
			<div class="h3-title">
				<h3>공지사항</h3>
			</div>
			<div class="content">
				 <div class="data-grid">
					 <table>
						<caption>공지사항</caption>
						<colgroup>
							<col class="">
							<col class="">
							<col class="">
							<col class="">
							<col class="">
						</colgroup>
						 <thead>
							 <tr>
								<th>번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>등록일</th>
								<!-- 게시글 삭제 (슈퍼 관리자만 보임) -->
								 <c:if test="${member.userType == 'systemOperator'}">
									 <th>게시물관리</th>
								 </c:if>
							 </tr>
						 </thead>
						 <tbody>
							<c:if test="${empty noticesList}">
								<tr>
									<td colspan="${isLogOn && member.userType != 'customer' ? 5 : 4}">공지사항이 없습니다.</td>
								</tr>
							</c:if>
							<c:if test="${not empty noticesList}">
								<c:forEach items="${noticesList}" var="notice">
									<tr>
										<td>${notice.noticeno}</td>
										<td class="subject">
											<!-- 고객 / 로그인정보 없을시 -->
											<c:if test="${!isLogOn || member.userType == 'customer'}">
												<a href="${contextPath}/notice/viewNotice.do?noticeno=${notice.noticeno}">
													${notice.title}
												</a>
											</c:if>
											<!-- 어드민: 로그인했을 때만 표시 -->
											<c:if test="${isLogOn && member.userType != 'customer'}">
												<a href="${contextPath}/notice/adminViewNotice.do?noticeno=${notice.noticeno}">
													${notice.title}
												</a>
											</c:if>
										</td>
										<td>${notice.id}</td>
										<td>${notice.writedate}</td>
										<!-- 게시글 삭제 (슈퍼 관리자만 보임) -->
										<c:if test="${not empty member.userType && member.userType == 'systemOperator'}">
											<td>
												<form action="${contextPath}/notice/adminDeleteNotice.do" method="post" style="display: inline;">
													<input type="hidden" name="noticeno" value="${notice.noticeno}" />
													<button type="submit" class="ux-button button-table contained remove"><span class="label">삭제</span></button>
												</form>
											</td>
										</c:if>
									</tr>
								</c:forEach>
							 </c:if>
						 </tbody>
					 </table>
				 </div>
				<!-- 공지사항 등록 버튼 -->
				<c:if test="${member.userType == 'systemOperator'}">
					<div class="ux-button-bar">
						<a href="${contextPath}/notice/adminWriteForm.do" class="ux-button contained primary" role="button"><span class="label">공지사항 등록하기</span></a>
					</div>
				</c:if>
			</div>
		</article>
	</section>
</main>