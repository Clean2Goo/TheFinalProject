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

            <!-- 고정된 FAQ 내용 -->
          <div class="fixed-faq content">
    <h4>🔹 1. 서비스 이용 관련</h4>
    <ul>
        <li>
            <strong>1. 클린투고는 어떤 서비스인가요?</strong>
            <p>✔ 클린투고는 온라인 세차 예약 플랫폼으로, 전국 제휴 세차장에서 간편하게 세차를 예약할 수 있는 서비스입니다.</p>
            <p>✔ 현재 모바일 앱은 제공되지 않으며, 공식 홈페이지에서 모든 서비스를 이용할 수 있습니다.</p>
        </li>
        <li>
            <strong>2. 세차 예약은 어떻게 하나요?</strong>
            <p>✔ 클린투고 공식 홈페이지에 접속해 원하는 지역의 세차장을 검색하세요.</p>
            <p>✔ 예약 가능한 세차장을 선택하고, 원하는 날짜와 시간을 선택하여 예약을 완료하세요.</p>
            <p>✔ 모든 예약은 클린투고 공식 홈페이지에서 진행됩니다.</p>
        </li>
        <li>
            <strong>3. 예약 가능한 세차장은 어디에서 확인할 수 있나요?</strong>
            <p>✔ 클린투고 공식 홈페이지에서 세차장 검색 기능을 통해 확인할 수 있습니다.</p>
            <p>✔ 검색창에 원하는 지역을 입력하면 해당 지역의 제휴 세차장이 표시됩니다.</p>
        </li>
        <li>
            <strong>4. 예약을 취소하거나 변경할 수 있나요?</strong>
            <p>✔ 예약 취소 및 변경은 예약 내역 페이지에서 가능합니다.</p>
            <p>✔ 예약 변경은 세차장별 정책에 따라 제한될 수 있으며, 일부 세차장은 취소 수수료가 부과될 수 있습니다.</p>
        </li>
    </ul>

    <h4>🔹 2. 쿠폰 및 할인 혜택 관련</h4>
    <ul>
        <li>
            <strong>5. 클린투고 이벤트 쿠폰은 어떻게 받을 수 있나요?</strong>
            <p>✔ 클린투고에서 진행하는 이벤트를 통해 할인 쿠폰을 받을 수 있습니다.</p>
            <p>✔ 모든 쿠폰은 이메일로 제공되며, 클린투고 홈페이지에서 사용 가능합니다.</p>
        </li>
        <li>
            <strong>6. 쿠폰은 어떻게 사용하나요?</strong>
            <p>✔ 예약 결제 시, 이메일로 받은 쿠폰을 현장에서 직원에게 제시하시면 할인이 적용됩니다.</p>
            <p>✔ 쿠폰 사용 가능 여부는 예약 페이지에서 확인할 수 있습니다.</p>
        </li>
        <li>
            <strong>7. 쿠폰을 여러 개 중복 사용할 수 있나요?</strong>
            <p>✔ 쿠폰은 1회 예약당 1개만 사용 가능합니다.</p>
            <p>✔ 중복 적용은 불가능하며, 사용 가능한 가장 큰 할인율의 쿠폰을 선택하여 적용하세요.</p>
        </li>
    </ul>

    <h4>🔹 3. 멤버십 및 회원 관련</h4>
    <ul>
        <li>
            <strong>8. 클린투고 회원가입은 어떻게 하나요?</strong>
            <p>✔ 클린투고 공식 홈페이지에서 이메일을 이용해 간편하게 회원가입할 수 있습니다.</p>
        </li>
        <li>
            <strong>9. 클린투고 멤버십 등급은 어떻게 결정되나요?</strong>
            <p>✔ 최근 이용 실적을 기준으로 등급이 자동 부여됩니다.</p>
            <p>✔ 누적 이용에 따라 등급이 갱신되며, 브론즈, 실버, 골드, VIP 등급별 혜택이 적용됩니다.</p>
        </li>
        <li>
            <strong>10. 멤버십 혜택은 어떻게 받을 수 있나요?</strong>
            <p>✔ 멤버십 등급에 따라 자동으로 적용되는 할인 혜택이 있습니다.</p>
            <p>✔ VIP 등급 이상 고객에게는 무료 세차 쿠폰이 이메일로 제공됩니다.</p>
        </li>
    </ul>

    <h4>🔹 4. 이벤트 및 프로모션 관련</h4>
    <ul>
        <li>
            <strong>11. 클린투고에서 진행하는 이벤트는 어디에서 확인할 수 있나요?</strong>
            <p>✔ 클린투고 공식 홈페이지에서 진행 중인 이벤트를 확인할 수 있습니다.</p>
            <p>✔ 계절별 프로모션, 멤버십 혜택 이벤트 등이 정기적으로 업데이트됩니다.</p>
        </li>
        <li>
            <strong>12. 이벤트에서 받은 쿠폰은 어떻게 확인하나요?</strong>
            <p>✔ 이벤트 참여 후 당첨된 고객에게 쿠폰 코드가 이메일로 발송됩니다.</p>
            <p>✔ 이메일을 확인한 후, 현장에서 결제 시 해당 쿠폰을 직원에게 보여주세요.</p>
        </li>
        <li>
            <strong>13. 계절별 프로모션 혜택은 자동 적용되나요?</strong>
            <p>✔ 이벤트별로 당첨된 추가 혜택(예: 무료 세차 쿠폰)은 이메일로 개별 발송됩니다.</p>
        </li>
    </ul>

    <h4>🔹 5. 고객 지원 및 시스템 관련</h4>
    <ul>
        <li>
            <strong>14. 클린투고에서 모바일 앱을 지원하나요?</strong>
            <p>✔ 현재 클린투고는 모바일 앱을 제공하지 않으며, 공식 홈페이지에서 모든 예약 및 혜택을 이용할 수 있습니다.</p>
        </li>
        <li>
            <strong>15. 고객센터에 문의하려면 어떻게 해야 하나요?</strong>
            <p>✔ 고객센터 운영 시간: 평일 오전 9시 ~ 오후 6시</p>
            <p>✔ 문의 방법:</p>
            <ul>
                <li>전화 상담: 070-1234-5678</li>
                <li>이메일 문의: Clean2Go@gmail.com</li>
            </ul>
        </li>
    </ul>
