<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%request.setCharacterEncoding("UTF-8");%>

<main>
    <section>
	    <article>
		    <div class="h3-title">
				<h3>개인정보</h3>
			</div>
		    <div class="content">
		        <div class="mypage-container">
		       		<div class="h4-title">
						<h4>기본 정보</h4>
					</div>
			        <div class="content">
				    	<div class="profile-item">
						    <span class="user-image">
						        <img src="${contextPath}/resources/assets/images/profile/default.png" alt="프로필이미지">
						    </span>
						    <span class="user-name">${member.name}</span>
						    <button type="button" class="edit-btn" onclick="openPasswordModal()">비밀번호 변경</button>
						</div>
			            <div class="info-item">
			                <span class="label">생년월일</span>
			                <span class="value">${member.dob}</span>
			                <!-- 수정 버튼 추가 -->
			                <button class="edit-btn"
			                    onclick="location.href='${contextPath}/editProfile?id=${member.id}'">수정</button>
			            </div>
			            <div class="info-item">
			                <span class="label">휴대전화</span>
			                <span class="value">${member.phone}</span>
			                <!-- 수정 버튼 추가 -->
			                <button class="edit-btn"
			                    onclick="location.href='${contextPath}/editProfile?id=${member.id}'">수정</button>
			            </div>
			            <div class="info-item">
			                <span class="label">이메일</span>
			                <span class="value">${member.email}</span>
			                <!-- 수정 버튼 추가 -->
			                <button class="edit-btn"
			                    onclick="location.href='${contextPath}/editProfile?id=${member.id}'">수정</button>
			            </div>
					</div>
		        </div>
		        
		        <div class="mypage-container">
		       		<div class="h4-title">
						<h4>차량</h4>
					</div>
			        <div class="content">
			            <div class="info-item">
			                <span class="label">생년월일</span>
			                <span class="value">${member.dob}</span>
			                <!-- 수정 버튼 추가 -->
			                <button class="edit-btn"
			                    onclick="location.href='${contextPath}/editProfile?id=${member.id}'">수정</button>
			            </div>      
					</div>
		        </div>
		        
		        <div class="mypage-container">
		       		<div class="h4-title">
						<h4>주소</h4>
					</div>
			        <div class="content">
			            <div class="info-item">
			                <span class="label">생년월일</span>
			                <span class="value">${member.dob}</span>
			                <!-- 수정 버튼 추가 -->
			                <button class="edit-btn"
			                    onclick="location.href='${contextPath}/editProfile?id=${member.id}'">수정</button>
			            </div>
					</div>
		        </div>
	        </div>
	    </article>
    </section>
</main>

<!-- 비밀번호 변경 모달 -->
<div id="edit-modal" class="modal">
    <div class="modal-content">
        <span id="close-edit-modal" class="close">&times;</span>
        <h2>비밀번호 변경</h2>
        <form id="edit-form">
            <label for="current-password">현재 비밀번호</label>
            <input type="password" id="current-password" required>
            
            <label for="new-password">새 비밀번호</label>
            <input type="password" id="new-password" required>
            
            <label for="confirm-password">새 비밀번호 확인</label>
            <input type="password" id="confirm-password" required>
            
            <button type="submit">적용</button>
        </form>
    </div>
</div>

<script src="${contextPath}/resources/js/myInfo.js"></script>