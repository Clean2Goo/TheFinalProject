<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  request.setCharacterEncoding("UTF-8");
%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <link rel="stylesheet" href="${contextPath}/resources/assets/css/header.css">
<title>헤더</title>
</head>
<body>
<header>
<table border=0 width="100%">
  <tr>
     <td width="30%">
		<a href="${contextPath}/main.do">
			<img src="${contextPath}/resources/assets/images/logo.png" height="80"/>
		</a>
     </td>

     <td>
	      <nav>
            <ul class="nav-menu">
                <li><a href="#">시스템소개</a></li>
                <li class="services">
                    <a href="#">서비스</a>
                    <ul class="dropdown">
                        <li><a href="${contextPath}/explore.do">기계 세차</a></li>
                        <li><a href="#">셀프 세차</a></li>
                        <li><a href="#">전문가 세차</a></li>
                        <li><a href="#">출장 세차</a></li>
                    </ul>
                </li>
                <li><a href="#">쇼핑몰</a></li>
                <li><a href="#">혜택 이벤트</a></li>
                <li class="customer-support">
                    <a href="#">고객지원</a>
                    <ul class="dropdown">
                        <li><a href="#">FAQ</a></li>
                        <li><a href="#">고객센터</a></li>
                        <li><a href="${contextPath}/notice/listNotices.do">공지사항</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
     </td>






   <!-- <a href="#"><h3>로그인</h3></a> -->
     <td width="10%">
     <c:choose>
     <c:when test="${isLogOn == true  && member!= null}">
     <div class="user-menu">
     	<img src="${contextPath}/resources/assets/images/notification_icon.png" height="40" class="notification_icon">
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
          <button class="login-button">
	        <a href="${contextPath}/member/loginForm.do">로그인</a></li>
	      </c:otherwise>
	   </c:choose>
     </td>
  </tr>
</table>

</header>
</body>
</html>
