<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<link rel="stylesheet" href="${contextPath}/resources/assets/css/about.css">
<link rel="stylesheet" href="${contextPath}/resources/assets/css/common.css">

<main class="ui-history about">
      <div class="nav-links-background">
       <img src="${contextPath}/resources/assets/images/company/about-banner.jpg" alt="회사배너" />
        <div class="description">
          <p>Clean2Go</p>
          <br />
          <h1>ABOUT CLEAN2GO</h1>
        </div>
        <div class="nav-links">
          <a href="${contextPath}/about/info.do">회사소개</a>
          <a href="${contextPath}/about/ceo.do">CEO 인사말</a>
          <a href="${contextPath}/about/history.do">회사연혁</a>
        </div>
      </div>

      <div class="company-overview">
        <div class="text-content">
          <h3>기업 개요</h3>
          <p>세차 예약의 선두주자, Clean2Go!</p>
        </div>
      </div>

      <div class="value">
        <div class="card">
          <img src="${contextPath}/resources/assets/images/company/image.jpg" alt="빠른 예약" />
          <h4>빠른 예약</h4>
          <p>간편한 예약 절차</p>
        </div>
        <div class="card">
          <img src="${contextPath}/resources/assets/images/company/info.jpg" alt="세차장 정보" />
          <h4>세차장 정보</h4>
          <p>고객에게 새로운 세차장 정보 제공</p>
        </div>
        <div class="card">
          <img src="${contextPath}/resources/assets/images/company/bookmark.jpg" alt="즐겨찾기" />
          <h4>즐겨찾기</h4>
          <p>단골 세차장 신속 예약</p>
        </div>
      </div>

      <div class="h3-title">
        <h3>핵심 가치</h3>
      </div>

      <div class="value">
        <div class="card">
          <img src="${contextPath}/resources/assets/images/company/trust.jpg" alt="고객과 세차장 연결" />
          <h4>고객과 세차장 연결</h4>
          <p>최적의 플랫폼</p>
        </div>
        <div class="card">
          <img src="${contextPath}/resources/assets/images/company/data.jpg" alt="정확한 데이터" />
          <h4>정확한 데이터</h4>
          <p>신뢰의 기반</p>
        </div>
        <div class="card">
          <img src="${contextPath}/resources/assets/images/company/efficiency.jpg" alt="효율성" />
          <h4>효율성 극대화</h4>
          <p>시간과 자원의 절약</p>
        </div>
      </div>

      <!-- 캐러셀 -->
      <div class="carousel">
        <div class="carousel-track">
          <div class="carousel-slide">
            <img src="${contextPath}/resources/assets/images/company/logo.jpg" alt="logo" />
          </div>
          <div class="carousel-slide">
            <img src="${contextPath}/resources/assets/images/company/company.jpg" alt="회사모습" />
          </div>
          <div class="carousel-slide">
            <img src="${contextPath}/resources/assets/images/company/carwash.jpg" alt="세차" />
          </div>
        </div>
        <button class="carousel-btn prev">❮</button>
        <button class="carousel-btn next">❯</button>
      </div>
    </main>

    <script src="${contextPath}/resources/js/about.js"></script>

    