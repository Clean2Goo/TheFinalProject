<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  request.setCharacterEncoding("UTF-8");
%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />


<header>
	<section>
		 <article>
		 	<table border=0 width="100%">
			  <tr>
			     <td width="20%">
					<a href="${contextPath}/main.do">
						<img src="${contextPath}/resources/assets/images/logo.png" height="80"/>
					</a>
			     </td>
			     <td>
			      	<nav>
			            <ul class="nav-menu">
			                <li><a href="#">회사소개</a></li>
	                        <li><a href="${contextPath}/explore.do">세차장탐색</a></li>
			                <li><a href="#">이벤트</a></li>
			                <li><a href="${contextPath}/notice/listNotices.do">공지사항</a></li>
			                <li><a href="#">자주묻는질문</a></li>
			            </ul>
			        </nav>
			     </td>
			     <td width="10%">
				     <c:choose>
					     <c:when test="${isLogOn == true  && member!= null}">
						     <div class="user-menu">
						        <img src="${contextPath}/resources/assets/images/user_icon.png" height="40"alt="User Menu" class="user_icon">
						        <ul class="dropdown-menu">
						        	<li>${member.id}</li>
						        	<li><img src="${contextPath}/resources/assets/images/user_icon.png" alt="User Icon" class="dropdown-user-icon"></li>
						            <li class="welcome-message">환영합니다, ${member.name}님.</li>
						            <li><a href="${contextPath}/member/myPage.do" class="mypage-button">마이페이지</a></li>
						            <li><a href="${contextPath}/member/logout.do" class="logout-button">로그아웃</a></li>
						        </ul>
						     </div>
					      </c:when>
				          <c:otherwise>
				          	<button class="login-button"><a href="${contextPath}/member/loginForm.do">로그인</a></button>
					      </c:otherwise>
					   </c:choose>
					</td>
			  	</tr>
			</table>
		 </article>
	</section>
</header>

