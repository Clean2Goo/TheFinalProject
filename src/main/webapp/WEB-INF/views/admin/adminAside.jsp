<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="if" uri="http://java.sun.com/jsp/jstl/core"%>
<% request.setCharacterEncoding("UTF-8");%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<section>
	<article>
		<div class="content admin-menu">
			<c:choose>
				<c:when test="${isLogOn == true  && member!= null}">
					<div class="user-info-wrap">
						<h5>${member.name}님!</h5>
						<h6>${member.userType}</h6>
					</div>
				</c:when>
			</c:choose>
			<ul class="menu-list depth1">
				<c:if test="${isLogOn && member.userType == 'systemOperator'}">
					<li>
						<a href="${contextPath}/member/adminListMembers.do" class="ux-button text-button"><span class="label">전체회원 리스트</span></a>
					</li>
				</c:if>
				<li>
					<a href="${contextPath}/notice/adminListNotices.do" class="ux-button text-button"><span class="label">공지사항</span></a>
				</li>
				<c:if test="${isLogOn && member.userType == 'systemOperator'}">
					<li>
						<a href="${contextPath}/notice/adminWriteForm.do" class="ux-button text-button"><span class="label">공지사항 작성</span></a>
					</li>
				</c:if>
				<li>
					<a href="${contextPath}/board/adminListArticles.do" class="ux-button text-button"><span class="label">이벤트</span></a>
				</li>
				<c:if test="${isLogOn && member.userType == 'systemOperator'}">
					<li>
						<a href="${contextPath}/board/adminArticleForm.do" class="ux-button text-button"><span class="label">이벤트 작성</span></a>
					</li>
				</c:if>
				<li>
				    <a href="${contextPath}/faq/adminListFaqs.do" class="ux-button text-button">
				        <span class="label">자주 묻는 질문</span>
				    </a>
				</li>
				<c:if test="${isLogOn && member.userType == 'systemOperator'}">
				    <li>
				        <a href="${contextPath}/faq/adminWriteFaqForm.do" class="ux-button text-button">
				            <span class="label">자주 묻는 질문 작성</span>
				        </a>
				    </li>
				</c:if>


				<!-- 세자창 관리자 메뉴 -->
				<c:if test="${isLogOn && member.userType == 'washAdmin'}">
					<li>
						<a href="${contextPath}/manager.do" class="ux-button text-button"><span class="label">세차정보관리</span></a>
					</li>
					<li>
						<a href="#" class="ux-button text-button"><span class="label">직원관리</span></a>
					</li>
					<li>
						<a href="#" class="ux-button text-button"><span class="label">예약자관리</span></a>
						<ul class="menu-list depth2">
							<li>
								<a href="${contextPath}/admin/reservations.do" class="ux-button text-button">
					                <span class="label">- 예약현황판</span>
					            </a>
							</li>
							<li>
								<a href="#" class="ux-button text-button"><span class="label">- 예약신청자</span></a>
							</li>
						</ul>
					</li>
					<li>
					    <a href="${contextPath}/admin/reviewManagement" class="ux-button text-button">
					        <span class="label">리뷰확인</span>
					    </a>
					</li>
				</c:if>

			</ul>
			<div class="ux-button-bar">
				<button type="button" class="ux-button outlined"
					onclick="location.href='${contextPath}/member/adminLogout.do'">
					<span class="label">어드민-로그아웃</span>
				</button>
			</div>
		</div>
	</article>
</section>
