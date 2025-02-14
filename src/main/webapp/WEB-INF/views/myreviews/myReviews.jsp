<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<main>
	<section id="review-list-container">
		<article>
			<div class="h3-title col">
				<h3>리뷰 내역</h3>
				<div class="ui-page-desc">
					<div class="middot-list">
						<ul>
							<li>예약건별로 작성한 리뷰를 수정하고 삭제 할 수 있습니다.</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="content">
				<div class="data-grid">
					<table>
						<caption>내가 작성한 리뷰내역 테이블</caption>
						<colgroup>
							<col class="col-16">
							<col class="col-auto">
							<col class="col-8">
							<col class="col-16">
							<col class="col-16">
						</colgroup>
						<thead>
							<tr>
								<th>세차장 이름</th>
								<th>리뷰 내용</th>
								<th>평점</th>
								<th>작성일</th>
								<th>관리</th>
							</tr>
						</thead>
						<tbody id="review-list">
							<!-- JavaScript로 동적 렌더링 -->
						</tbody>
					</table>
				</div>
			</div>
		</article>
	</section>
</main>

<!-- 리뷰 수정 모달 -->
<div id="edit-modal" class="popup modify-review">
	<div class="popup-container">
		<div class="popup-header">
			<div class="popup-title">
				<h5 id="popup-wash-name">리뷰 수정</h5>
			</div>
			<button id="close-edit-modal" class="ux-button icon-menu popup-close-button">
				<span class="icon"><i class="fa-solid fa-xmark"></i></span><span class="label">팝업 닫기</span>
			</button>
		</div>
		<div class="popup-content">
			<form class="ui-form write dialog" id="edit-form">
				<ul>
					<li>
						<div class="field ">
							<label class="label" for="edit-content">리뷰 내용</label>
							<div class="ui-input">
								<div class="input outlined">
									<textarea id="edit-content" rows="4"></textarea>
								</div>
							</div>
						</div>
					</li>
					<li>
						<div class="field ">
							<label class="label" for="edit-score">평점 (1~5)</label>
							<div class="ui-input">
								<div class="input outlined">
									<input id="edit-score" type="number" min="1" max="5"/>
								</div>
							</div>
						</div>
					</li>
					<li>
						<div class="ux-button-bar">
							<button class="ux-button contained primary" type="submit"><span class="label">리뷰 수정</span></button>
						</div>
					</li>
				</ul>
			</form>
		</div>
	</div>
</div>
<script src="${contextPath}/resources/js/myReviews.js"></script>