</div>

            <!-- 메시지 표시 -->
            <c:if test="${not empty successMessage}">
                <div class="alert alert-success">${successMessage}</div>
            </c:if>
            <c:if test="${not empty errorMessage}">
                <div class="alert alert-danger">${errorMessage}</div>
            </c:if>

            <!-- FAQ 리스트 -->
            <div class="faq-list-container content">
                <div class="faq-actions">
                    <!-- 질문 작성 버튼 -->
                    <c:if test="${member != null && member.userType == 'customer'}">
                        <a href="${contextPath}/faq/userQuestionForm.do" class="btn btn-primary">질문 작성</a>
                    </c:if>
                    <c:if test="${member != null && member.userType != 'customer'}">
                        <a href="${contextPath}/faq/adminQuestionForm.do" class="btn btn-primary">질문 작성</a>
                    </c:if>
                </div>

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

                <!-- 페이지네이션 -->
                <div class="pagination">
                    <c:if test="${pagination.currentPage > 1}">
                        <a href="${contextPath}/faq/listFaqs.do?page=${pagination.prevPage}&searchKeyword=${param.searchKeyword}" class="prev">이전</a>
                    </c:if>
                    <c:forEach var="i" begin="${pagination.startPage}" end="${pagination.endPage}">
                        <a href="${contextPath}/faq/listFaqs.do?page=${i}&searchKeyword=${param.searchKeyword}" class="${i == pagination.currentPage ? 'active' : ''}">
                            ${i}
                        </a>
                    </c:forEach>
                    <c:if test="${pagination.currentPage < pagination.totalPages}">
                        <a href="${contextPath}/faq/listFaqs.do?page=${pagination.nextPage}&searchKeyword=${param.searchKeyword}" class="next">다음</a>
                    </c:if>
                </div>
                <!-- 페이지네이션 끝 -->
            </div>
        </article>
    </section>
</main>

<script>
    $(document).ready(function() {
        $(".faq-row").on("click", function() {
            const answerRow = $(this).next(".faq-answer-row");
            answerRow.slideToggle(300);  
        });
    });
</script>
