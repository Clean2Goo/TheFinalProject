<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html>
<html lang="ko">
	<head>
	    <meta charset="UTF-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <meta name="contextPath" content="${pageContext.request.contextPath}">
	    <title>즐겨찾기 목록</title>
	    <link rel="stylesheet" href="${contextPath}/resources/assets/css/favorites.css">
	</head>
	<main>
		<section>
		    <article>
			    <div class="h3-title">
					<h3>즐겨찾기</h3>
				</div>
				<div class="content">
					<div id="favorite-list" class="favorite-list"></div>
				</div>
			</article>
    	</section>
	</main>
	<script src="${contextPath}/resources/js/favorites.js"></script>
</html>