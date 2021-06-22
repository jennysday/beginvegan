<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Handlee&display=swap" rel="stylesheet">
<title>채식라이프</title>
<link href="${pageContext.request.contextPath}/resources/css/main.css" rel="stylesheet" type="text/css">
<style>
.contentall {
	font-family: Malgun Gothic;
	background-color: #213421;
	margin: 0 auto;
	min-height: 1400px;
}
.content {
	line-height:2em;
  	width: 60%;
  	margin: 0 auto;
 	background-color: #FFFFFF;
 	min-height: 1400px;
 }
.image01{
	display: inline-block;
	float: left;
	width: 30%;
	margin-left: 8%;
	margin-top: 10%;
}
.message01{
	display: inline-block;
	padding: 3%;
	margin-top: 12%;
	margin-left: 2%;
	line-height: 1.5em;
}
.value{
	margin-left: 8%;
	margin-bottom: 2%;
	margin-top: 5%;
	display: inline-block;
}
.val{width: 59%; margin-left: 60px;}
.val02{width: 55%; margin-left: 55px;}
.val03{width: 63%; margin-left: 60px;}
.ment{
margin-top: 8%;
margin-left: 20%;
display: inline-block;
border-color: 
}
</style>
</head>
	
<body>
<jsp:include page="/main/header.jsp" />
<jsp:include page="/main/banner_background.jsp" />

	<div class="contentall">
		<div class="content">
		<div>
		<img class="image01" alt="" src="../image/company.jpg">	
		</div>	
		<div class="message01">
		<p style="font-size: 30px;">세상이 비건을 시작했다.</p><br>
		<p style="font-size: 42px; ">WE MAKE WORLD VEGAN</p><br><br>
		<h3 style="font-size: 18px; line-height: 1.8em;">BeginVegan은 단순히 상품을 파는 곳이 아닙니다.<br>여러분과 함께 비건의 가치를 만들고 가꾸어 가는 곳 입니다.
		<br>내 몸을 아끼는 마음, 환경을 생각하는 마음으로 함께 만들어 갑니다.</h3>
		</div><br><br><br>
	<div class="value">	
		<div class="w3-third">
  		<h3 style="text-align: center">[건강을 담다]</h3><br>
  		<img class="val" src="../image/value01.jpg">
    	<br><br><h3 style="font-size: 18px; line-height: 1.8em; text-align: center;"> 자연이 선물하는<br>생동감 넘치는 건강함을<br>당신에게 담겠습니다</h3>
  		</div>
  		<div class="w3-third">
  		<h3 style="text-align: center">[맛을 담다]</h3><br>
  		<img class="val02" src="../image/value03.jpg">
    	<br><br><h3 style="font-size: 18px; line-height: 1.8em; text-align: center;"> 균형잡힌 영양,<br>오감을 자극하는 맛있는 맛을<br>당신에게 담겠습니다</h3>
  		</div>
  		<div class="w3-third">
  		<h3 style="text-align: center">[가치를 담다]</h3><br>
  		<img class="val03" src="../image/value02.jpg">
    	<br><br><h3 style="font-size: 18px; line-height: 1.8em; text-align: center;"> 나의 소비가<br>더 나은 세상을 만드는 가치를<br>당신에게 담겠습니다</h3>
  		</div>
  	</div>
  	  	<div class="ment">
  	  	<h1 style="text-align: center;">"</h1><h3 style="text-align: center; font-size: 24px; line-height: 1.8em; font-style: italic;">비건의 모든 것, BeginVegan에 오신 것을 환영합니다.<br>그 첫 출발을 내딛은 여러분을 환영합니다.<br>레스토랑에서 비건 메뉴를 당당히 찾을 수 있는 그날이 올 때까지<br> BeginVegan이 함께 하겠습니다.</h3><h1 style="text-align: center;"><br>"</h1>
  	 </div>
  	 
  	 </div>    



<jsp:include page="/main/footer.jsp" />
</body>
</html>