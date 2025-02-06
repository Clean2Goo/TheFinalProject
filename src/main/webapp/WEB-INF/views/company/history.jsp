<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<link rel="stylesheet" href="${contextPath}/resources/assets/css/about.css">
<link rel="stylesheet" href="${contextPath}/resources/assets/css/common.css">


    <main class="history">
      <div class="nav-links-background">
        <div class="description">
          <p>Clean2Go</p>
          <br />
          <h1>HISTORY</h1>
        </div>
        <div class="nav-links">
          <a href="about.html">회사소개</a>
          <a href="ceo.html">CEO 인사말</a>
          <a href="history.html">회사연혁</a>
        </div>
      </div>

      <!-- 타임라인 -->
      <div class="timeline-container">
        <!-- Left Section -->
        <div class="timeline-left">
          <h1>회사연혁</h1>
          <h2>2020 ~ 현재</h2>
          <p>세차 예약 플랫폼 아이디어 구상 시작</p>
          <p><strong>국내 최고의 세차 예약 서비스 선도</strong></p>
        </div>

        <!-- Right Section -->
        <div class="timeline-right">
          <ul>
            <li>
              <h3>
                <span>2025</span> <br />• 해외 진출 준비 시작, <br />
                인접 국가 대상 시장 조사 착수
              </h3>
            </li>
            <li>
              <h3><span>2024</span></h3>
              <p>• 투자 유치 성공</p>
              <p>• 누적 예약 건수 100만 돌파, 고객 만족도 90% 이상 달성</p>
            </li>
            <li>
              <h3><span>2023</span></h3>
              <p>• 호남지역 세차장 협의 체결</p>
              <p>• 전국 서비스 확대 및 제휴 세차장 100곳</p>
            </li>
            <li>
              <h3><span>2022</span></h3>
              <p>• 정기주주총회 개최</p>
              <p>• 즐겨찾기 서비스 오픈</p>
            </li>
            <li>
              <h3><span>2021</span></h3>
              <p>• 정식 서비스 런칭</p>
              <p>• 예약하기 서비스 오픈</p>
              <p>• 주식회사 클린투고 법인 전환</p>
            </li>
            <li>
              <h3><span>2020</span></h3>
              <p>• 회사창립, 세차 예약 플랫폼 아이디어 구상 시작</p>
              <p>• 첫 번째 프로토타입 제작</p>
              <p>• 베타 버전 출시, 주요 도시 세차장 10곳과 제휴</p>
            </li>
          </ul>
        </div>
      </div>
    </main>
