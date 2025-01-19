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

	<!-- contextPath 변수 선언 -->
	<script type="text/javascript">var contextPath = "${contextPath}";</script>
	<!-- common.js 고객, 어드민 공통 -->
	<script type="text/javascript" src="${contextPath}/resources/js/common.js"></script>

	<!-- 고객용 플러그인-->
	<script src="https://unpkg.com/typeit@8.3.3/dist/index.umd.js"></script>
	<!--onlyCustomer.js 고객용 -->
	<script type="text/javascript" src="${contextPath}/resources/js/onlyCustomer.js"></script>

	<!-- 백엔드 취합 후 수정 필요한 css -->
	<link rel="stylesheet" href="${contextPath}/resources/assets/css/myPage.css">
	<link rel="stylesheet" href="${contextPath}/resources/assets/css/favorites.css">
	<link rel="stylesheet" href="${contextPath}/resources/assets/css/aside.css">
	

	

	<!-- <link rel="stylesheet" href="${contextPath}/resources/assets/css/explore.css"> 임시주석 : 현재 expolore.jsp에서 다이렉트 로드 중 추후 병합예정 -->
</head>
<style>
.myPage-container #content {display:flex;min-height: calc(100vh - 168px);padding :112px 0 0;}
.myPage-container header article {width: calc(100vw - 80px);}
.myPage-container header .logo .h1 {font-size: 1.8rem;}

aside section article {width: auto;}

.myPage-container main {padding:40px 210px 40px 80px;}
.myPage-container main.ui-sign {justify-content: center;}
.myPage-container main > section,
.myPage-container main:not(.ui-sign) > section > article {min-width: 100% !important;}
.myPage-container main > section > article div {width:100%}

</style>
<body>
	<div id="container" class="myPage-container">
		<div id="header">
			<tiles:insertAttribute name="header" />
		</div>
		<div id="content">
            <c:choose>
                <c:when test="${isLogOn == true}">
                    <aside id="aside">
                        <tiles:insertAttribute name="aside" />
                    </aside>
                </c:when>
            </c:choose>
			<tiles:insertAttribute name="body" />
        </div>
		<div id="footer">
			<tiles:insertAttribute name="footer" />
		</div>
	</div>
</body>
</html>