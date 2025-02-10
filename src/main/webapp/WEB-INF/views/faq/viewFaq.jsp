<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${contextPath}/resources/assets/css/viewFaq.css">

<main>
    <section>
        <article>
            <div class="h3-title">
                <h3>자주 묻는 질문 - 상세 보기</h3>
            </div>
            <div class="faq-container content">
                <div class="faq-box">
                    <h1 class="faq-title">${faq.question}</h1>
                    <div class="faq-info">
                        <p class="faq-author"><strong>작성자:</strong> ${faq.userId}</p>
                        <p class="faq-date"><strong>작성일:</strong> <fmt:formatDate value="${faq.crtDate}" pattern="yyyy-MM-dd" /></p>
                    </div>
                    <div class="faq-content">
                        <p>${faq.answer}</p>
                    </div>
                    <c:if test="${not empty faq.faqImg}">
                        <div class="faq-image">
                            <img src="${contextPath}/resources/assets/images/${faq.faqImg}" alt="첨부 이미지" />
                        </div>
                    </c:if>
                </div>
                
                <!-- 목록으로 돌아가기 버튼 -->
                <div class="back-button-container">
                    <c:choose>
                        <c:when test="${!isLogOn || member.userType == 'customer'}">
                            <a class="back-button" href="${contextPath}/faq/listFaqs.do">목록으로 돌아가기</a>
                        </c:when>
                        <c:otherwise>
                            <a class="back-button" href="${contextPath}/faq/adminListFaqs.do">관리 목록으로 돌아가기</a>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </article>
    </section>
</main>
