<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채식레스토랑</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="${pageContext.request.contextPath}/resources/css/main.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
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
.nav01 {
 	font-size: 26px;
 	background-color: #213421;
 	color: #FFFFFF; 
 	text-align: center;
}
.menu01{
	width: 90%;
	margin-left: 5%;
}
img{
	width:60%;
	display: inline-block;
}
.intro{
	display: inline-block;
	padding: 1.5%;
}
iframe{margin-left: 10%;}
.adress{
	width: 80%;
	margin-left: 10%;
}
.w3-button w3-black{
	float:right;
}

.w3-white, .w3-hover-white:hover{
	color:#213421 !important;
}

#chk_btn {
    border-radius: 8px;
    font-size: 14px;
    padding: 7px 20px;
    background-color: #213421 !important;
    color: #ffffff !important;
    border: none;
    margin-top: 5px;
    transition: all 0.3s;
    float:right;
}
#chk_btn:hover {
    background-color: #649E64 !important;
}

</style>
</head>

<body>
<jsp:include page="/main/header.jsp" />
<jsp:include page="/main/banner_background.jsp" />
<div class="contentall">
<div class="content">
	<img src="../image/store01.jpg" onmouseover="this.src='../image/store03.jpg'" onmouseout="this.src='../image/store01.jpg'" border="0">
	<div class="intro"><h1>Think Vegan</h1><br><p style="font-size: 16px;">Think Vegan은 이름 그대로<br>'비건'을 생각하는 마음으로 시작했습니다.<br>환경, 건강, 동물, 지구를 살리는 마음을<br>모두 담아 실천하고자 합니다.<br>저희는 동물성 식재료를 사용하지 않으며<br> 유전자 변형도 없는 식물성 식재료 및<br> 채수사용을 고집합니다.</p>
	<p><b>서울특별시 마포구 망원1동 월드컵로 13길 55<br>오전11시-오후10시, 월요일 휴무</b></p></div>
	
	<div class="menu01">
	<br><h1 align="center" style="font-style: oblique;">THE MENU</h1><br>
	<div class="nav01">
  	<a href="#Main Dishes" class="w3-bar-item w3-button" style="width: 30%">Main Dishes</a>
  	<a href="#Salads" class="w3-bar-item w3-button" style="width: 30%">Salads</a>
  	<a href="#Drinks" class="w3-bar-item w3-button" style="width: 30%">Drinks</a>
  	</div>
	
	<br>
	<h1 id="Main Dishes" align="center" style="font-size: 25px; font-style: italic;">Main Dishes</h1>
	<div class="w3-container w3-white w3-padding-32">
	<h1><b>Roasted Vegetables</b><span class="w3-right" style="font-size: 30px">9,000</span></h1>
	<p class="w3-text-grey">squash, red bell pepper, potato, red onion, thyme, rosemary, vinegar</p>
	<hr>
	<h1><b>Mashed Peas</b> <span class="w3-right" style="font-size: 30px">12,000</span></h1>
	<p class="w3-text-grey">olive oil, peas, mint leaves, butter, browns sugar, green onion</p>
	<hr>
	<h1><b>Potatoes</b> <span class="w3-right" style="font-size: 30px">22,000</span></h1>
	<p class="w3-text-grey">potatoes, ramps, tomatoes, olive oil, red bell pepper, green onion</p>
	</div>
	
	<h1 id="Salads" align="center" style="font-size: 25px; font-style: italic;">Salads</h1>
	<div class="w3-container w3-white w3-padding-32">
	<h1><b>Red Salad</b><span class="w3-right" style="font-size: 30px">12,000</span></h1>
	<p class="w3-text-grey">cherry tomatoes, vegetable oil, cider vinegar, parsley, basil</p>
	<hr>
	<h1><b>Bean Salad</b> <span class="w3-right" style="font-size: 30px">15,000</span></h1>
	<p class="w3-text-grey">beans, walnuts, maple syrup, letucce, orange, juice, goat cheese</p>
	<hr>
	<h1><b>Papper Salad</b> <span class="w3-right" style="font-size: 30px">15,000</span></h1>
	<p class="w3-text-grey">green bell pepper, beet greens, oil, black pepper, lemon, spices</p>
	</div>
	
	<h1 id="Drinks" align="center" style="font-size: 25px;  font-style: italic;">Drinks</h1>
	<div class="w3-container w3-white w3-padding-32">
	<h1><b>Juice</b> Seasonal</span>
	<span class="w3-right" style="font-size: 30px">6,000</span></h1>
	<p class="w3-text-grey">orange, tomato, apple</p>
	<hr>
	<h1><b>Tea</b> <span class="w3-right" style="font-size: 30px">6,000</span></h1>
	<p class="w3-text-grey">black, green, earl grey, ceylon</p>
	<hr>
	<h1><b>Coffee</b> <span class="w3-right" style="font-size: 30px">6,000</span></h1>
	<p class="w3-text-grey">arabika, robusta, chicory</p>
	</div>
	</div>

   	<br><h1 align="center" style="font-style: oblique;">WHERE TO FIND US</h1>
   	<br><iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d581117.3662128148!2d126.35200972253898!3d37.526179865011166!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357c99707e0aab3b%3A0xf0ebc6a274e28dc6!2z65217YGs67mE6rG0!5e0!3m2!1sko!2skr!4v1618622184688!5m2!1sko!2skr" width=80% height="500px" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
   	<div class="adress">
   	<br><br><h1>Reservation</h1><br><p>단체석, 포장, 예약, 무선 인터넷, 반려동물 동반, 남/녀 화장실 구분, 제로페이</p><br>
   		<form action="#">
	 		<p><input class="w3-input w3-padding-16 w3-border" type="text" placeholder="Name" required name="Name"></p><br>
   			<p><input class="w3-input w3-padding-16 w3-border" type="number" placeholder="How many people" required name="People"></p><br>
   			<p><input class="w3-input w3-padding-16 w3-border" type="datetime-local" placeholder="Date and time" required name="date" value="2020-11-16T20:00"></p><br>
   			<p><input class="w3-input w3-padding-16 w3-border" type="text" placeholder="Message \ Special requirements" required name="Message"></p><br>
   			<p><button class="w3-button w3-black" type="submit" id="chk_btn" float:right; " >예약하기</button></p><br>
   		</form><br><br>
 	</div>
 </div> 
</div>
<jsp:include page="/main/footer.jsp" />
</body>
</html>