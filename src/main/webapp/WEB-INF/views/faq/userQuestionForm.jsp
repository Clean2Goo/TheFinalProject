<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${contextPath}/resources/assets/css/questionForm.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<main>
    <section>
        <article>
            <div class="h3-title">
                <h3>질문 등록</h3>
            </div>
            <div class="content">
                <div class="question-form">
                    <form action="${contextPath}/faq/addUserQuestion.do" method="post">
                        <label for="title">제목</label>
                        <input type="text" name="title" id="title" placeholder="제목을 입력하세요" required />
                        <br />
                        <label for="question">질문</label>
                        <textarea name="question" id="question" rows="5" placeholder="질문 내용을 입력하세요" required></textarea>
                        <br />
                        <span class="description">최대 1000자 이내</span><br />
                        <div class="button-row">
                            <button type="submit" class="btn btn-submit">등록</button>
                            <a href="${contextPath}/faq/listFaqs.do" class="btn btn-cancel" onclick="return confirmNavigation(event)">취소</a>
                        </div>
                    </form>
                </div>
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
