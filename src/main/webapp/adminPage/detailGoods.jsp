<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품관리</title>
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
#detailGoods{
	width: 100%;
	line-height: 2.2;
	padding-left: 60px;
	padding-right: 60px;
}
input[type=text], select {
 	width: 100%;
	padding: 12px 10px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}
input[type=file] {
	font-size: 15px;
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
	<h3 align="center">상품수정</h3>
 	 <form id="detailGoods" name="detailGoods" action="./modifyGoods.go?seq=${goods.seq}" method="post" enctype="multipart/form-data">
   		<label for="category">상품분류</label>
    		<select id="category" name="category" size="1">
				<option value="${goods.category}" selected>${goods.category}</option>
				<option value="dish" >반찬/요리</option>
				<option value="fast">샐러드/간편식/즉석식품</option>
				<option value="drink">두유/요거트/음료</option>
				<option value="source">양념/소스/조미료</option>
				<option value="daily">베이커리/치즈/버터</option>
				<option value="snack">간식/초콜릿</option>
			</select>
        <label for="name">상품명</label>
		<input type="text" id="name" name="name" value="${goods.name}">
		<label for="shortco">상품부제</label>
		<input type="text" id="shortco" name="shortco" value="${goods.shortco}">
    	<label for=content>상품설명</label>
    	<br><textarea style="resize: none; width:100%;" rows="10" name="content">${goods.content}</textarea><br><br>
    	<label for="amount">&nbsp;&nbsp;상품수량</label>
   		<input type="number" id="amount" name="amount" value="${goods.amount}"><br><br>
		<label for="price">&nbsp;&nbsp;상품가격</label>
    	<input type="number" id="price" name="price" value="${goods.price}"><br><br>
	    <label for="file01">상품이미지01</label><br>
	    <img src="./GoodsUpload/${goods.image01 }" width="300" height="200"/><br><br>
    	<input type="file" id="image01" name="file01"><br><br>
    	<label for="file02">상품이미지02</label><br>
    	<img src="./GoodsUpload/${goods.image02 }" width="300" height="200"/><br><br>
    	<input type="file" id="image02" name="file02"><br><br>
    	<label for="file03">상품이미지03</label><br>
    	<img src="./GoodsUpload/${goods.image03 }" width="300" height="200"/><br><br>
    	<input type="file" id="image03" name="file03"><br><br>
        <input type="button" onclick="location.href='./deleteGoods.go?seq=${goods.seq}'" value="삭제" >
        <input type="submit" value="수정" ><br><br> 
 	</form>
</div>
</body>
</html>