<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${contextPath}/resources/assets/css/adminViewFaq.css">

<main>
    <section>
        <article>
            <div class="h3-title">
                <h3>FAQ 상세 관리</h3>
            </div>
            <div class="faq-container content">
                <div class="faq-box">
                    <h1 class="faq-title">${faq.question}</h1>
                    <div class="faq-info">
                        <p class="faq-author"><strong>작성자:</strong> ${faq.userId}</p>
                        <p class="faq-date"><strong>작성일:</strong> ${faq.crtDate}</p>
                    </div>
                    <p class="faq-content">${faq.answer}</p>
                    
                    <c:if test="${not empty faq.faqImg}">
                        <img src="${contextPath}/resources/assets/images/${faq.faqImg}" alt="첨부 이미지" />
                    </c:if>
                </div>
                
                <hr />
                
                <!-- 답변 입력 폼 -->
                <form action="${contextPath}/faq/updateFaqAnswer.do" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="faqNo" value="${faq.faqNo}" />
                    <label for="answer">답변 작성</label>
                    <textarea name="answer" id="answer" rows="10" placeholder="답변 내용을 입력하세요">${faq.answer}</textarea>
                    <br />
                    <label for="faqImg">첨부 이미지 (선택)</label>
                    <input type="file" name="faqImg" id="faqImg" />
                    <br />
                    <div class="button-row">
                        <button type="submit">답변 저장</button>
                        <a href="${contextPath}/faq/adminListFaqs.do" class="cancel-btn">목록으로 돌아가기</a>
                    </div>
                </form>
            </div>
        </article>
    </section>
</main>
