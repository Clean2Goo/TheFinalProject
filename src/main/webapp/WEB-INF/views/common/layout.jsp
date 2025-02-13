<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta http-equiv="Content-Style-Type" content="text/css">
	<meta http-equiv="Content-Script-Type" content="text/javascript">
	<meta http-equiv="imagetoolbar" content="no">
	<meta name="format-detection" content="telephone=no">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, viewport-fit=cover">
	<meta name="apple-mobile-web-app-title" content="Default">
	<meta name="robots" content="no-index, follow">
	<meta name="title" content="">
	<meta name="author" content="">
	<meta name="content" content="">
	<meta name="keywords" content="">
	<meta name="description" content="Clean2Go description">

	<title><tiles:insertAttribute name="title" /></title>

	<link type="image/png" rel="shortcut icon" href="${contextPath}/resources/assets/images/favicon/favicon.png">
	<link type="text/css" rel="stylesheet" href="${contextPath}/resources/assets/css/font.css">
	<link type="text/css" rel="stylesheet" href="${contextPath}/resources/assets/css/common.css">
	<link type="text/css" rel="stylesheet" href="${contextPath}/resources//lib/jquery-ui-1.12.1.min.css">
	<link type="text/css" rel="stylesheet" href="${contextPath}/resources//lib/jquery-ui-1.12.1.theme.min.css">
	<link type="text/css" rel="stylesheet" href="${contextPath}/resources//lib/swiper-bundle.min.css">
	<script type="text/javascript" src="${contextPath}/resources/lib/jquery-1.12.4.min.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/lib/jquery-ui-1.12.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/swiper@latest/swiper-bundle.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

	<c:set var="isLoggedIn" value="${not empty member}" />
	<!-- contextPath 변수 선언 / isLoggedIn 로그인상태체크 변수 선언 -->
	<script type="text/javascript">
		var contextPath = "${contextPath}";
		var isLoggedIn = ${isLoggedIn ? 'true' : 'false'};
	</script>
	<!--confirm -->
	<script type="text/javascript" src="${contextPath}/resources/js/messageBox.js"></script>

	<!-- common.js 고객, 어드민 공통 -->
	<script type="text/javascript" src="${contextPath}/resources/js/common.js"></script>

	<!-- 고객용 플러그인 typeit-->
	<script src="https://unpkg.com/typeit@8.3.3/dist/index.umd.js"></script>
	<!--onlyCustomer.js typeit -->
	<script type="text/javascript" src="${contextPath}/resources/js/onlyCustomer.js"></script>

	<!-- 로티추가 -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bodymovin/5.7.6/lottie.min.js"></script>
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
</body>
</html>