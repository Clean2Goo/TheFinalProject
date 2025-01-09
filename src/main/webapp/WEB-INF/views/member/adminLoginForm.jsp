<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="if" uri="http://java.sun.com/jsp/jstl/core"%>
<% request.setCharacterEncoding("UTF-8");%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<c:choose>
	<c:when test="${result=='loginFailed' }">
	  <script>
	    window.onload=function(){
	      alert("아이디나 비밀번호가 틀립니다.다시 로그인 하세요!");
	    }
	  </script>
	</c:when>
</c:choose>

<main>
	<section>
		<article>
			<div class="sign-container">
				<div class="login-header">
					<h1>어드민 로그인</h1>
				</div>
				<form name="frmLogin" method="post" action="${contextPath}/member/adminLoginForm.do">
					<table>
						<tr>
							<td>아이디</td>
							<td><input type="text" name="id" value="" placeholder="아이디를 입력하세요" required></td>
						</tr>
						<tr>
							<td>비밀번호</td>
							<td><input type="password" name="pwd" value="" placeholder="비밀번호를 입력하세요" required></td>
						</tr>
						<tr>
							<td colspan="2">
								<input type="submit" value="로그인">
								<input type="reset" value="다시입력">
							</td>
						</tr>
					</table>
				</form>

				<div class="signup-link">
					<p>회원이 아니신가요? <a href="${contextPath}/member/adminMemberForm.do">회원가입</a></p>
				</div>
			</div>

		</article>
	</section>
</main>

