<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%request.setCharacterEncoding("UTF-8");%>


<% 
    // 현재 날짜를 기준으로 lastMonthLastDay를 구하는 Java 코드
    java.util.Calendar calendar = java.util.Calendar.getInstance();
    calendar.set(java.util.Calendar.DAY_OF_MONTH, 1); // 첫날로 설정
    calendar.add(java.util.Calendar.DAY_OF_MONTH, -1); // 하루를 빼서 지난 달의 마지막 날로 설정
    java.util.Date lastMonthLastDay = calendar.getTime();
    pageContext.setAttribute("lastMonthLastDay", lastMonthLastDay); // lastMonthLastDay 변수 설정
%>

<style>
.grade-intro {
    font-size: 16px;
    margin-bottom: 30px;
    color: #555;
}

/* 나의 등급 */
.my-grade {
    background-color: #f9f9f9;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
    margin-bottom: 30px;
}

.my-grade h4 {
    color: #333;
    margin-bottom: 15px;
}

/* 주요 혜택 리스트 */
.my-grade h5 {
    margin-top: 15px;
}

.my-grade ul {
    list-style-type: disc;
    padding-left: 20px;
    color: #555;
}

/* 등급 혜택 테이블 */
.grade-benefits h4 {
    margin-bottom: 15px;
    color: #333;
}

.benefits-table {
    width: 100%;
    border-collapse: collapse;
    margin-bottom: 30px;
}

.benefits-table th, .benefits-table td {
    padding: 12px;
    text-align: center;
    border: 1px solid #ddd;
}

.benefits-table th {
    background-color: #f4f4f4;
    color: #333;
}

.benefits-table tr:nth-child(even) {
    background-color: #f9f9f9;
}

/* 유의사항 */
.benefits-notice {
    font-size: 16px;
    color: #555;
}

.benefits-notice ul {
    list-style-type: circle;
    padding-left: 20px;
}
</style>

<main>
    <section>
	    <article>
		    <div class="h3-title">
				<h3>등급혜택</h3>
			</div>
		    <div class="content">
				<!-- 등급제 소개 -->
	            <div class="grade-intro">
	                <p>클린투고를 이용하는 고객님께 더 많은 혜택을 제공하기 위해 이용 실적에 따라 멤버십 등급이 자동으로 부여됩니다. 각 등급에 맞는 혜택을 즐기실 수 있습니다.</p>
	            </div>
	            
	            <!-- 나의 등급 -->
	            <div class="my-grade">
	                <h4>나의 등급</h4>
	                    <p><strong>현재 등급:</strong> <span id="current-grade">${member.rank}</span></p>
	                    <p><strong>이용 실적:</strong> <span id="usage-count">${member.totalRSVN}회</span></p>
	                    <p><strong>산정 기간:</strong> <span id="calculation-period">${member.joinDate} ~ <fmt:formatDate value="${lastMonthLastDay}" pattern="yyyy-MM-dd" /></span></p>
	                    <h5>🎁 주요 혜택</h5>
	                    <ul>
	                        <li>가입 축하 2,000원 할인 쿠폰 제공</li>
	                        <li>생일 쿠폰 지급</li>
	                    </ul>
	            </div>
	            
	            <!-- 등급 혜택 안내 -->
	            <div class="grade-benefits">
	                <h4>🎉 등급 혜택 안내</h4>
	                <table class="benefits-table">
	                    <thead>
	                        <tr>
	                            <th>등급</th>
	                            <th>이용 실적</th>
	                            <th>주요 혜택</th>
	                        </tr>
	                    </thead>
	                    <tbody>
	                        <tr>
	                            <td><strong>Basic</strong></td>
	                            <td>0 ~ 3회</td>
	                            <td>가입 축하 2,000원 할인 쿠폰 제공 + 생일 쿠폰 지급</td>
	                        </tr>
	                        <tr>
	                            <td><strong>Standard</strong></td>
	                            <td>4회 이상</td>
	                            <td>세차 5% 결제 할인 쿠폰 제공</td>
	                        </tr>
	                        <tr>
	                            <td><strong>Premium</strong></td>
	                            <td>8회 이상</td>
	                            <td>세차 10% 결제 할인 쿠폰 제공</td>
	                        </tr>
	                        <tr>
	                            <td><strong>VIP</strong></td>
	                            <td>15회 이상</td>
	                            <td>세차 15% 결제 할인 쿠폰 제공 + 무료 세차 쿠폰 제공 + 우선 예약 혜택</td>
	                        </tr>
	                    </tbody>
	                </table>
	            </div>
	            
	            <!-- 등급 혜택 유의사항 -->
	            <div class="benefits-notice">
	                <h4>등급 혜택 유의사항</h4>
	                <ul>
	                    <li>세차 할인 쿠폰은 발급 후 <strong>30일 이내</strong> 사용하셔야 합니다.</li>
	                    <li>혜택은 등급 산정 후 익월부터 적용됩니다.</li>
	                    <li>등급 산정은 매월 1일에 자동으로 이루어집니다.</li>
	                </ul>
	            </div>
	        </div>
        </article>
    </section>
</main>