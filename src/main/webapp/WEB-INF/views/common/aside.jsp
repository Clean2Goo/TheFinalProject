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
				<div class="aside-user-info">
                    <div class="aside-user-image">
                        <img src="${contextPath}/resources/assets/images/profile/default.png" alt="프로필 이미지">
                    </div>
                    <c:choose>
                        <c:when test="${isLogOn == true && member != null}">
                            <h4>${member.id}</h4>
                            <p class="user-type">${member.userType}</p>
                            <p class="user-rank">${member.rank}</p>
                        </c:when>
                    </c:choose>
                </div>
				<ul>
					<li>
						<a href="${contextPath}/myPage/myInfo.do" class="ux-link ${activeMenu == 'myInfo' ? 'active' : ''}">개인정보</a>
					</li>
					<li>
						<a href="${contextPath}/myPage/favorites.do" class="ux-link ${activeMenu == 'favorites' ? 'active' : ''}">즐겨찾기</a>
					</li>
					<li>
						<a href="${contextPath}/myPage/listReservations.do" class="ux-link ${activeMenu == 'listreservations' ? 'active' : ''}">예약내역</a>
					</li>
					<li>
						<a href="${contextPath}/myReviews.do" class="ux-link ${activeMenu == 'myReviews' ? 'active' : ''}">리뷰내역</a>
					</li>
					<li>
						<a href="${contextPath}/myPage/benefit.do" class="ux-link ${activeMenu == 'benefit' ? 'active' : ''}">등급혜택</a>
					</li>
				</ul>
			</div>
		</div>
	</article>
</section>
