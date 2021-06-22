<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>레시피목록</title>
<link href="${pageContext.request.contextPath}/resources/css/main.css" rel="stylesheet" type="text/css">
<style>
.contentall {
	font-family: Malgun Gothic;
	background-color: #213421;
}
.content {
  	line-height:2em;
  	background-color: #FFFFFF;
  	width: 60%;
  	margin: 0 auto;
}
.title{
	background-image:url("./image/yellow.jpg");
	height: 500px;
}
.font{
	display:inline-block
	padding: 20%;
	text-align: center;
}
.list{
	margin-left: 0.5%;
	display: inline-block;
}
div.gallery {
	display: inline-block;
}
div.gallery:hover {
  	opacity: 0.5;
} 
div.gallery img {
  	width: 100%;
}
div.desc {
	border-top: 1px solid black;
	border-bottom: 1px solid black;
	padding: 15px;
  	text-align: center;
}
* {box-sizing: border-box;}
.responsive {
  	padding: 10px 6px;
	float: left;
  	width: 24.99999%;
}
.clearfix:after {
  	content: "";
  	display: table;
  	clear: both;
}
</style>

</head>

<body>

<jsp:include page="/main/header.jsp" />
<jsp:include page="/main/banner_background.jsp" />
<div class="contentall">
<div class="content">
	<div class="title">
		<iframe width="65%" height="500" src="https://www.youtube.com/embed/v-TtVvilah4?autoplay=1&mute=1" align="left" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
		<div class="font">
		<br><br><br><br><font style="font-size: 45px;">BeginVegan</font><br><br><br>
		<font style="font-size: 35px; font-style: italic;">All Recipes</font><br><br>
		<button onclick="#" style="font-size: 22px;">FILTER RECIPES >></button>
		</div>
	</div><br>

	<div class="list">
	<c:forEach items="${list}" var="recipe">
		<div class="responsive">
  		<div class="gallery">
  			<input type="hidden" value="${recipe.recipe_category}">
			<a href="./recipeDetail.go?recipe_number=${recipe.recipe_number}">
      		<img src="./RecipeUpload/${recipe.recipe_image01}" width="600" height="400">
    		</a>
    	<div class="desc">${recipe.recipe_name}</div>
  		</div>
		</div>
	</c:forEach>
	</div>
</div>
</div>

<jsp:include page="/main/footer.jsp" />
</body>
</html>