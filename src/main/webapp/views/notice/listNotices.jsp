<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>공지사항 목록</title>
    <link rel="stylesheet" href="${contextPath}/resources/assets/css/listNotice.css">
</head>
<body>
    <div class="notice-list-container">
        <h1>공지사항 목록</h1>

        <!-- 공지사항 작성 버튼 (관리자만 보임) -->
        <c:if test="${member.userType == 'systemOperator'}">
            <a href="${contextPath}/notice/writeForm.do" class="notice-write-btn">공지사항 작성</a>
        </c:if>

        <!-- 공지사항 테이블 -->
        <table class="notice-table">
            <thead>
                <tr>
                    <th>번호</th>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>작성일</th>
                    <th>액션</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${noticesList}" var="notice">
                    <tr>
                        <td>${notice.noticeno}</td>
                        <td>
                            <a href="${pageContext.request.contextPath}/notice/viewNotice.do?noticeno=${notice.noticeno}">
                                ${notice.title}
                            </a>
                        </td>
                        <td>${notice.id}</td>
                        <td>${notice.writedate}</td>
                        <td>
                            <!-- 삭제 버튼 (관리자만 보임) -->
                            <c:if test="${member.userType == 'systemOperator'}">
                                <form action="${pageContext.request.contextPath}/notice/deleteNotice.do" method="post" style="display: inline;">
                                    <input type="hidden" name="noticeno" value="${notice.noticeno}" />
                                    <button type="submit" class="delete-btn">삭제</button>
                                </form>
                            </c:if>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
