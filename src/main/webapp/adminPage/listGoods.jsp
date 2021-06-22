<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품목록</title>
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
#goods {
	font-family: Arial, Helvetica, sans-serif;
  	border-collapse: collapse;
  	width: 100%;
}
#goods td, #goods th {
  	padding: 8px;
  	text-align: center;
}
#goods tr:nth-child(even){background-color: #FFFFFF;}
#goods tr:hover {border-color: rgba(223, 249, 205, 0.35);}
#goods th {
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
	<h3 align="center">상품목록</h3>
	<table id="goods">
  		<tr>
    		<th>번호</th>
    		<th>카테고리</th>
    		<th>상품명</th>
    		<th>상품부제</th>
    		<th>상품수량</th>
    		<th>상품가격</th>
    		<th>상품등록날짜</th>
  			</tr>
  			<c:set var="sum" value="0" /> 
		<c:set var="count" value="-1" /> 
		<c:forEach items="${list}" var="goods">
			<c:set var="sum" value="${sum+1 }"/>
		</c:forEach>
		<c:forEach items="${list}" var="goods">
			<c:set var="count" value="${count+1 }"/>
		<tr>
			<td>${sum - count}</td>
			<td>${goods.category}</td>
			<td><a href="adminGoodsDetail.go?seq=${goods.seq}">${goods.name}</a></td>
			<td>${goods.shortco}</td>
			<td>${goods.amount}</td>
			<td>${goods.price}</td>
			<td><fmt:formatDate value="${goods.goods_date}" pattern="yyyy-MM-dd"/></td>
		</tr>
		</c:forEach> 
	</table>
	<button class="button" onclick="location.href='./adminPage/insertGoods.jsp'">등록</button>
</div>	
</body>
</html>