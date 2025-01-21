<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />


<main>
	<section>
		<article>
			<div class="h3-title">
				<h3>새 공지사항 작성</h3>
			</div>
			 <div class="content">
      <div class="notice-form">
        <form
          action="${pageContext.request.contextPath}/notice/addNotice.do"
          method="post"
          enctype="multipart/form-data"
        >
          <label for="title">제목</label>
          <input
            type="text"
            name="title"
            id="title"
            placeholder="제목을 입력하세요"
          /><br />
          <span class="description">최대 100자 이내</span><br />

          <label for="content">내용</label>
          <textarea
            name="content"
            id="content"
            rows="10"
            cols="30"
            required
            placeholder="내용을 입력하세요"
          ></textarea
          ><br />
          <span class="description">최대 5000자 이내</span><br />

          <!-- <label for="imageFile">이미지</label>
          <input type="file" name="imageFile" id="imageFile" /><br />
          <span class="description">이미지 파일을 업로드하세요 (선택 사항)</span
          ><br /> -->

          <div class="button-row">
            <button type="submit">등록</button>

            <a
              href="${pageContext.request.contextPath}/notice/listNotices.do"
              onclick="return confirmNavigation(event)"
              >취소</a
            >
          </div>

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
    </div>
		</article>
	</section>
</main>

