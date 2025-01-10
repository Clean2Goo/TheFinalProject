<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />


<main>
	<section>
		<article>
			<div>
				<h1 class="notice-title">새 공지사항 작성</h1>
				<div class="notice-form">
					<form action="${pageContext.request.contextPath}/notice/addNotice.do" method="post" enctype="multipart/form-data">
					   <label for="title">제목</label>
					   <input type="text" name="title" id="title" required /><br />

					   <label for="content">내용</label>
					   <textarea name="content" id="content" rows="10" cols="30" required></textarea><br />

					   <label for="imageFile">이미지</label>
					   <input type="file" name="imageFile" id="imageFile" /><br />

					   <button type="submit">등록</button>
				   </form>
			   </div>
			   <div class="redo">
					   <a href="${contextPath}/notice/adminListNotices.do">목록으로 돌아가기</a>
				</div>
			</div>
		</article>
	</section>
</main>

