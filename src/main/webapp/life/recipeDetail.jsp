<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>레세피상세페이지</title>
<link href="${pageContext.request.contextPath}/resources/css/main.css" rel="stylesheet" type="text/css">
<style>
.contentall {
	font-family: Malgun Gothic;
	background-color: #213421;
	padding:50px 0;
}
.content {
  	line-height:2em;
  	background-color: #FFFFFF;
  	width: 60%;
  	margin: 0 auto;
}
hr {
	border: 2px solid black;
	width: 100%;
}
.image01 {
	width: 75%; 
	height: 1100px;
}
.image02 {
	margin-left: 90px;
	width: 80%; 
	height: 500px;
}
.image03 {
	margin-left: 60px;
	width:35%; 
	height: 400px;
	display: inline-block;
}
.script{
	font-size: 15px;
	font-style: italic;
	margin-left: 2%;
	margin-bottom: 10%;
	width: 55%;
	height: 30%;
	line-height:3em;
	display: inline-block;
}
.recipe{
	margin-left: 5%;
	margin-right: 5%;
}

.justify{
	text-align:justify;
}

.under_line {
    border-bottom: 2px solid #243421;
    width: 100%;
}
</style>

</head>

<body>

<jsp:include page="/main/header.jsp" />
<jsp:include page="/main/banner_background.jsp" />
<div class="under_line"></div>
<div class="contentall">
<div class="content">
	<div class="recipe">
	<br><br><br><h1>${recipe.recipe_name}</h1>
	<hr>
	<br><img class="image02" src="./RecipeUpload/${recipe.recipe_image02}">
	<br><br><p style="font-size: 20px;">레시피재료</p><br>
	<p class="justify">${recipe.recipe_ingredient}</p>
	<br><p style="font-size: 20px;">레시피순서</p><br>
	<p class="justify">${recipe.recipe_content}</p>
	<br><br><img class="image03" src="./RecipeUpload/${recipe.recipe_image03}">
	<p class="script">"요리란 가족을 위해 하는 것이다"라는 글을 읽은 적이 있다.<br> 하지만 혼자 있을 때면 가족에게 하듯 오직 나만을 위해 요리를 한다.<br>그러면 나의 요리사 모자는 내가 일하는 레스토랑에서보다 더욱 빛난다.<br> 이곳은 음식 냄새가 풍기는 나의 집이다.<br> _스티브 더블래니커</p>
	<br>
	</div>
</div>
</div>
<jsp:include page="/main/footer.jsp" />

</body>
</html>