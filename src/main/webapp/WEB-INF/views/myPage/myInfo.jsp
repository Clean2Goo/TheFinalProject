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
                <div class="h4">
                    <!-- <div class="h4-title">
                        <h4>기본 정보</h4>
                    </div> -->
                    <div class="content">
						<div class="personal-info-list">
							<div class="profile-item">
								<span class="user-image">
									<img src="${contextPath}/resources/assets/images/profile/default.png" alt="프로필이미지">
								</span>
								<span class="user-name">${member.name}</span>
								<button type="button" class="ux-button contained button-table primary edit-btn" onclick="openPasswordPopup()"><span class="label">비밀번호 변경</span></button>
							</div>
							<div class="info-item">
								<span class="dt">생년월일</span>
								<span class="dd" id="dob-value">
									<c:choose>
										<c:when test="${empty member.dob}">정보 없음</c:when>
										<c:otherwise>${member.dob}</c:otherwise>
									</c:choose>
								</span>
								<button class="ux-button contained button-table primary edit-btn" onclick="openEditPopup('dob')"><span class="label">수정</span></button>
							</div>
							<div class="info-item">
								<span class="dt">휴대전화</span>
								<span class="dd" id="phone-value">
									<c:choose>
										<c:when test="${empty member.phone}">정보 없음</c:when>
										<c:otherwise>${member.phone}</c:otherwise>
									</c:choose>
								</span>
								<button class="ux-button contained button-table primary edit-btn" onclick="openEditPopup('phone')"><span class="label">수정</span></button>
							</div>
							<div class="info-item">
								<span class="dt">이메일</span>
								<span class="dd" id="email-value">
									<c:choose>
										<c:when test="${empty member.email}">정보 없음</c:when>
										<c:otherwise>${member.email}</c:otherwise>
									</c:choose>
								</span>
								<button class="ux-button contained button-table primary edit-btn" onclick="openEditPopup('email')"><span class="label">수정</span></button>
							</div>
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
		<button class="ux-button icon-menu popup-close-button" onclick="closeEditPopup()">
			<span class="icon"><i class="fa-solid fa-xmark"></i></span><span class="label">팝업 닫기</span>
		</button>
        <form class="ui-form write dialog" id="edit-form">
            <input type="hidden" id="edit-field">
			<ul>
				<li>
					<div class="field">
						<label class="label" id="edit-label"></label>
						<div class="ui-input">
							<div class="input outlined">
								<input type="text" id="edit-value" required>
							</div>
						</div>
					</div>
				</li>
				<li>
					<div class="ux-button-bar">
						<button type="button" class="ux-button contained primary" onclick="updateField()"><span class="label">수정</span></button>
					</div>
				</li>
			</ul>
        </form>
    </div>
</div>

<!-- 비밀번호 변경 모달 팝업 -->
<div id="password-modal" class="modal">
    <div class="modal-content">
		<button class="ux-button icon-menu popup-close-button" onclick="closePasswordPopup()">
			<span class="icon"><i class="fa-solid fa-xmark"></i></span><span class="label">팝업 닫기</span>
		</button>
        <form class="ui-form write dialog" id="password-form">
			<ul>
				<li>
					<div class="field">
						<label class="label" for="current-password">현재 비밀번호</label>
						<div class="ui-input">
							<div class="input outlined">
								<input type="password" id="current-password" required>
							</div>
						</div>
					</div>
				</li>
				<li>
					<div class="field">
						<label class="label" for="new-password">새 비밀번호</label>
						<div class="ui-input">
							<div class="input outlined">
								<input type="password" id="new-password" required>
							</div>
						</div>
					</div>
				</li>
				<li>
					<div class="ux-button-bar">
						<button type="button" class="ux-button contained primary" onclick="updatePassword()"><span class="label">비밀번호 변경</span></button>
					</div>
				</li>
			</ul>
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

        let currentValue = document.getElementById(field + '-value').textContent.trim();
        if (currentValue === '정보 없음') currentValue = '';  // 정보 없음일 경우 빈 값으로 초기화
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
        const value = document.getElementById('edit-value').value || '정보 없음'; // 빈 값일 경우 정보 없음으로 설정

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
        .then(response => response.json())
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

        fetch(`${contextPath}/member/updatePassword`, {
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
