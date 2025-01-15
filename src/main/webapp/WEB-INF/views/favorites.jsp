<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="contextPath" content="${pageContext.request.contextPath}">
    <title>즐겨찾기 목록</title>
    <link rel="stylesheet" href="${contextPath}/resources/assets/css/favorites.css">
</head>

    <main>
        <h1>즐겨찾기 목록</h1>
        <button onclick="goBack()">뒤로가기</button>
    
    
        <div id="favorite-list" class="favorite-list">
           
        </div>
    </main>
    <script src="${contextPath}/resources/js/favorites.js"></script>

</html>