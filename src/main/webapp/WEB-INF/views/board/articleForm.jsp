<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%request.setCharacterEncoding("UTF-8");%>

<main>
	<section>
		<article>
			<div class="h3-title">
				<h3>이벤트 등록</h3>
			</div>
			<div class="content">
				<form class="ui-form write" name="articleForm" method="post" action="${contextPath}/board/addNewArticle.do" enctype="multipart/form-data">
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
											<textarea name="content" id="content" rows="10" class="custom-textarea" maxlength="4000" placeholder="내용을 입력하세요"></textarea>
										</div>
										<div class="msg">
											<p>최대 4000자 이내</p>
										</div>
									</div>
								</div>
							</li>
							<li>
								<div id="field">
									<span class="label">첨부 파일 선택</span>
										<input class="" type="file" name="imageFileName" onchange="readURL(this);"/>
										<input type= "hidden" name="originalFileName" value="${article.imageFileName }" />
									<div class="upload-preview">
										<p class="desc">업로드 이미지 미리보기:</p>
										<img id="preview" width="600" height="auto"/>
									</div>
								</div>
							</li>
							<li>
								<div class="ux-button-bar">
									<a href="${contextPath}/board/adminListArticles.do" onclick="confirmNavigation(event)" class="ux-button outlined" role="button">
										<span class="label">등록 취소</span>
									</a>
									<button class="ux-button contained primary" type="submit">
										<span class="label">이벤트 등록</span>
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
<script type="text/javascript">
	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function (e) {
				$('#preview').attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}

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
