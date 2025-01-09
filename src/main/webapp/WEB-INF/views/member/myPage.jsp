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
  <title>마이 페이지</title>
  <script src="http://code.jquery.com/jquery-latest.js"></script>
  <link rel="stylesheet" href="${contextPath}/resources/assets/css/myPage.css">
</head>
<body>
    <main>
        <section class="mypage-container">
            <h2>기본 정보</h2>

            <!-- 회원 정보 표시 -->
            <div class="user-info">
                <div class="info-item">
                    <span class="label">사용자 ID</span> 
                    <span class="value">${member.id}</span>
                    <!-- 수정 버튼 추가 -->
                    <button class="edit-btn" onclick="location.href='${contextPath}/editProfile?id=${member.id}'">수정</button>
                </div>
                <div class="info-item">
                    <span class="label">사용자 비밀번호</span>
                    <span class="value">${member.pwd}</span>
                    <!-- 수정 버튼 추가 -->
                    <button class="edit-btn" onclick="location.href='${contextPath}/editProfile?id=${member.id}'">수정</button>
                </div>
                <div class="info-item">
                    <span class="label">사용자 이름</span>
                    <span class="value">${member.name}</span>
                    <!-- 수정 버튼 추가 -->
                    <button class="edit-btn" onclick="location.href='${contextPath}/editProfile?id=${member.id}'">수정</button>
                </div>
                <div class="info-item">
                    <span class="label">사용자 번호</span>
                    <span class="value">${member.phone}</span>
                    <!-- 수정 버튼 추가 -->
                    <button class="edit-btn" onclick="location.href='${contextPath}/editProfile?id=${member.id}'">수정</button>
                </div>
                <div class="info-item">
                    <span class="label">사용자 이메일</span>
                    <span class="value">${member.email}</span>
                    <!-- 수정 버튼 추가 -->
                    <button class="edit-btn" onclick="location.href='${contextPath}/editProfile?id=${member.id}'">수정</button>
                </div>
                <div class="info-item">
	                <span class="label">프로필 이미지</span>
	                <span class="value">
	                    <img src="${member.img}" alt="Profile Image" width="100" height="100" />
	                </span>
            	</div>	
            </div>
            <!-- 프로필 이미지 업로드 폼 -->
	        <form action="${contextPath}/member/updateProfileImage.do" method="post" enctype="multipart/form-data">
	            <label for="file">프로필 이미지 변경:</label>
	            <input type="file" name="file" id="file" required />
	            <button type="submit">업로드</button>
	        </form>
        </section>
    </main>
</body>
</html>