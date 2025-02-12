<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%request.setCharacterEncoding("UTF-8");%>

<main>
	<section>
		<article>
			<div class="h3-title">
				<h3>이벤트</h3>
			</div>
			<div class="content">
				<div class="data-grid">
					<table>
						<caption>이벤트</caption>
						<colgroup>
							<col class="col-8">
							<col class="col-auto">
							<col class="col-10">
							<col class="col-16">
							<col class="">
						</colgroup>
						<thead>
							<tr>
								<th >번호</th>
								<th >제목</th>
								<th >작성자</th>
								<th >등록일</th>
								<!-- 게시글 삭제 (슈퍼 관리자만 보임) -->
								<c:if test="${member.userType == 'systemOperator'}">
									<th>게시물관리</th>
								</c:if>
							</tr>
						</thead>
						<tbody>
							<c:if test="${empty articlesList}" >
								<tr>
									<td colspan="${isLogOn && member.userType != 'customer' ? 5 : 4}">등록된 글이 없습니다.</td>
								</tr>
							</c:if>
							<c:if test="${not empty articlesList}" >
								<c:forEach var="article" items="${articlesList}" varStatus="articleNum" >
									<tr>
										<td>${article.articleNO}</td>
										<td class="subject">
											<!-- 고객 / 로그인정보 없을시 -->
											<c:if test="${!isLogOn || member.userType == 'customer'}">
												<a href="${contextPath}/board/viewArticle.do?articleNO=${article.articleNO}">
													${article.title }
												</a>
											</c:if>
											<!-- 어드민: 로그인했을 때만 표시 -->
											<c:if test="${isLogOn && member.userType != 'customer'}">
												<a href="${contextPath}/board/adminViewArticle.do?articleNO=${article.articleNO}">
													${article.title }
												</a>
											</c:if>
										</td>
										<td>${article.userName}</td>
										<td>${article.writeDate}</td>
										<!-- 게시글 삭제 (슈퍼 관리자만 보임) -->
										<c:if test="${not empty member.userType && member.userType == 'systemOperator'}">
											<td>
												<form action="${contextPath}/board/removeArticle.do" method="post" style="display: inline;">
													<input type="hidden" name="articleNO" value="${article.articleNO}" />
													<button type="submit" class="ux-button button-table contained remove"><span class="label">삭제</span></button>
												</form>
											</td>
										</c:if>
									</tr>
								</c:forEach>
							</c:if>
						</tbody>
					</table>
				</div>
				<!-- 이벤트 등록 버튼 -->
				<c:if test="${member.userType == 'systemOperator'}">
					<div class="ux-button-bar">
						<a href="${contextPath}/board/adminArticleForm.do" class="ux-button contained primary" role="button" ><span class="label">이벤트 등록하기</span></a>
					</div>
				</c:if>
			</div>
		</article>
	</section>
</main>
<!-- <script>
	function fn_articleForm(isLogOn,articleForm,loginForm){
	  if(isLogOn != '' && isLogOn != 'false'){
	    location.href=articleForm;
	  }else{
	    alert("로그인 후 글쓰기가 가능합니다.")
	    location.href=loginForm+'?action=/board/articleForm.do';
	  }
	}
</script> -->
