<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
   request.setCharacterEncoding("UTF-8");
%>

<c:choose>
	<c:when test="${result=='loginFailed' }">
	  <script>
	    window.onload=function(){
	      alert("아이디나 비밀번호가 틀립니다.다시 로그인 하세요!");
	    }
	  </script>
	</c:when>
</c:choose>

<main class="ui-sign">
	<section>
		<article>
			<div class="h3-title">
				<h3>로그인</h3>
			</div>
			<div class="content">
				<form class="ui-form sign" name="frmLogin" method="post" action="${contextPath}/member/login.do">
					<fieldset>
						<ul>
							<li>
								<div class="field ">
									<label class="label clipped" for="id">아이디 입력</label>
									<div class="ui-input">
										<div class="input outlined">
											<input name="id" type="text" class="custom-text" placeholder="아이디를 입력하세요." required>
										</div>
									</div>
								</div>
							</li>
							<li>
								<div class="field">
									<label class="label clipped" for="pwd">비밀번호 입력</label>
									<div class="ui-input">
										<div class="input outlined">
											<input name="pwd" type="password" class="custom-text" placeholder="비밀번호를 입력해주세요." required>
										</div>
									</div>
								</div>
							</li>
							<li>
								<div class="ux-button-bar">
									<button class="ux-button contained primary" type="submit">
										<span class="label">로그인</span>
									</button>
								</div>
							</li>
							<li>
								<div class="ux-button-bar center">
									<a href="#" class="ux-button text-button" type="button">
										<span class="label">아이디 찾기</span>
									</a>
									<a href="#" class="ux-button text-button" type="button">
										<span class="label">비밀번호 찾기</span>
									</a>
									<a href="${contextPath}/member/memberForm.do" class="ux-button text-button" type="button">
										<span class="label bold">회원가입</span>
									</a>
								</div>
							</li>
							<!-- <li>
								<div class="ux-divider"></div>
							</li>
							<li>
								<div class="ux-button-bar column">
									<button class="ux-button outlined social google">
										<span class="icon"></span><span class="label">구글 로그인</span>
									</button>
									<button class="ux-button contained social naver">
										<span class="icon"></span><span class="label">네이버 로그인</span>
									</button>
									<button class="ux-button contained social kakao">
										<span class="icon"></span><span class="label">카카오 로그인</span>
									</button>
								</div>
							</li> -->
						</ul>
					</fieldset>
				</form>
			</div>
		</article>
	</section>
</main>

