<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>고객문의관리</title>
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
#qaaAdminDetail{
	width: 100%;
	line-height: 2.2;
	padding-left: 60px;
	padding-right: 60px;
}
input[type=text] {
 	width: 100%;
	padding: 12px 10px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
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
	<h3 align="center">고객문의확인</h3>
 	 <form id="qaaAdminDetail" name="qaaAdminDetail">
		<label for="subject">제목</label><br>
   		<input type="text" id="title" name="title" value="${adminqaa.subject}" readonly/><br>
   		<label for=content>내용</label><br>
    	<textarea style="resize: none; width:100%;" rows="15" id="content" name="content" readonly>${adminqaa.content }</textarea><br>
    	<label for="date">등록일</label>
		<input type="text" id="date" name="date" value="${adminqaa.qaa_date}" readonly/>
		<c:if test='${adminqaa.image != null}'>
	 	    <label for="image">이미지</label><br>
		    <img src="${adminqaa.image }" width="300" height="200"/><br><br>
		</c:if>
 	</form>
 	<br><br><br><br>
</div>
</body>
</html>