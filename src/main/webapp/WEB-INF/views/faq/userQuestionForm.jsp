<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<main>
	<section>
		<article>
			<div class="h3-title">
				<h3>Q&A 등록</h3>
			</div>
			<div class="content">
				<form class="ui-form write" action="${contextPath}/faq/addUserQuestion.do" method="post">
					<fieldset>
						<ul>
							<li>
								<div class="field ">
									<label class="label" for="title">제목</label>
									<div class="ui-input">
										<div class="input outlined">
											<input type="text" name="title" id="title" class="custom-text" placeholder="제목을 입력하세요" required>
										</div>
										<div class="msg">
											<p>최대 100자 이내</p>
										</div>
									</div>
								</div>
							</li>
							<li>
								<div class="field ">
									<label class="label" for="question">내용</label>
									<div class="ui-input">
										<div class="input outlined">
											<textarea name="question" id="question" rows="10" class="custom-textarea" maxlength="1000" placeholder="내용을 입력하세요" required></textarea>
										</div>
										<div class="msg">
											<p>최대 1000자 이내</p>
										</div>
									</div>
								</div>
							</li>
							<li>
								<div class="ux-button-bar">
									<a href="${contextPath}/faq/listFaqs.do" onclick="confirmNavigation(event)" class="ux-button outlined" role="button">
										<span class="label">등록 취소</span>
									</a>
									<button class="ux-button contained primary" type="submit">
										<span class="label">Q&A 등록</span>
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

<script>
	function confirmNavigation(event) {
		const userConfirmed = confirm("작성을 취소하고 목록으로 이동하시겠습니까?");
		if (!userConfirmed) {
			event.preventDefault();
		}
		return userConfirmed;
	}
</script>
