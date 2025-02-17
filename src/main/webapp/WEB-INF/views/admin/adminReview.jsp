<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% request.setCharacterEncoding("UTF-8"); %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />


<main>
	<section>
		<article>
			<div class="h3-title">
				<h3>리뷰 확인</h3>
			</div>
			<div class="content">
				<div class="data-grid">

					<table id="reviewTable">
						<caption>고객이 작성한 리뷰 테이블</caption>
						<colgroup>
							<col class="col-8">
							<col class="col-auto">
							<col class="col-auto">
							<col class="col-8">
							<col class="">
						</colgroup>
						<thead>
							<tr>
								<th>작성자 ID</th>
								<th>세차장 이름</th>
								<th>리뷰 내용</th>
								<th>리뷰 점수</th>
								<th>작성일</th>
							</tr>
						</thead>
						<tbody>
							<!-- JS로 데이터가 채워질 예정 -->
						</tbody>
					</table>
				</div>
			</div>
		</article>
	</section>
</main>

<script src="${contextPath}/resources/js/adminReview.js"></script>
