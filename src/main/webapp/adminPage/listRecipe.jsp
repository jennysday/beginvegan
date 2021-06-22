<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>레시피관리</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
a {color: inherit; text-decoration: none;}
* {box-sizing: border-box;}
body {
	margin: 0 auto;
	font-family: Arial, Helvetica, sans-serif;
	width: 60%;
}
.w3-teal{
	padding: 10px;
	background-color: #213421 !important
}
.w3-container {
	padding: 10px;
	background-color: rgba(249, 225, 205, 0.35);
	height:100%;
}
h1{
	text-align: center;
}
#recipe {
	font-family: Arial, Helvetica, sans-serif;
  	border-collapse: collapse;
  	width: 100%;
}
#recipe td, #recipe th {
  padding: 8px;
  text-align: center;
}
#recipe tr:nth-child(even){background-color: #FFFFFF;}
#recipe tr:hover {background-color: rgba(223, 249, 205, 0.35);}
#recipe th {
  padding-top: 12px;
  padding-bottom: 12px;
  background-color: #213421;
  color: #FFFFFF;
}
.button{
	width: 13%;
	color: #FFFFFF;
	padding: 10px;
	margin: 8px 0;
	float:right; 
	border: none;
	border-radius: 4px;
	cursor: pointer;
	font-size: 17px;	
	background-color: #213421;
}
.button:hover{
	background-color:#213421;
	color: #FFFFFF;
}
</style>
</head>

<body>
<script>
function w3_open() {
	document.getElementById("mySidebar").style.display = "block";
}

function w3_close() {
	document.getElementById("mySidebar").style.display = "none";
}
</script>

<%@ include file="adminMainIncludeHeaderHamburger.jsp" %> 


<div class="w3-container">
	<h3 align="center">레시피목록</h3>
	<table id="recipe">
  		<tr>
    		<th>번호</th>
    		<th>카테고리</th>
    		<th>레시피명</th>
    		<th>이미지</th>
    		<th>등록날짜</th>
  		</tr>
		<c:forEach items="${list}" var="recipe">
		<tr>
			<td>${recipe.recipe_number}</td>
			<td>${recipe.recipe_category}</td>
			<td><a href="adminRecipeDetail.go?recipe_number=${recipe.recipe_number}">${recipe.recipe_name}</a></td>
			<td>${recipe.recipe_image01}</td>
			<td><fmt:formatDate value="${recipe.recipe_date}" pattern="yyyy-MM-dd"/></td>
		</tr>
		</c:forEach> 
	</table>
	<button class="button" onclick="location.href='./adminPage/insertRecipe.jsp'">등록</button>
</div>
</body>
</html>