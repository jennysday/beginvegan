<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채식라이프</title>
<link href="${pageContext.request.contextPath}/resources/css/main.css" rel="stylesheet" type="text/css">
<style>
.contentall {
	font-family: Malgun Gothic;
	background-color: #213421;
	margin: 0 auto;
}
.content {
  	line-height:2em;
  	width: 60%;
  	margin: 0 auto;
 	background-color: #FFFFFF;
 }
.image01 {
	background-image:url("../image/image01.jpg");
	width: 35%;
	height: 480px;
	float: left;
	background-repeat:no-repeat; 
	background-size: contain;
	display: inline-block;
	margin-bottom: -1px;
}
.menu01 {
	background-color:#FFFFFF;
	padding-top:6%;
	padding-left:7%;
	display: inline-block;
	width: 65%;
	height: 480px;
	margin-bottom: -1px;
}
.image02 {
	background-image:url("../image/image02.jpg");
	width: 35%;
	height: 480px;
	float: left;
	background-repeat:no-repeat; 
	background-size: contain;
	display: inline-block;
	margin-bottom: -1px;
}
.menu02 {
	background-color:#FFFFFF;
	padding-top:6%;
	padding-left:7%;
	display: inline-block;
	width: 65%;
	height: 480px;
	margin-bottom: -1px;
	background-image: 
}
.image03 {
	background-image:url("../image/image03.jpg");
	width: 35%;
	height: 480px;
	float: left;
	background-repeat:no-repeat; 
	background-size: contain;
	display: inline-block;
	margin-bottom: -1px;
}
.menu03 {
	background-color:#FFFFFF;
	padding-top:3%;
	padding-left:7%;
	display: inline-block;
	width: 65%;
	height: 480px;
	margin-bottom: -1px;
}
.image04 {
	background-image:url("../image/image04.jpg");
	width: 35%;
	height: 480px;
	float: left;
	background-repeat:no-repeat; 
	display: inline-block;
	background-size: contain;
	margin-bottom: -1px;
}
.menu04 {
	background-color:#FFFFFF;
	padding-top:6%;
	padding-left:7%;
	display: inline-block;
	width: 65%;
	height: 480px;
	margin-bottom: -1px;
}
.title{
	font-size: 36px;
}
p {
 	margin-left: 70px;
}
.button {
	background-color:#FFFFFF; 
	border: 1px solid #213421;
	padding: 10px 25px;
	color: #213421;
	font-size: 16px;
	transition-duration: 0.4s;
	float: none;
	width: 450px;
	font-family: Malgun Gothic;
}
.button:hover{
	background-color: #213421;
	color: #FFFFFF;
	font-family: Malgun Gothic;
}
</style>
</head>
	
<body>
<jsp:include page="/main/header.jsp" />
<jsp:include page="/main/banner_background.jsp" />

	<div class="contentall">
		<div class="content">
		<div class="image01"></div>
		<div class="menu01">
  			<br><p class="title"><b>It’s Easy to Eat Vegan!</b></p><br>
 			<p><b>맛의 풍성함, 건강함, 편안함</b>을<br>  
     		우리는 채식을 통해 얻을 수 있습니다.<br>
     		채식이 어렵게만 느껴지신다면	우선 <b>채식가이드</b>를 클릭하세요.<br>
     		곧 채식이 쉽고, 즐거워집니다.</p><br>
     		<button class="button" onclick="location.href='lifeGuide01.jsp'"><b>채식가이드</b></button></div>
		<div class="image02"></div>
		<div class="menu02" >
  			<br><p class="title"><b>It’s Easy to Cook Vegan!</b></p><br>
			<p><b>맛있고, 건강한</b> 채식음식을<br>  
			요리하는데 많은 시간이 필요하지는 않습니다.<br>
			따라하기 쉬운 채식레시피에 도전하고 싶으시다면<br>
			우선 <b>채식레시피</b>를 클릭하세요.	다양한 레시피 정보를 제공합니다.</p><br>
			<button class="button" onclick="location.href='../recipeList.go'"><b>채식레시피</b></button></div>
		<div class="image03"></div> 
  		<div class="menu03">
  			<br><p class="title" style="line-height: 1.4;" ><b>It’s Easy to<br>Find the Vegan Restaurant!</b></p><br>
  			<p><b>고급 식사</b>에서 <b>패스트푸드</b>에 이르기까지<br>  
			다양한 채식음식점에 대한 유용한 정보를 얻고 싶으시다면<br>
     		우선 <b>채식레스토랑</b>을 클릭하세요.<br>
     		방문이 후회없는 엄선된 레스토랑 정보를 제공합니다.</p><br>
     		<button class="button" onclick="location.href='restaurantList.jsp'"><b>채식레스토랑</b></button></div>
     	<div class="image04"></div> 
     	<div class="menu04">
  			<br><p class="title" style="word-spacing:-3px;" ><b>It’s Easy to Buy the Vegan Food!</b></p><br>
  			<p><b>채식음식</b> 쇼핑을 원하신다면<br>
  			우선 <b>채식상품몰</b>를 클릭하세요.<br>
     		영양 만점, 맛 좋은 BeginVegan의 상품들을
     		<br>구경하고 구매하실 수 있습니다.</p><br>
     		<button class="button" onclick="location.href='../goods/getGoodsList.jsp'"><b>채식상품몰</b></button></div>
     </div>
  	</div>


<jsp:include page="/main/footer.jsp" />
</body>
</html>