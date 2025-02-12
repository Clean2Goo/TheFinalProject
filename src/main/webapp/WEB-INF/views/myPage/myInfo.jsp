<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<% request.setCharacterEncoding("UTF-8"); %>

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
                            <button type="button" class="edit-btn" onclick="openPasswordPopup()">비밀번호 변경</button>
                        </div>
                        <div class="info-item">
                            <span class="label">생년월일</span>
                            <span class="value" id="dob-value">${member.dob}</span>
                            <button class="edit-btn" onclick="openEditPopup('dob')">수정</button>
                        </div>
                        <div class="info-item">
                            <span class="label">휴대전화</span>
                            <span class="value" id="phone-value">${member.phone}</span>
                            <button class="edit-btn" onclick="openEditPopup('phone')">수정</button>
                        </div>
                        <div class="info-item">
                            <span class="label">이메일</span>
                            <span class="value" id="email-value">${member.email}</span>
                            <button class="edit-btn" onclick="openEditPopup('email')">수정</button>
                        </div>
                    </div>
                </div>
            </div>
        </article>
    </section>
</main>

<!-- 필드 수정 모달 팝업 -->
<div id="edit-modal" class="modal">
    <div class="modal-content">
        <span class="close-btn" onclick="closeEditPopup()">&times;</span>
        <form id="edit-form">
            <input type="hidden" id="edit-field">
            <div class="form-group">
                <label id="edit-label"></label>
                <input type="text" id="edit-value" required>
            </div>
            <button type="button" class="submit-btn" onclick="updateField()">수정</button>
        </form>
    </div>
</div>

<!-- 비밀번호 변경 모달 팝업 -->
<div id="password-modal" class="modal">
    <div class="modal-content">
        <span class="close-btn" onclick="closePasswordPopup()">&times;</span>
        <form id="password-form">
            <div class="form-group">
                <label for="current-password">현재 비밀번호</label>
                <input type="password" id="current-password" required>
            </div>
            <div class="form-group">
                <label for="new-password">새 비밀번호</label>
                <input type="password" id="new-password" required>
            </div>
            <button type="button" class="submit-btn" onclick="updatePassword()">비밀번호 변경</button>
        </form>
    </div>
</div>

<script>
    function openEditPopup(field) {
        const fieldMap = {
            "dob": "생년월일",
            "phone": "휴대전화",
            "email": "이메일"
        };

        document.getElementById('edit-label').textContent = fieldMap[field];
        document.getElementById('edit-field').value = field;

        const currentValue = document.getElementById(field + '-value').textContent;
        if (field === 'dob') {
            document.getElementById('edit-value').type = 'date';
        } else {
            document.getElementById('edit-value').type = 'text';
        }
        document.getElementById('edit-value').value = currentValue;

        document.getElementById('edit-modal').style.display = 'block';
    }

    function closeEditPopup() {
        document.getElementById('edit-modal').style.display = 'none';
    }

    function updateField() {
        const field = document.getElementById('edit-field').value;
        const value = document.getElementById('edit-value').value;

        if (!value) {
            alert('값을 입력해 주세요.');
            return;
        }

        fetch(`${contextPath}/member/updateMemberInfo`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            },
            body: new URLSearchParams({
                field: field,
                value: value
            })
        })
        .then(response => {
            if (!response.ok) {
                throw new Error(`HTTP error! status: ${response.status}`);
            }
            return response.json();
        })
        .then(result => {
            if (result.success) {
                document.getElementById(field + '-value').textContent = value;
                closeEditPopup();
                alert('정보가 성공적으로 수정되었습니다.');
            } else {
                alert('수정 실패: ' + result.message);
            }
        })
        .catch(error => {
            console.error('수정 오류:', error);
            alert('수정 중 오류가 발생했습니다.');
        });
    }


    function openPasswordPopup() {
        document.getElementById('password-modal').style.display = 'block';
    }

    function closePasswordPopup() {
        document.getElementById('password-modal').style.display = 'none';
    }

    function updatePassword() {
        const currentPassword = document.getElementById('current-password').value;
        const newPassword = document.getElementById('new-password').value;

        if (!currentPassword || !newPassword) {
            alert('현재 비밀번호와 새 비밀번호를 모두 입력해 주세요.');
            return;
        }

        fetch('${contextPath}/member/updatePassword', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                currentPassword: currentPassword,
                newPassword: newPassword
            })
        })
        .then(response => response.json())
        .then(result => {
            alert(result.message);
            if (result.success) {
                closePasswordPopup();
            }
        })
        .catch(error => {
            console.error('비밀번호 변경 오류:', error);
            alert('비밀번호 변경 중 오류가 발생했습니다.');
        });
    }
</script>
