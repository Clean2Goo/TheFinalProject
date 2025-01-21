<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%request.setCharacterEncoding("UTF-8");%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<main class="ui-subpage">
	<section>
		<article>
			<div class="h3-title">
				<h3>전체회원 리스트</h3>
			</div>
			<div class="content">
				<div class="h4">
					<div class="h4-title">
						<h4>시스템 운영자</h4>
					</div>
					<div class="content">
						<div class="tabel data-grid">
							<table>
								<caption>시스템 운영자 회원목록 테이블</caption>
								<colgroup>
										<col width="">
										<col width="">
										<col width="">
										<col width="">
										<col width="">
										<col width="">
										<col width="">
										<col width="">
									<col>
								<thead>
									<tr>
										<th scope="col"><b>아이디</b></th>
										<th scope="col"><b>비밀번호</b></th>
										<th scope="col"><b>이름</b></th>
										<th scope="col"><b>휴대폰번호</b></th>
										<th scope="col"><b>유저타입</b></th>
										<th scope="col"><b>이메일</b></th>
										<th scope="col"><b>가입일</b></th>
										<th scope="col"><b>삭제</b></th>
									</tr>
								</thead>
								<tbody>
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
													<a class="ux-button button-table contained remove" href="${contextPath}/member/removeMember.do?id=${member.id}"><span class="label">회원삭제</span></a>
												</td>
											</tr>
										</c:if>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<div class="h4">
					<div class="h4-title">
						<h4>출장세차업자</h4>
					</div>
					<div class="content">
						<div class="tabel data-grid">
							<table>
								<caption>출장 세차업자 목록 테이블</caption>
								<colgroup>
										<col width="">
										<col width="">
										<col width="">
										<col width="">
										<col width="">
										<col width="">
										<col width="">
										<col width="">
									<col>
								<thead>
									<tr>
										<th scope="col"><b>아이디</b></th>
										<th scope="col"><b>비밀번호</b></th>
										<th scope="col"><b>이름</b></th>
										<th scope="col"><b>휴대폰번호</b></th>
										<th scope="col"><b>유저타입</b></th>
										<th scope="col"><b>이메일</b></th>
										<th scope="col"><b>가입일</b></th>
										<th scope="col"><b>삭제</b></th>
									</tr>
								</thead>
								<tbody>
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
													<a class="ux-button button-table contained remove" href="${contextPath}/member/removeMember.do?id=${member.id}"><span class="label">회원삭제</span></a>
												</td>
											</tr>
										</c:if>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<div class="h4">
					<div class="h4-title">
						<h4>세차장 관리자</h4>
					</div>
					<div class="content">
						<div class="tabel data-grid">
							<table>
								<caption>세차장 관리자 목록 테이블</caption>
								<colgroup>
										<col width="">
										<col width="">
										<col width="">
										<col width="">
										<col width="">
										<col width="">
										<col width="">
										<col width="">
									<col>
								<thead>
									<tr>
										<th scope="col"><b>아이디</b></th>
										<th scope="col"><b>비밀번호</b></th>
										<th scope="col"><b>이름</b></th>
										<th scope="col"><b>휴대폰번호</b></th>
										<th scope="col"><b>유저타입</b></th>
										<th scope="col"><b>이메일</b></th>
										<th scope="col"><b>가입일</b></th>
										<th scope="col"><b>삭제</b></th>
									</tr>
								</thead>
								<tbody>
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
													<a class="ux-button button-table contained remove" href="${contextPath}/member/removeMember.do?id=${member.id}"><span class="label">회원삭제</span></a>
												</td>
											</tr>
										</c:if>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<div class="h4">
					<div class="h4-title">
						<h4>세차장 직원</h4>
					</div>
					<div class="content">
						<div class="tabel data-grid">
							<table>
								<caption>세차장 직원 목록 테이블</caption>
								<colgroup>
										<col width="">
										<col width="">
										<col width="">
										<col width="">
										<col width="">
										<col width="">
										<col width="">
										<col width="">
									<col>
								<thead>
									<tr>
										<th scope="col"><b>아이디</b></th>
										<th scope="col"><b>비밀번호</b></th>
										<th scope="col"><b>이름</b></th>
										<th scope="col"><b>휴대폰번호</b></th>
										<th scope="col"><b>유저타입</b></th>
										<th scope="col"><b>이메일</b></th>
										<th scope="col"><b>가입일</b></th>
										<th scope="col"><b>삭제</b></th>
									</tr>
								</thead>
								<tbody>
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
													<a class="ux-button button-table contained remove" href="${contextPath}/member/removeMember.do?id=${member.id}"><span class="label">회원삭제</span></a>
												</td>
											</tr>
										</c:if>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<div class="h4">
					<div class="h4-title">
						<h4>고객</h4>
					</div>
					<div class="content">
						<div class="tabel data-grid">
							<table>
								<caption>고객 목록 테이블</caption>
								<colgroup>
										<col width="">
										<col width="">
										<col width="">
										<col width="">
										<col width="">
										<col width="">
										<col width="">
										<col width="">
									<col>
								<thead>
									<tr>
										<th scope="col"><b>아이디</b></th>
										<th scope="col"><b>비밀번호</b></th>
										<th scope="col"><b>이름</b></th>
										<th scope="col"><b>휴대폰번호</b></th>
										<th scope="col"><b>유저타입</b></th>
										<th scope="col"><b>이메일</b></th>
										<th scope="col"><b>가입일</b></th>
										<th scope="col"><b>삭제</b></th>
									</tr>
								</thead>
								<tbody>
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
													<a class="ux-button button-table contained remove" href="${contextPath}/member/removeMember.do?id=${member.id}"><span class="label">회원삭제</span></a>
												</td>
											</tr>
										</c:if>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</article>
	</section>
</main>