<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>공지사항 상세</title>
    <link rel="stylesheet" href="${contextPath}/resources/assets/css/viewNotice.css">
</head>
<body>
    <div class="notice-container">
        <div class="notice-box">
            <h1>${notice.title}</h1>
            <p><strong>작성자:</strong> ${notice.id}</p>
            <p><strong>작성일:</strong> ${notice.writedate}</p>
            <p>${notice.content}</p>
            <c:if test="${not empty notice.imagefilename}">
                <img src="${pageContext.request.contextPath}/resources/assets/images/${notice.imagefilename}" alt="첨부 이미지" />
            </c:if>
            <a class="back-button" href="${pageContext.request.contextPath}/notice/listNotices.do">목록으로 돌아가기</a>
        </div>
    </div>
</body>

</html>
