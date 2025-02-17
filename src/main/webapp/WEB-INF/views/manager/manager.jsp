<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<main>
	<section>
		<article>
			<div class="content">
				<div class="ux-button-bar">
					<button id="add-carwash-btn" class="ux-button contained primary" role="button">
						<span class="label">세차장 추가</span>
					</button>
				</div>
				<div class="data-grid">
					<!-- 세차장 목록 -->
					<table>
						<caption>세차장 목록 테이블</caption>
						<colgroup>
							<col class="col-8">
							<col class="col-auto">
							<col class="col-auto">
							<col class="col-16">
							<col class="col-16">
						</colgroup>
						<thead>
							<tr>
								<th>세차장고유ID</th>
								<th>세차장 이름</th>
								<th>주소</th>
								<th>전화번호</th>
								<th>관리</th>
							</tr>
						</thead>
						<tbody id="carwash-list">
							<!-- JavaScript로 동적으로 채워질 내용 -->
						</tbody>
					</table>
				</div>
			</div>
		</article>
	</section>

</main>
<!-- 세차장 수정/추가 모델 -->
<div id="carwash-model" class="model" style="display: none;">
	<div class="popup-container">
		<div class="popup-header">
			<div class="popup-title">
				<h5 id="model-title">세차장 정보 수정</h5>
			</div>
			<button id="close-review-popup" class="ux-button icon-menu popup-close-button">
				<span class="icon"><i class="fa-solid fa-xmark"></i></span><span class="label">팝업 닫기</span>
			</button>
		</div>
		<div class="popup-content">
			<form class="ui-form write dialog manager" id="carwash-form">
				<input type="hidden" id="carwash-id">
				<ul class="manager">
					<li>
						<div class="field ">
							<label class="label" for="carwash-name">세차장명</label>
							<div class="ui-input">
								<div class="input outlined">
									<input type="text" id="carwash-name" required>
								</div>
							</div>
						</div>
					</li>
					<li>
						<div class="field ">
							<label class="label"for="carwash-address">주소</label>
							<div class="ui-input">
								<div class="input outlined">
									<input type="text" id="carwash-address" required>
								</div>
							</div>
						</div>
					</li>
					<li>
						<div class="field ">
							<label class="label"for="carwash-lat">위도 (Latitude)</label>
							<div class="ui-input">
								<div class="input outlined">
									<input type="text" id="carwash-lat" placeholder="37.5665" required>
								</div>
							</div>
						</div>
					</li>
					<li>
						<div class="field ">
							<label class="label"for="carwash-lng">경도 (Longitude)</label>
							<div class="ui-input">
								<div class="input outlined">
									<input type="text" id="carwash-lng" placeholder="126.9780" required>
								</div>
							</div>
						</div>
					</li>
					<li>
						<div class="field ">
							<label class="label"for="carwash-info">세차장 설명</label>
							<div class="ui-input">
								<div class="input outlined">
									<textarea id="carwash-info" rows="4" required></textarea>
								</div>
							</div>
						</div>
					</li>
					<li>
						<div class="field ">
							<label class="label"for="carwash-image">이미지 URL</label>
							<div class="ui-input">
								<div class="input outlined">
									<input type="text" id="carwash-image">
								</div>
							</div>
						</div>
					</li>
					<li>
						<div class="field ">
							<label class="label"for="carwash-phone">전화번호</label>
							<div class="ui-input">
								<div class="input outlined">
									<input type="text" id="carwash-phone" required>
								</div>
							</div>
						</div>
					</li>
					<li>
						<div class="field ">
							<label class="label"for="carwash-hours">운영 시간</label>
							<div class="ui-input">
								<div class="input outlined">
									<input type="text" id="carwash-hours" required>
								</div>
							</div>
						</div>
					</li>
					<li>
						<div class="field ">
							<label class="label"for="carwash-type">세차 유형</label>
							<div class="ui-input">
								<div class="input outlined">
									<input type="text" id="carwash-type" placeholder="예: 기계 세차, 셀프 세차" required>
								</div>
							</div>
						</div>
					</li>
					<li>
					</li>
				</ul>
				<div class="ux-button-bar">
					<button class="ux-button contained primary" type="submit" id="save-carwash-btn"><span class="label">저장</span></button>
				</div>
			</form>
		</div>
	</div>
</div>

<!-- JavaScript 파일 -->
<script src="${pageContext.request.contextPath}/resources/js/manager.js"></script>
