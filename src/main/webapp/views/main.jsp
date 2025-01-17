<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"   isELIgnored="false"  %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<%
  request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>메인 페이지</title>
  <script src="http://code.jquery.com/jquery-latest.js"></script>
  <link rel="stylesheet" href="${contextPath}/resources/assets/css/main.css">
</head>
<body>
	<div class="background">
    	<div class="menu">
    		<ul class="cf">
	        <li>
	            <a href="${contextPath}/explore.do">
	            	<img src="${contextPath}/resources/assets/images/machine.png" alt="기계세차 아이콘">
	            </a>
	            <div class="ment"> 기계세차</div>
	        </li>
	        <li>
	            <a href="#">
	            	<img src="${contextPath}/resources/assets/images/self.png" alt="셀프세차 아이콘">
	            </a>
	            <div class="ment"> 셀프세차</div>
	        </li>
	        <li>
	            <a href="#">
	            	<img src="${contextPath}/resources/assets/images/pro.png" alt="전문가세차 아이콘">
	            </a>
	            <div class="ment"> 전문가세차</div>
	        </li>
	        <li>
	            <a href="#">
	            	<img src="${contextPath}/resources/assets/images/visit.png" alt="출장세차 아이콘">
	            </a>
	            <div class="ment"> 출장세차</div>
	        </li>
	        </ul>
        </div>
    </div>
</body>
</html>