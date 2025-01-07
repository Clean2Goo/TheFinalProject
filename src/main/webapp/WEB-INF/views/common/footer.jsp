<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <link rel="stylesheet" href="${contextPath}/resources/assets/css/footer.css">
  <title>하단 부분</title>
</head>
<body>
  <div class="footer-content">
    <div class="footer-logo">
      <img src="${contextPath}/resources/assets/images/logo2.png" alt="Logo" height="80">
    </div>
    <div class="team-info">
      <p><strong>팀장:</strong> 김현서</p>
      <p><strong>팀원:</strong> 김정오, 임재필, 하석준</p>
      <p><strong>훈련과정명:</strong> 멀티캠퍼스 채용연계 풀스택 개발자 부트캠프(스프링&리액트) 26회차</p>
      <p><strong>훈련기간:</strong> 2024-09-02 ~ 2025-03-03</p>
    </div>
    <div class="site-description">
      <p>본 사이트는 부트캠프 교육 과정 중 팀 프로젝트 기간에 수행한 과제이며,
      HTML/CSS, JavaScript, JSP, Spring 등을 활용하여 제작된 사이트입니다.
      이 프로젝트는 풀스택 개발 능력을 키우고, 실제 팀 협업 환경에서의 경험을 바탕으로
      다양한 기능을 구현하는 것을 목표로 했습니다. 많은 도움을 주신 멀티캠퍼스와 강사님들께
      감사드립니다.</p>
    </div>
  </div>

  <div class="footer-github">
    <a href="https://github.com/hsk7401/WashWise.git" target="_blank">
      <img src="${contextPath}/resources/assets/images/github_logo.png" alt="GitHub Logo" height="60">
    </a>
  </div>

</body>
</html>