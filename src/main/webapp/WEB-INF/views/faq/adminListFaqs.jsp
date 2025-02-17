<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${contextPath}/resources/assets/css/adminListFaqs.css">

<main>
    <section>
        <article>
            <div class="h3-title">
                <h3>FAQ 관리</h3>
            </div>
            <div class="faq-list-container content">
                <!-- FAQ 작성 버튼 -->
                <a href="${contextPath}/faq/adminWriteFaqForm.do" class="faq-write-btn">FAQ 작성</a>
                
                <!-- FAQ 테이블 -->
                <table class="faq-table">
                    <thead>
                        <tr>
                            <th>번호</th>
                            <th>질문</th>
                            <th>작성자</th>
                            <th>등록일</th>
                            <th>관리</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${faqList}" var="faq">
                            <tr>
                                <td>${faq.faqNo}</td>
                                <td>
                                    <a href="${contextPath}/faq/adminViewFaq.do?faqNo=${faq.faqNo}">
                                        ${faq.question}
                                    </a>
                                </td>
                                <td>${faq.userId}</td>
                                <td>${faq.crtDate}</td>
                                <td>
                                    <form action="${contextPath}/faq/adminDeleteFaq.do" method="post" style="display:inline;">
                                        <input type="hidden" name="faqNo" value="${faq.faqNo}" />
                                        <button type="submit" class="delete-btn">삭제</button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </article>
    </section>
</main>
