<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<main>
  <section>
    <article>
      <div class="h3-title">
        <h3>새 FAQ 작성</h3>
      </div>
      <div class="content">
        <div class="notice-form">
          <form action="${contextPath}/faq/addNewFaq.do" method="post" enctype="multipart/form-data" onsubmit="return validateForm()">
            <label for="question">질문</label>
            <input type="text" name="question" id="question" placeholder="질문을 입력하세요" />
            <br />
            <span class="description">최대 100자 이내</span><br />
            
            <label for="answer">답변</label>
            <textarea name="answer" id="answer" rows="10" placeholder="답변을 입력하세요"></textarea>
            <br />
            <span class="description">최대 5000자 이내</span><br />
            
            <label for="faqImg">이미지 첨부</label>
            <input type="file" name="faqImg" id="faqImg" accept="image/*" />
            <br /><br />
            
            <div class="button-row">
              <button type="submit">등록</button>
              <a href="${contextPath}/faq/listFaqs.do" onclick="return confirmNavigation(event)">취소</a>
            </div>
          </form>
        </div>
      </div>
    </article>
  </section>
</main>

<script>
  function validateForm() {
    const question = document.getElementById("question").value.trim();
    const answer = document.getElementById("answer").value.trim();
    
    if (!question) {
      alert("질문을 입력해주세요.");
      return false;
    }
    
    if (!answer) {
      alert("답변을 입력해주세요.");
      return false;
    }
    
    return true;
  }

  function confirmNavigation(event) {
    const userConfirmed = confirm("작성을 취소하고 목록으로 이동하시겠습니까?");
    if (!userConfirmed) {
      event.preventDefault();
    }
    return userConfirmed;
  }
</script>
