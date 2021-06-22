<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
#qaa {
  	font-family: Arial, Helvetica, sans-serif;
  	border-collapse: collapse;
  	width: 100%;
}
#qaa td, #qaa th {
  padding: 8px;
  text-align: center;
}
#qaa tr:nth-child(even){background-color:#FFFFFF;}
#qaa tr:hover {border-color: rgba(223, 249, 205, 0.35);}
#qaa th {
  padding-top: 12px;
  padding-bottom: 12px;
  background-color: #213421;
  color:#FFFFFF;
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
	<h3 align="center">고객문의목록</h3><br>
	<table id="qaa">
		<tr>    		
    		<th>카테고리</th>
    		<th>제목</th>
    		<th>작성자</th>
    		<th>상태</th>
   			<th>일자</th>
  		</tr>
		<c:forEach items="${qaaBoardList}" var="board">
		<tr>
			<td>${board.category }</td>
			<td><a href="getBoard.aq?re_ref=${board.re_ref}&status=${board.status}">${board.subject }</a></td>
			<td>${board.id }</td>
			<td>${board.status }</td>
			<td><fmt:formatDate value="${board.qaa_date}" pattern="yyyy-MM-dd"/></td>
		</tr>
		</c:forEach> 
	</table>
	<br><br><br><br>
</div>
</body>
</html>