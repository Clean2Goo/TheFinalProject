<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  isELIgnored="false"
 %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"  %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
 
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <style>
    * {
	    margin: 0;
	    padding: 0;
	    box-sizing: border-box;
	    font-family: Arial, sans-serif;
	}
	
	body {
	    background-color: #f5f8fa;
	    color: #333;
	}
	    
      #container {
        width: 100%;
        margin: 0px auto;
          text-align:center;
        border: 0px solid #bcbcbc;
      }
      #header {
        padding: 0px;
        margin: 0px;
        border: 0px solid #bcbcbc;
      }
     
      #content {
       
        padding: 0px;
        margin: 0px;
        float: center;
        border: 0px solid #bcbcbc;
      }
      #footer {
        clear: both;
        padding: 50px 20px;
        border: 0px solid #bcbcbc;
        color: #f8f4f8;
        background-color: #191f28;
      }
      
    </style>
    <title><tiles:insertAttribute name="title" /></title>
  </head>
    <body>
    <div id="container">
      <div id="header">
         <tiles:insertAttribute name="header"/>
      </div>
      
      <div id="content">
          <tiles:insertAttribute name="body"/>
      </div>
      <div id="footer">
          <tiles:insertAttribute name="footer"/>
      </div>
    </div>
    
    <script>
    document.addEventListener('DOMContentLoaded', function () {
        const userIcon = document.querySelector('.user_icon');
        const dropdownMenu = document.querySelector('.dropdown-menu');

        // 사용자 아이콘 클릭 시 드롭다운 토글
        userIcon.addEventListener('click', function (event) {
            event.stopPropagation(); // 클릭 이벤트가 부모 요소로 전파되지 않도록
            // 드롭다운 메뉴 표시/숨기기
            dropdownMenu.style.display = dropdownMenu.style.display === 'block' ? 'none' : 'block';
        });

        // 페이지 다른 곳을 클릭하면 드롭다운 메뉴 숨기기
        document.addEventListener('click', function () {
            dropdownMenu.style.display = 'none';
        });
    });
</script>
  </body>
</html>