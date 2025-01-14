<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<footer>
	<section class="footer-pc">
		<article>
			<div class="link-list">
				<ul>
					<li><a href="" class="ux-link bold">개인정보처리방침</a></li>
					<li><a href="" class="ux-link">회사소개</a></li>
					<li><a href="" class="ux-link">공지사항</a></li>
					<li><a href="" class="ux-link">고객정보취급방침</a></li>
				</ul>
			</div>
			<div class="company-info">
				<h1><a href="${contextPath}/main.do" class="ux-link h1">Clean2Go</a></h1>
				<ul>
					<li>
						<dl>
							<dt>대표이사 : </dt>
							<dd><span class="value">김이하임</span></dd>
						</dl>
					</li>
					<li>
						<dl>
							<dt>본점 : </dt>
							<dd><span class="value">멀티캠퍼스 final-pj-ZOOM/2025-2호</span></dd>
						</dl>
					</li>
					<li>
						<dl>
							<dt>고객센터 : </dt>
							<dd><span class="value">2025-ABCD (AM.09:10 ~ PM.17:51)</span></dd>
						</dl>
					</li>
				</ul>
			</div>
			<div class="copyright-info">
				<dl>
					<dt><span class="label">COPYRIGHT© 2025</span></dt>
					<dd><span class="value">CAMPROAD CO., LTD All rights reserved.</span></dd>
				</dl>
			</div>
		</article>
	</section>
</footer>