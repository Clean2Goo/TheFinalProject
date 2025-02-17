<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="if" uri="http://java.sun.com/jsp/jstl/core"%>
<% request.setCharacterEncoding("UTF-8");%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<main class="ui-index-admin">
	<section>
		<article>
			<div class="content">
				<div class="grid-container">
					<div class="item item1">
						<div class="h4">
							<div class="h4-title">
								<h4>기간별 예약건 통계</h4>
								<a href="#" role="button" class="ux-button text-button more-view-button" >
									<span class="label">
										자세히 보기
									</span>
									<span class="icon rang"></span>
								</a>
							</div>
							<div class="content">
								<div class="ui-graph">
									<div id="lottie-graph" class="lottie graph"></div>
									<div class="graph-text month">
										<ul>
											<li><p>수/월</p></li>
											<li><p>10</p></li>
											<li><p>11</p></li>
											<li><p>12</p></li>
											<li><p>1</p></li>
											<li><p>2</p></li>
										</ul>
									</div>
									<div class="graph-text count">
										<ul>
											<li><p>250</p></li>
											<li><p>200</p></li>
											<li><p>150</p></li>
											<li><p>100</p></li>
											<li><p>50</p></li>
											<li><p>0</p></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="item item2">
						<div class="h4">
							<div class="h4-title">
								<h4>진행중인 이벤트</h4>
								<a href="${contextPath}/board/adminListArticles.do" role="button" class="ux-button text-button more-view-button" >
									<span class="label">
										<c:choose>
											<c:when test="${member != null && member.userType == 'systemOperator'}">
												관리
											</c:when>
											<c:otherwise>
												자세히 보기
											</c:otherwise>
										</c:choose>
									</span>
									<span class="icon rang"></span>
								</a>
							</div>
							<div class="content">
								<div class="swiper-container event-swiper view-admin">
									<div class="swiper-wrapper">
										<div class="swiper-slide event-slide s1">
											<a class="event" href="${contextPath}/board/adminViewArticle.do?articleNO=1">
												<div class="item-image">
													<img class="img" src="${contextPath}/resources/assets/images/event/event1banner.jpg" alt="신규회원혜택 이벤트 배너">
												</div>
											</a>
										</div>
										<div class="swiper-slide event-slide s2">
											<a class="event" href="${contextPath}/board/adminViewArticle.do?articleNO=4">
												<div class="item-image">
													<img class="img" src="${contextPath}/resources/assets/images/event/event6banner.jpg" alt="봄맞이 세차 이벤트 배너">
												</div>
											</a>
										</div>
										<div class="swiper-slide event-slide s3">
											<a class="event" href="${contextPath}/board/adminViewArticle.do?articleNO=6">
												<div class="item-image">
													<img class="img" src="${contextPath}/resources/assets/images/event/event12banner.jpg" alt="클린투고">
												</div>
											</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="item item3">
						<div class="h4">
							<div class="h4-title">
								<h4>Q&A</h4>
								<a href="${contextPath}/faq/adminListFaqs.do" role="button" class="ux-button text-button more-view-button" >
									<span class="label">
										<c:choose>
											<c:when test="${member != null && member.userType == 'systemOperator'}">
												답변 관리
											</c:when>
											<c:otherwise>
												자세히 보기
											</c:otherwise>
										</c:choose>
									</span>
									<span class="icon rang"></span>
								</a>
							</div>
							<div class="content">
								<div class="data-grid">
									<table>
										<!-- <thead>
											<tr>
												<th>번호</th>
												<th>제목</th>
												<th>등록일</th>
											</tr>
										</thead> -->
										<tbody>
											<c:choose>
												<c:when test="${not empty faqList}">
													<c:forEach items="${faqList}" var="faq">
														<tr class="faq-row">
															<td class="subject">${faq.title}</td>
															<td>${faq.userId}</td>
														</tr>
														<tr class="faq-answer-row" style="display: none;">
															<td colspan="2">
																<div class="faq-answer-row-content">
																	<c:if test="${faq.answer != null && faq.answer != ''}">
																		<p class="tal">${faq.answer}</p>
																	</c:if>
																	<c:if test="${faq.answer == null || faq.answer == ''}">
																		<p class="tal">답변이 아직 등록되지 않았습니다.</p>
																	</c:if>
																	</p>
																	<c:if test="${member != null && faq.userId == member.id}">
																		<form class="ui-form faq question" action="${contextPath}/faq/deleteFaq.do" method="post" style="display: inline;">
																			<input type="hidden" name="faqNo" value="${faq.faqNo}" />
																			<ul>
																				<li>
																					<div class="ux-button-bar">
																						<button type="submit" class="ux-button contained button-table remove btn-delete" onclick="return confirm('정말 삭제하시겠습니까?');">질문 삭제</button>
																					</div>
																				</li>
																			</ul>
																		</form>
																	</c:if>
																	<!-- 시스템 운영자일 경우 답변 등록 폼 표시 -->
																	<!-- <c:if test="${member != null && member.userType == 'systemOperator'}">
																		<form class="ui-form faq answer" action="${contextPath}/faq/addAnswer.do" method="post">
																			<input type="hidden" name="faqNo" value="${faq.faqNo}" />
																			<ul>
																				<li>
																					<div class="field">
																						<div class="ui-input">
																							<div class="input outlined">
																								<textarea name="answer" class="custom-textarea" placeholder="답변을 입력하세요" rows="3" required></textarea>
																							</div>
																						</div>
																					</div>
																				</li>
																				<li>
																					<div class="ux-button-bar">
																						<button type="submit" class="ux-button contained button-table primary">답변 등록</button>
																					</div>
																				</li>
																			</ul>
																		</form>
																	</c:if> -->
																</div>
															</td>
														</tr>
													</c:forEach>
												</c:when>
											</c:choose>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
					<div class="item item4">
						<div class="h4">
							<div class="h4-title">
								<h4>공지사항</h4>
								<a href="${contextPath}/notice/adminListNotices.do" role="button" class="ux-button text-button more-view-button" >
									<span class="label">
										<c:choose>
											<c:when test="${member != null && member.userType == 'systemOperator'}">
												관리
											</c:when>
											<c:otherwise>
												자세히 보기
											</c:otherwise>
										</c:choose>
									</span>
									<span class="icon rang"></span>
								</a>
							</div>
							<div class="content">
								<div class="data-grid">
									<table>
										<caption>공지사항</caption>
										<colgroup>
											<col class="col-auto">
										</colgroup>
										<!--<thead>
											<tr>
												<th>번호</th>
												<th>제목</th>
												<th>등록일</th>
													게시글 삭제 (슈퍼 관리자만 보임)
												<c:if test="${member.userType == 'systemOperator'}">
													<th>관리</th>
												</c:if>
											</tr>
										</thead>-->
										<tbody>
											<c:if test="${not empty noticesList}">
												<c:forEach items="${noticesList}" var="notice">
													<tr>
														<td class="subject">
															<a href="${contextPath}/notice/adminViewNotice.do?noticeno=${notice.noticeno}">
																${notice.title}
															</a>
														</td>
													</tr>
												</c:forEach>
											</c:if>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
					<div class="item item5">
						<div class="h4">
							<div class="h4-title">
								<h4>이벤트</h4>
								<a href="${contextPath}/board/adminListArticles.do" role="button" class="ux-button text-button more-view-button" >
									<span class="label">
										<c:choose>
											<c:when test="${member != null && member.userType == 'systemOperator'}">
												관리
											</c:when>
											<c:otherwise>
												자세히 보기
											</c:otherwise>
										</c:choose>
									</span>
									<span class="icon rang"></span>
								</a>
							</div>
							<div class="content">
								<div class="data-grid">
									<table>
										<caption>이벤트</caption>
										<colgroup>
											<col class="col-auto">
										</colgroup>
										<tbody>
											<c:if test="${not empty articlesList}" >
												<c:forEach var="article" items="${articlesList}" varStatus="articleNum" >
													<tr>
														<td class="subject">
															<a href="${contextPath}/board/adminViewArticle.do?articleNO=${article.articleNO}">
																${article.title }
															</a>
														</td>
													</tr>
												</c:forEach>
											</c:if>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</article>
	</section>
</main>

<script>
    $(document).ready(function() {
        $(".faq-row").on("click", function() {
            const answerRow = $(this).next(".faq-answer-row");
            // 선택한 답변이 열려있으면 닫고, 닫혀있으면 열기
            if (answerRow.is(":visible")) {
                answerRow.stop(true, true).hide(); // 현재 열린 답변 닫기
            } else {
                $(".faq-answer-row").hide(); // 모든 답변 닫기
                answerRow.stop(true, true).show(); // 선택한 답변 열기
            }
        });
    });
</script>
