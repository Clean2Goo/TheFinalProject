<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title><tiles:insertAttribute name="title" /></title>

	<link rel="stylesheet" href="${contextPath}/resources/assets/css/header.css">
	<link rel="stylesheet" href="${contextPath}/resources/assets/css/main.css">
	<link rel="stylesheet" href="${contextPath}/resources/assets/css/footer.css">
	<link rel="stylesheet" href="${contextPath}/resources/assets/css/loginForm.css">
	<link rel="stylesheet" href="${contextPath}/resources/assets/css/memberForm.css">
	<link rel="stylesheet" href="${contextPath}/resources/assets/css/myPage.css">
	
 	<link rel="stylesheet" href="${contextPath}/resources/assets/css/viewNotice.css"> 
	<link rel="stylesheet" href="${contextPath}/resources/assets/css/writeFrom.css">
	<link rel="stylesheet" href="${contextPath}/resources/assets/css/explore.css">

	<script src="http://code.jquery.com/jquery-latest.js"></script>

	<style>
		* {margin: 0;padding: 0;box-sizing: border-box;font-family: Arial, sans-serif;}
		html,body {width:100%; height:100%;background-color: #f5f8fa;color: #333;}
		ul,ol {list-style:none;}
		a {text-decoration: none;cursor: pointer;}
		#container {display:flex; flex-direction:column;}
		#container #header header {padding: 20px 160px;}
		#container #content {min-height: calc(100vh - 128px - 304px);}
		#container #content main:not(.ui-search-map) {width:100%;padding: 60px 160px;}
		#container #content main > section > article {display: flex;flex-direction: column;align-items: center;}
		#container #content main > section > article div {width:100%}
		#container #footer {}
	</style>
</head>

<body>
	<div id="container">
		<div id="header">
			<tiles:insertAttribute name="header" />
		</div>
		<div id="content">
			<tiles:insertAttribute name="body" />
		</div>
		<div id="footer">
			<tiles:insertAttribute name="footer" />
		</div>
	</div>
	<script>
	    document.addEventListener('DOMContentLoaded', function () {
	        const userIcon = document.querySelector('.user_icon');
	        const dropdownMenu = document.querySelector('.dropdown-menu');

	        // 사용자 아이콘 클릭 시 드롭다운 토글
	        userIcon.addEventListener('click', function (event) {
	            event.stopPropagation(); // 클릭 이벤트가 부모 요소로 전파되지 않도록
	            // 드롭다운 메뉴 표시/숨기기
	            dropdownMenu.style.display = dropdownMenu.style.display === 'block' ? 'none' : 'block';
	        });

	        // 페이지 다른 곳을 클릭하면 드롭다운 메뉴 숨기기
	        document.addEventListener('click', function () {
	            dropdownMenu.style.display = 'none';
	        });
	    });
	</script>
</body>
</html>