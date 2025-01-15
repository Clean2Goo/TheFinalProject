<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%request.setCharacterEncoding("UTF-8");%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />



<main class="ui-sign">
	<section>
		<article>
			<div class="h3-title">
				<h3>어드민 회원가입</h3>
			</div>
			<div class="content">
				<form class="ui-form sign" method="post" action="${contextPath}/member/adminAddMember.do">
					<fieldset>
						<ul>
							<li>
								<div class="field">
									<label class="label">구분</label>
									<div class="ui-input">
										<div class="input outlined">
											<select name="userType" class="selectmenu">
												<option value="washAdmin">세차장 관리자</option>
												<option value="washStaff">세차장 직원</option>
												<option value="washVisitor">출장세차업자</option>
												<!-- <option value="systemOperator">시스템운영자</option> -->
											</select>
									</div>
								</div>
							</li>
							<li>
								<div class="field ">
									<label class="label" for="id">아이디</label>
									<div class="ui-input">
										<div class="input outlined">
											<input name="id" type="text" class="custom-text" placeholder="아이디를 입력하세요." required>
										</div>
									</div>
								</div>
							</li>
							<li>
								<div class="field">
									<label class="label" for="pwd">비밀번호</label>
									<div class="ui-input">
										<div class="input outlined">
											<input name="pwd" type="password" class="custom-text" placeholder="비밀번호를 입력해주세요." required>
										</div>
										<!-- <div class="msg">
											<p>영문자, 숫자, 특수문자( !, @, #, $, %, ^, &, * ) 를 혼용하여 최소 8자, 최대 15자 이내로 작성되어야 합니다.</p>
											<p>아이디와 4자리 이상 일치하는 비밀번호는 사용이 불가합니다.</p>
											<p>동일한 숫자 또는 연속적으로 증감되는 숫자가 4자리 이상 포함된 비밀번호는 사용이 불가합니다.</p>
										</div> -->
									</div>
								</div>
							</li>
							<li>
								<div class="field">
									<label class="label" for="name">이름</label>
									<div class="ui-input">
										<div class="input outlined">
											<input name="name" type="text" class="custom-text" placeholder="이름을 입력해주세요." required>
										</div>
									</div>
								</div>
							</li>
							<li>
								<div class="field">
									<label class="label" for="phone">휴대폰번호</label>
									<div class="ui-input">
										<div class="input outlined">
											<input name="phone" type="text" class="custom-text" placeholder="휴대폰번호를 입력해주세요." required>
										</div>
									</div>
								</div>
							</li>
							<li>
								<div class="field">
									<label class="label" for="email">이메일</label>
									<div class="ui-input">
										<div class="input outlined">
											<input name="email" type="text" class="custom-text" placeholder="이메일을 입력해주세요." required>
										</div>
									</div>
								</div>
							</li>
							<li>
								<div class="ux-button-bar">
									<button class="ux-button outlined" type="reset">
										<span class="label">다시입력</span>
									</button>
									<button class="ux-button contained primary" type="submit">
										<span class="label">가입하기</span>
									</button>
								</div>
							</li>
						</ul>
					</fieldset>
				</form>
			</div>
		</article>
	</section>
</main>
