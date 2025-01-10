<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%request.setCharacterEncoding("UTF-8");%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<main>
	<section>
		<article>
			<div>
				<h2 align="center">회원 타입 - 시스템 운영자</h2>
				<table border="1" align="center" width="80%">
					<tr align="center" bgcolor="lightgreen">
						<td><b>아이디</b></td>
						<td><b>비밀번호</b></td>
						<td><b>이름</b></td>
						<td><b>휴대폰번호</b></td>
						<td><b>유저타입</b></td>
						<td><b>이메일</b></td>
						<td><b>가입일</b></td>
						<td><b>삭제</b></td>
					</tr>
					<c:forEach var="member" items="${membersList}">
						<c:if test="${member.userType == 'systemOperator'}">
							<tr align="center">
								<td>${member.id}</td>
								<td>${member.pwd}</td>
								<td>${member.name}</td>
								<td>${member.phone}</td>
								<td>${member.userType}</td>
								<td>${member.email}</td>
								<td>${member.joinDate}</td>
								<td>
									<a href="${contextPath}/member/removeMember.do?id=${member.id}">삭제하기</a>
								</td>
							</tr>
						</c:if>
					</c:forEach>
				</table>

				<h2 align="center">회원 타입 - 출장세차업자</h2>
				<table border="1" align="center" width="80%">
					<tr align="center" bgcolor="lightgreen">
						<td><b>아이디</b></td>
						<td><b>비밀번호</b></td>
						<td><b>이름</b></td>
						<td><b>휴대폰번호</b></td>
						<td><b>유저타입</b></td>
						<td><b>이메일</b></td>
						<td><b>가입일</b></td>
						<td><b>삭제</b></td>
					</tr>
					<c:forEach var="member" items="${membersList}">
						<c:if test="${member.userType == 'washVisitor'}">
							<tr align="center">
								<td>${member.id}</td>
								<td>${member.pwd}</td>
								<td>${member.name}</td>
								<td>${member.phone}</td>
								<td>${member.userType}</td>
								<td>${member.email}</td>
								<td>${member.joinDate}</td>
								<td>
									<a href="${contextPath}/member/removeMember.do?id=${member.id}">삭제하기</a>
								</td>
							</tr>
						</c:if>
					</c:forEach>
				</table>
				<h2 align="center">회원 타입 - 세차장 관리자</h2>
				<table border="1" align="center" width="80%">
					<tr align="center" bgcolor="lightgreen">
						<td><b>아이디</b></td>
						<td><b>비밀번호</b></td>
						<td><b>이름</b></td>
						<td><b>휴대폰번호</b></td>
						<td><b>유저타입</b></td>
						<td><b>이메일</b></td>
						<td><b>가입일</b></td>
						<td><b>삭제</b></td>
					</tr>
					<c:forEach var="member" items="${membersList}">
						<c:if test="${member.userType == 'washAdmin'}">
							<tr align="center">
								<td>${member.id}</td>
								<td>${member.pwd}</td>
								<td>${member.name}</td>
								<td>${member.phone}</td>
								<td>${member.userType}</td>
								<td>${member.email}</td>
								<td>${member.joinDate}</td>
								<td>
									<a href="${contextPath}/member/removeMember.do?id=${member.id}">삭제하기</a>
								</td>
							</tr>
						</c:if>
					</c:forEach>
				</table>

				<h2 align="center">회원 타입 - 세차장 직원</h2>
				<table border="1" align="center" width="80%">
					<tr align="center" bgcolor="lightgreen">
						<td><b>아이디</b></td>
						<td><b>비밀번호</b></td>
						<td><b>이름</b></td>
						<td><b>휴대폰번호</b></td>
						<td><b>유저타입</b></td>
						<td><b>이메일</b></td>
						<td><b>가입일</b></td>
						<td><b>삭제</b></td>
					</tr>
					<c:forEach var="member" items="${membersList}">
						<c:if test="${member.userType == 'washStaff'}">
							<tr align="center">
								<td>${member.id}</td>
								<td>${member.pwd}</td>
								<td>${member.name}</td>
								<td>${member.phone}</td>
								<td>${member.userType}</td>
								<td>${member.email}</td>
								<td>${member.joinDate}</td>
								<td>
									<a href="${contextPath}/member/removeMember.do?id=${member.id}">삭제하기</a>
								</td>
							</tr>
						</c:if>
					</c:forEach>
				</table>

				<h2 align="center">회원 타입 - 고객</h2>
				<table border="1" align="center" width="80%">
					<tr align="center" bgcolor="lightgreen">
						<td><b>아이디</b></td>
						<td><b>비밀번호</b></td>
						<td><b>이름</b></td>
						<td><b>휴대폰번호</b></td>
						<td><b>유저타입</b></td>
						<td><b>이메일</b></td>
						<td><b>가입일</b></td>
						<td><b>삭제</b></td>
					</tr>
					<c:forEach var="member" items="${membersList}">
						<c:if test="${member.userType == 'customer'}">
							<tr align="center">
								<td>${member.id}</td>
								<td>${member.pwd}</td>
								<td>${member.name}</td>
								<td>${member.phone}</td>
								<td>${member.userType}</td>
								<td>${member.email}</td>
								<td>${member.joinDate}</td>
								<td>
									<a href="${contextPath}/member/removeMember.do?id=${member.id}">삭제하기</a>
								</td>
							</tr>
						</c:if>
					</c:forEach>
				</table>
			</div>
		</article>
	</section>
</main>
</body>
</html>
