<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%request.setCharacterEncoding("UTF-8");%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<main>
	<section>
		<article>
			<div class="sign-container">
				<h1 class="text_center">어드민 회원가입</h1>
				<form method="post" action="${contextPath}/member/adminAddMember.do">
					<table class="memF_table">
						<tr>
							<td class="memF_td" ><p align="right">가입 구분</p></td>
							<td class="memF_td">
								<select name="userType">
									<option value="washAdmin">세차장 관리자</option>
									<option value="washStaff">세차장 직원</option>
									<option value="washVisitor">출장세차업자</option>
									<!-- <option value="systemOperator">시스템운영자</option> -->
								</select>
							</td>
						</tr>
						<tr>
							<td class="memF_td"><p align="right">아이디</p></td>
							<td class="memF_td"><input type="text" name="id" required></td>
						</tr>
						<tr>
							<td class="memF_td"><p align="right">비밀번호</p></td>
							<td class="memF_td"><input type="password" name="pwd" required></td>
						</tr>
						<tr>
							<td class="memF_td"><p align="right">이름</p></td>
							<td class="memF_td"><input type="text" name="name" required></td>
						</tr>
						<tr>
							<td class="memF_td"><p align="right">이메일</p></td>
							<td class="memF_td"><input type="text" name="email" required></td>
						</tr>
						<tr>
							<td class="memF_td"><p align="right">전화번호</p></td>
							<td class="memF_td"><input type="text" name="phone" placeholder="010-1234-5678" required></td>
						</tr>
						<tr>
							<td ></td>
							<td class="memF_td">
								<input type="submit" value="가입하기">
								<input type="reset" value="다시입력">
							</td>
						</tr>
					</table>
				</form>
			</div>
		</article>
	</section>
</main>