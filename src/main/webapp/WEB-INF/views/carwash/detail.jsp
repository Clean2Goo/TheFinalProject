<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%request.setCharacterEncoding("UTF-8");%>

<main>
	<section>
		<article>
			<div class="h3-title">
				<h3>h3타이틀</h3>
			</div>
			<div class="content">
				<c:if test="${empty carWashDetail}">
				<div>데이터가 없습니다.</div>
				<!-- 데이터가 없을 경우 표시 -->
			</c:if>
			<c:if test="${not empty carWashDetail}">
				<div class="content">
					<div class="content-title">
						<div class="item-info">
							<h4 class="info-title">${carWashDetail.washName}</h4>
							<p class="info-location">
								<span class="icon"></span><span class="label">${carWashDetail.washAddr}</span>
							</p>
							<p class="info-shortdesc">
								<span class="icon"></span><span class="label">${carWashDetail.washTel}</span>
							</p>
						</div>

					</div>
				</div>

			</c:if>
			</div>
		</article>
	</section>
</main>