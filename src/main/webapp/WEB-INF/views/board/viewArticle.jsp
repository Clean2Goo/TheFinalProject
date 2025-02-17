<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%request.setCharacterEncoding("UTF-8");%>


<main>
	<section>
		<article>
			<div class="h3-title">
				<h3>이벤트</h3>
			</div>
			<div class="content">
				<form class="ui-form ui-bbs" name="frmArticle" method="post"  action="${contextPath}"  enctype="multipart/form-data">
					<input type="hidden" name="articleNO" value="${article.articleNO}"  />
					<!-- hidden은 form 태그 아래에 모아놓기 -->
					<div class="bbs-read event">
						<div class="bbs-title">
							<h4 class="subject">
								<div class="field">
									<div class="ui-input">
										<div class="input outlined">
											<input class="i-title" type=text value="${article.title}" name="title" id="i_title" disabled />
										</div>
									</div>
								</div>
							</h4>
							<ul class="info-list">
								<li>
									<p class="info">번호 : <span class="number">${article.articleNO}</span></p>
								</li>
								<li>
									<p class="info">작성자 : <span class="author">${article.userName}</span></p>
									<p class="info">등록일 : <span class="date">${article.writeDate}</span></p>
								</li>
							</ul>
						</div>
						<div class="bbs-content">
							<div class="ui-input">
								<div class="input outlined">
									<textarea class="i-content custom-textarea" rows="20" cols="60" name="content" id="i_content"  disabled />${article.content }</textarea>
								</div>
							</div>
							<div class="img-wrap">
								<c:choose>
									<c:when test="${not empty article.imageFileName && article.imageFileName!='null' }">
										<!-- 이미지 등록 된 상태 -->
										<div>
											<input  type= "hidden"   name="originalFileName" value="${article.imageFileName }" />
											<img id="preview" src="${contextPath}/download.do?articleNO=${article.articleNO}&imageFileName=${article.imageFileName}" width="600" height="auto" />
										</div>
										<div id="modify_upload_file">
											<span class="desc">수정 파일 선택:</span>
											<input class="" type="file" name="imageFileName" id="i_imageFileName" disabled onchange="readURL(this);"/>
										</div>
									</c:when>
									<c:otherwise>
										<!-- 이미지 등록 안 된 상태 -->
										<div id="file_upload">
											<span class="desc">첨부 파일 선택:</span>
											<input class="" type="file"  name="imageFileName" id="i_imageFileName" disabled onchange="readURL(this);"/>
											<input type= "hidden" name="originalFileName" value="${article.imageFileName }" />
											<div id="" class="upload-preview">
												<p class="desc">업로드 이미지 미리보기:</p>
												<img id="preview" width="600" height="auto"/>
											</div>
										</div>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</div>
					<ul>
						<li>
							<div  id="modify_button">
								<c:if test="${member.userType == 'systemOperator'}">
									<div class="ux-button-bar">
										<button class="ux-button contained primary" type=button  onClick="fn_enable(this.form)"><span class="label">게시글 수정</span></button>
									</div>
								</c:if>
							</div>
						</li>
						<li>
							<div id="modify_controller">
								<div class="ux-button-bar">
									<button class="ux-button outlined" type=button onClick="backToList(frmArticle)"><span class="label">수정 취소</span></button>
									<button class="ux-button contained primary" type=button onClick="fn_modify_article(frmArticle)"><span class="label">수정 하기</span></button>
								</div>
							</div>
						</li>
					</ul>
				 </form>
				 <div class="ux-button-bar">
					<!-- 고객 / 로그인정보 없을시 -->
					<c:if test="${!isLogOn || member.userType == 'customer'}">
						<a class="ux-button outlined" href="${contextPath}/board/listArticles.do">목록보기</a>
					</c:if>
					<!-- 어드민: 로그인했을 때만 표시-->
					<c:if test="${isLogOn && member.userType != 'customer'}">
						<a class="ux-button outlined" href="${contextPath}/board/adminListArticles.do">어드민-목록보기</a>
					</c:if>
				</div>
			</div>
		</article>
	</section>
</main>

<script type="text/javascript">

	function backToList(obj){
		obj.action="${contextPath}/board/adminListArticles.do";
		obj.submit();
	}

	function fn_enable(obj){
		document.getElementById("i_title").disabled=false;
		document.getElementById("i_title").focus();

		document.getElementById("i_content").disabled=false;
		document.getElementById("i_content").focus();

		document.getElementById("i_imageFileName").disabled=false;

		// 게시물 수정 버튼 영역
		document.getElementById("modify_button").style.display="none";

		// 수정취소/ 수정반영 버튼 영역
		document.getElementById("modify_controller").style.display="block";

		if (document.getElementById("modify_upload_file")) {
			// 이미지 등록되어있을 때
			document.getElementById("modify_upload_file").style.display = "block";
		}

		if (document.getElementById("file_upload")) {
			// 이미지 등록 안되어 있을 때
			document.getElementById("file_upload").style.display = "block";
		}
	}

	function fn_modify_article(obj){
		obj.action="${contextPath}/board/modArticle.do";
		obj.submit();
	}

	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function (e) {
				$('#preview').attr('src', e.target.result);readURL
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
</script>