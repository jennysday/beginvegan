<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리</title>
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
#member {
  	font-family: Arial, Helvetica, sans-serif;
  	border-collapse: collapse;
  	width: 100%;
}
#member td, #member th {
  	padding: 8px;
  	text-align: center;
}
#member tr:nth-child(even){background-color: #FFFFFF;}
#member tr:hover {border-color: rgba(223, 249, 205, 0.35);}
#member th {
  	padding-top: 12px;
  	padding-bottom: 12px;
  	background-color: #213421;
  	color:  #FFFFFF;
}
input[type=text] {
 	width: 30%;
	padding: 12px 10px;
	display: inline-block;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}
select{
	width: 15%;
	padding: 12px 10px;
	display: inline-block;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}
input[type=submit] {
	width: 13%;
	color:  #FFFFFF;
	padding: 10px 8px;
	margin: 8px 0;
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
	<h3 align="center">회원목록</h3>
	<form action="./memberList.ad" method="post">
		<table id="member">
			<tr>
			<td colspan="4" align="center">
				<select name="searchCondition">
				<c:forEach items="${conditionMap }" var="option">
					<option value="${option.value }">${option.key }
				</c:forEach>							
				</select> 
				<input type="text" name="searchKeyword" /> 
				<input type="submit" value="검색" /></td>
			</tr>
			<tr>
    		<th>아이디</th>
    		<th>비밀번호</th>
    		<th>이름</th>
    		<th>핸드폰번호</th>
			</tr>
			<c:forEach items="${memberList }" var="members">
			<tr>
				<td>${members.id}</td>
				<td>${members.pw}</td>
				<td>${members.name}</td>
				<td>${members.phone}</td>
			</tr>
			</c:forEach>
		</table>
	</form><br><br><br><br>
</div>
</body>
</html>