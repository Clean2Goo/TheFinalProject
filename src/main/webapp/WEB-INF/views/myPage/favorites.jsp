<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%request.setCharacterEncoding("UTF-8");%>

<main class="ui-favorites">
	<section>
		<article>
			<div class="h3-title col">
				<h3>즐겨찾기</h3>
				<div class="ui-page-desc">
					<div class="middot-list">
						<ul>
							<li>즐겨찾기 등록 된 각 세차장 클릭시, 해당 세차장의 상세정보화면으로 이동합니다.</li>
							<li>바로 예약 서비스와 즐겨찾기 해제를 이용하실 수 있습니다.</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="content">
				<ul id="favorite-list" class="favorite-list"></ul>
			</div>
		</article>
	</section>
</main>
<script src="${contextPath}/resources/js/favorites.js"></script>