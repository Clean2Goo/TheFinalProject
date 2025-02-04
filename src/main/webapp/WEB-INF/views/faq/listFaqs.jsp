<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${contextPath}/resources/assets/css/listFaqs.css">

<main>
    <section>
        <article>
            <div class="h3-title">
                <h3>자주 묻는 질문</h3>
            </div>
            <div class="faq-list-container content">
                <!-- FAQ 작성 버튼 (관리자만 보임) -->
                <c:if test="${member.userType == 'systemOperator'}">
                    <a href="${contextPath}/faq/adminWriteFaqForm.do" class="faq-write-btn">FAQ 작성</a>
                </c:if>

                <!-- FAQ 테이블 -->
                <table class="faq-table">
                    <thead>
                        <tr>
                            <th>번호</th>
                            <th>질문</th>
                            <th>작성자</th>
                            <th>등록일</th>
                            <c:if test="${member.userType == 'systemOperator'}">
                                <th>게시물관리</th>
                            </c:if>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${faqList}" var="faq">
                            <tr>
                                <td>${faq.faqNo}</td>
                                <td>
                                    <!-- 고객 -->
                                    <c:if test="${member.userType == 'customer'}">
                                        <a href="${contextPath}/faq/viewFaq.do?faqNo=${faq.faqNo}">
                                            ${faq.question}
                                        </a>
                                    </c:if>
                                    <!-- 어드민 -->
                                    <c:if test="${member.userType != 'customer'}">
                                        <a href="${contextPath}/faq/adminViewFaq.do?faqNo=${faq.faqNo}">
                                            ${faq.question}
                                        </a>
                                    </c:if>
                                </td>
                                <td>${faq.userId}</td>
                                <td>${faq.crtDate}</td>
                                <!-- 게시글 삭제 (슈퍼 관리자만 보임) -->
                                <c:if test="${member.userType == 'systemOperator'}">
                                    <td>
                                        <form action="${contextPath}/faq/adminDeleteFaq.do" method="post" style="display: inline;">
                                            <input type="hidden" name="faqNo" value="${faq.faqNo}" />
                                            <button type="submit" class="delete-btn">삭제</button>
                                        </form>
                                    </td>
                                </c:if>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
              
            </div>
        </article>
    </section>
</main>
