function showConfirm(message, onConfirm) {
	if (confirm(message)) {
		onConfirm(); // 확인을 클릭한 경우
	}
}

$(document).ready(function () {
	function checkLogin(event) {
		console.log("isLoggedIn:", isLoggedIn); // 값 확인
		if (isLoggedIn === true || isLoggedIn === "true") {
			// boolean 또는 문자열 비교
			return true; // 로그인 상태일 경우
		} else {
			var message = "예약하기는 로그인 후 이용 가능합니다!";
			event.preventDefault(); //폼 제출 방지
			showConfirm(message + "\n로그인 페이지로 이동하시겠습니까?", function () {
				window.location.href = contextPath + "/member/loginForm.do"; // 확인 클릭 시 로그인 페이지로 이동
			});
			return false; // 로그인하지 않은 경우 false 반환
		}
	}

	$("form.check-login-form").on("submit", function (event) {
		console.log("폼 제출 시도"); // 디버깅 로그 추가
		if (!checkLogin(event)) {
			console.log("로그인하지 않은 상태로 폼 제출 방지"); // 로그 추가
		} else {
			console.log("로그인 상태로 폼 제출 진행"); // 로그 추가
			// 여기서 폼이 제출되도록 아무것도 하지 않음
		}
	});
});
