<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%request.setCharacterEncoding("UTF-8");%>

<main>
    <section>
	    <article>
		    <div class="h3-title">
				<h3>등급혜택</h3>
			</div>
		    <div class="content">
		    
		        <!-- 나의 등급 정보 -->
		        <section class="my-grade">
		            <h2>나의 등급</h2>
		            <div class="grade-box">
		                <p>현재 등급: <span class="highlight">${member.rank}</span></p>
		                <p>산정 기간: ${member.joinDate} ~ 2024-12-31</p>
		                <p>혜택: 세차 10% 할인</p>
		            </div>
		        </section>
		        
		        <!-- 등급 혜택 안내 -->
		        <section class="grade-benefits">
		            <h2>등급별 혜택</h2>
		            <table>
		                <thead>
		                    <tr>
		                        <th>등급</th>
		                        <th>이용 횟수 기준</th>
		                        <th>혜택</th>
		                    </tr>
		                </thead>
		                <tbody>
		                    <tr>
		                        <td>브론즈</td>
		                        <td>1~5회</td>
		                        <td>기본 혜택</td>
		                    </tr>
		                    <tr>
		                        <td>실버</td>
		                        <td>6~10회</td>
		                        <td>5% 할인</td>
		                    </tr>
		                    <tr>
		                        <td>골드</td>
		                        <td>11~20회</td>
		                        <td>10% 할인</td>
		                    </tr>
		                    <tr>
		                        <td>플래티넘</td>
		                        <td>21회 이상</td>
		                        <td>15% 할인 + 무료 세차 쿠폰 1장</td>
		                    </tr>
		                </tbody>
		            </table>
		        </section>
		        
		        <!-- 등급 혜택 유의사항 -->
		        <section class="grade-notice">
		            <h2>등급 혜택 유의사항</h2>
		            <ul>
		                <li>등급은 매월 1일 자동 산정됩니다.</li>
		                <li>혜택은 등급 산정 후 익월부터 적용됩니다.</li>
		                <li>무료 세차 쿠폰은 발급 후 30일 이내 사용해야 합니다.</li>
		            </ul>
		        </section>
	        </div>
	    </article>
    </section>
</main>