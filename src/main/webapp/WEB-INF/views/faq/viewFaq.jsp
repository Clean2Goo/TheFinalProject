<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="${contextPath}/resources/assets/css/viewNotice.css"> 

<main>
    <section>
        <article>
            <div class="h3-title">
                <h3>자주 묻는 질문</h3>
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
					
					
					<!-- 고객 -->
					<c:if test="${!isLogOn || member.userType == 'customer'}">
						<a class="back-button" href="${contextPath}/faq/listFaqs.do">고객-목록으로 돌아가기</a>
					</c:if>
					<!-- 어드민-->
					<c:if test="${isLogOn && member.userType != 'customer'}">
						<a class="back-button" href="${contextPath}/faq/adminListFaqs.do">어드민-목록으로 돌아가기</a>
					</c:if>
				</div>
			</div>
		</article>
	</section>
</main>
