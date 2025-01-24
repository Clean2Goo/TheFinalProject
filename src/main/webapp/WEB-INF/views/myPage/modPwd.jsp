<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%request.setCharacterEncoding("UTF-8");%>

<main>
    <section>
	    <article>
		    <div class="h3-title">
				<h3>비밀번호 변경</h3>
			</div>
		    <div class="content">
		        <form name="frm" class="" method="post" action="passChangeSub.jsp">
			        <table>
			        	<tr>
			        		<th>현재 비밀번호</th>
			        		<td><input type="password" name="pass1"></td>
			        	</tr>
			        	<tr>
			        		<th>새 비밀번호</th>
			        		<td><input type="password" name="pass2"></td>
			        	</tr>
			        	<tr>
			        		<th>새 비밀번호 확인</th>
			        		<td><input type="password" name="pass3"></td>
			        	</tr>
			        </table>
			        <button type="submit">적용</button>
			        <button type="button">닫기</button>
		        </form>
	        </div>
	    </article>
    </section>
</main>