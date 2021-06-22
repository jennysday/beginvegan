<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>자주묻는질문관리</title>
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
#faqAdminInsert{
	width: 100%;
	line-height: 2.2;
	padding-left: 60px;
	padding-right: 60px;
}
input[type=text]{
 	width: 100%;
	padding: 12px 10px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}
input[type=submit] {
	width: 13%;
	color: #FFFFFF;
	padding: 5px 11px;
	margin: 8px 0;
	float: right;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	font-size: 17px;
	background-color: #213421;
}
input[type=submit]:hover {
	background-color: #213421;
	color: #FFFFFF;
}
input[type=button] {
	width: 13%;
	color: #FFFFFF;
	padding: 5px 11px;
	margin: 8px 0;
	float: right;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	font-size: 17px;
	background-color: #213421;
}
input[type=button]:hover{
	background-color: #213421;
	color: #FFFFFF;
}
input[type=submit], input[type=button]{
	display: inline;
	margin: 10px;
	float: right;
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
	<h3 align="center">자주하는질문:등록</h3>
	<form id="faqAdminInsert" name="faqAdminInsert" action="/board/insertBoard.fa" method="post" enctype="multipart/form-data">	
		<label for="title">제목</label><br>
		<textarea style="resize: none; width:100%;" rows="2" name="title" placeholder="자주하는 질문을 적으세요."></textarea><br>
		<label for="writer">작성자</label><br>
		<input type="text" id="writer" name="writer" value="관리자" readonly><br>
		<label for="content">내용</label><br>
		<textarea style="resize: none; width:100%;" rows="7" id="content" name="content" placeholder="내용을 적으세요."></textarea><br>
		 <input type="button" onclick="location.href='/board/getBoardList.fa'" value="목록"/>
		<input type="submit" value="등록" ><br><br> 
	</form>
</div>
</body>
</html>