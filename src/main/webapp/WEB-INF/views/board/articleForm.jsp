<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%request.setCharacterEncoding("UTF-8");%>

<!DOCTYPE html>
<html>
<head>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script  src="${contextPath}/resources/lib/jquery-3.1.1.min.js"></script>
<script  src="<c:url value='/resources/lib/jquery-3.1.1.min.js' />" ></script>
<script type="text/javascript">
   function readURL(input) {
      if (input.files && input.files[0]) {
	      var reader = new FileReader();
	      reader.onload = function (e) {
	        $('#preview').attr('src', e.target.result);
          }
         reader.readAsDataURL(input.files[0]);
      }
  }  
  function backToList(obj){
    obj.action="${contextPath}/board/listArticles.do";
    obj.submit();
  }
  
  var cnt=1;
  function fn_addFile(){
	  $("#d_file").append("<br>"+"<input type='file' name='file"+cnt+"' />");
	  cnt++;
  }  

</script>
</head>
<main>
	<section>
		<article>
			<div class="h3-title">
				<h3>글쓰기</h3>
			</div>
			<div class="content">
			  <form name="articleForm" method="post"   action="${contextPath}/board/addNewArticle.do"   enctype="multipart/form-data">
			    <table border="0" align="center">
			      <tr>
								<td align="right"> 작성자</td>
								<td colspan=2  align="left"><input type="text" size="20" maxlength="100"  value="${member.name }" readonly/> </td>
						</tr>
				     <tr>
						   <td align="right">글제목: </td>
						   <td colspan="2"><input type="text" size="67"  maxlength="500" name="title" /></td>
					 </tr>
				 		<tr>
							<td align="right" valign="top"><br>글내용: </td>
							<td colspan=2><textarea name="content" rows="10" cols="65" maxlength="4000"></textarea> </td>
			     </tr>
			     <tr>
						  <td align="right">이미지파일 첨부:  </td>
						  <td> <input type="file" name="imageFileName"  onchange="readURL(this);" /></td>
						  <td><img  id="preview" src="#"   width=200 height=200/></td>
						  
						  
						  <td align="right">이미지파일 첨부</td>
							<td align="left"> <input type="button" value="파일 추가" onClick="fn_addFile()"/></td>
							
							
				   </tr>
				   <tr>
				      <td colspan="4"><div id="d_file"></div></td>
				   </tr>
				    <tr>
				      <td align="right"> </td>
				      <td colspan="2">
				       <input type="submit" value="글쓰기" />
				       <input type=button value="목록보기"onClick="backToList(this.form)" />
				      </td>
			     </tr>
			    </table>
			  </form>
			</div>
		</article>
	</section>
</main>
</html>
