<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />


<main>
	<section>
		<article>
			<div class="h3-title">
				<h3>공지사항 등록</h3>
			</div>
			 <div class="content">
				<form class="ui-form write"  action="${pageContext.request.contextPath}/notice/addNotice.do" method="post" enctype="multipart/form-data">
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
									<label class="label" for="content">내용</label>
									<div class="ui-input">
										<div class="input outlined">
											<textarea name="content" id="content" rows="10" class="custom-textarea" placeholder="내용을 입력하세요"></textarea>
										</div>
										<div class="msg">
											<p>최대 5000자 이내</p>
										</div>
									</div>
								</div>
							</li>
							<li>
								<div class="ux-button-bar">
									<a href="${contextPath}/notice/adminListNotices.do" onclick="return confirmNavigation(event)" class="ux-button outlined" role="button">
										<span class="label">등록 취소</span>
									</a>
									<button class="ux-button contained primary" type="submit">
										<span class="label">공지사항 등록</span>
									</button>
								</div>
							</li>
						</ul>
					</fieldset>
					<script>
						function confirmNavigation(event) {
							const userConfirmed = confirm(
								"작성을 취소하고 목록으로 이동하시겠습니까?"
							);
							if (!userConfirmed) {
								event.preventDefault();
							}
							return userConfirmed;
						}
					</script>
				</form>
			</div>
		</article>
	</section>
</main>

