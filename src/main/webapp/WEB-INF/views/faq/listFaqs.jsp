<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${contextPath}/resources/assets/css/listFaqs.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<main>
    <section>
        <article>
            <div class="h3-title">
                <h3>자주 묻는 질문</h3>
            </div>

            <!-- 메시지 표시 -->
            <c:if test="${not empty successMessage}">
                <div class="alert alert-success">${successMessage}</div>
            </c:if>
            <c:if test="${not empty errorMessage}">
                <div class="alert alert-danger">${errorMessage}</div>
            </c:if>

            <div class="faq-list-container content">
                <div class="faq-actions">
                    <!-- 질문 작성 버튼 -->
                    <c:if test="${member != null && member.userType == 'customer'}">
                        <a href="${contextPath}/faq/userQuestionForm.do" class="btn btn-primary">질문 작성</a>
                    </c:if>
                    <c:if test="${member != null && member.userType != 'customer'}">
                        <a href="${contextPath}/faq/adminQuestionForm.do" class="btn btn-primary">질문 작성</a>
                    </c:if>
                    <c:if test="${member != null && member.userType == 'systemOperator'}">
                        <a href="${contextPath}/faq/adminWriteFaqForm.do" class="btn btn-secondary">FAQ 작성</a>
                    </c:if>
                </div>

                <!-- 검색 필드 -->
                <form action="${contextPath}/faq/listFaqs.do" method="get" class="search-form">
                    <input type="text" name="searchKeyword" placeholder="검색어 입력" value="${param.searchKeyword}" />
                    <button type="submit" class="btn btn-search">검색</button>
                </form>

                <!-- FAQ 테이블 -->
                <table class="faq-table">
                    <thead>
                        <tr>
                            <th>번호</th>
                            <th>제목</th>
                            <th>작성자</th>
                            <th>등록일</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:choose>
                            <c:when test="${not empty faqList}">
                                <c:forEach items="${faqList}" var="faq">
                                    <tr class="faq-row">
                                        <td>${faq.faqNo}</td>
                                        <td>${faq.title}</td>
                                        <td>${faq.userId}</td>
                                        <td>${faq.crtDate}</td>
                                    </tr>
                                    <tr class="faq-answer-row">
                                        <td colspan="4">
                                            <div class="faq-answer-row-content">
                                                <p><strong>질문:</strong> ${faq.question}</p>
                                                <p><strong>답변:</strong> 
                                                    <c:if test="${faq.answer != null && faq.answer != ''}">
                                                        ${faq.answer}
                                                    </c:if>
                                                    <c:if test="${faq.answer == null || faq.answer == ''}">
                                                        <span>답변이 아직 등록되지 않았습니다.</span>
                                                    </c:if>
                                                </p>
                                                <!-- 답변 작성 폼 (관리자만 보임) -->
                                                <c:if test="${member != null && member.userType == 'systemOperator'}">
                                                    <form action="${contextPath}/faq/addAnswer.do" method="post">
                                                        <input type="hidden" name="faqNo" value="${faq.faqNo}" />
                                                        <textarea name="answer" placeholder="답변을 입력하세요" rows="3" required></textarea>
                                                        <button type="submit" class="btn btn-primary">답변 등록</button>
                                                    </form>
                                                </c:if>
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <tr>
                                    <td colspan="4" style="text-align: center;">등록된 FAQ가 없습니다.</td>
                                </tr>
                            </c:otherwise>
                        </c:choose>
                    </tbody>
                </table>
            </div>
        </article>
    </section>
</main>

<script>
    $(document).ready(function() {
        $(".faq-row").on("click", function() {
            const answerRow = $(this).next(".faq-answer-row");
            answerRow.slideToggle(300);  // 부드러운 슬라이딩 효과
        });
    });
</script>
