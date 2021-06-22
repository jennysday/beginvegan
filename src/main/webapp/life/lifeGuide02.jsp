<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>채식가이드</title>
<link href="${pageContext.request.contextPath}/resources/css/main.css" rel="stylesheet" type="text/css">
<style>
.contentall {
	font-family: Malgun Gothic;
	background-color: #FFFFFF;
	width: 60%;
	margin: 0 auto;
}
.content {
  	line-height:2em;
  	background-color: #FFFFFF;
 	display: inline-block;
 	margin-top: 8%;
 	margin-bottom: 10%;
}
.mySlides {display:none;}
.card{
	width: 60%;
	margin: 0 auto;
}
.image{
	margin-left: 32%;
}
.text {
  	padding: 8px;
  	width: 80%;
  	margin: 0 auto;
  	margin-top: 50px;
}
h1 {
  	text-align: center;
  	text-transform: uppercase;
  	color: #4CAF50;
  	font-family: Malgun Gothic;
}
p {
  	text-indent: 50px;
  	text-align: justify;
  	letter-spacing: 1px;
  	text-indent: 2em;
  	font-family: Malgun Gothic;
}
</style>
</head>
<body>
<jsp:include page="/main/header.jsp" />
<jsp:include page="/main/banner.jsp" />
	
<div class="contentall">	
<div class="content">
	<div class="card">
	<div class="w3-content w3-display-container">
  		<img class="mySlides" src="../image/content01.jpg" style="width:100%">
  		<img class="mySlides" src="../image/content02.jpg" style="width:100%">
  		<img class="mySlides" src="../image/content03.jpg" style="width:100%">
  		<img class="mySlides" src="../image/content04.jpg" style="width:100%">
  		<img class="mySlides" src="../image/content05.jpg" style="width:100%">
		<button class="w3-button w3-black w3-display-left" onclick="plusDivs(-1)">&#10094;</button>
  		<button class="w3-button w3-black w3-display-right" onclick="plusDivs(1)">&#10095;</button>
	</div>
	</div>
<script>
	var slideIndex = 1;
	showDivs(slideIndex);

	function plusDivs(n) {
  		showDivs(slideIndex += n);
	}

	function showDivs(n) {
  		var i;
  		var x = document.getElementsByClassName("mySlides");
  		if (n > x.length) {slideIndex = 1}
  		if (n < 1) {slideIndex = x.length}
  		for (i = 0; i < x.length; i++) {
    		x[i].style.display = "none";  
  		}
  	x[slideIndex-1].style.display = "block";  
	}
</script>	
	<div class="text">
  	<h1 style="font-style: italic;">You can begin the Vegan!</h1><br><br>
  	<p>전 세계적으로 건강, 환경보호, 윤리적 소비를 추구하는 소비자들이 증가하면서 식품, 화장품, 패션 등 다양한 분야에서 동물성 제품을 섭취, 
    소비하지 않는 생활방식인 비거니즘(Veganism)을 지향하는 사람들이 증가하고 있다. 우리나라 역시 매년 채식에 대한 관심이 높아지고 있으며,
    현재 국내 채식인구가 150만명에 육박할 정도로 크게 늘었다. 이에 따라 대체육을 이용한 채식제품들도 많이 생겨나고 있다.</p><br>
	<p>채식을 하는 이유로는 ‘건강(63.1%)’ ‘윤리적 이유(52.9%)’ ‘환경보호(36.2%)’ ‘다이어트(26.3%)’ ‘체질(9.7%)’ 순으로 나타났다. 대부분이 과도한 육류 섭취로 인해 
	건강을 우려해 채식을 하는 것으로 보이며, 동물보호와 같은 윤리적 이유로 채식을 하는 사람들도 많았다. 또한 육류, 육가공품을 제조하기 위한 과정에서 행해지는 환경오염, 물 부족, 지구온난화
	등의 환경적인 문제 때문에 채식을 선택하는 사람들도 많게 나타났다. 동물성 단백질을 대체한 식물성 단백질의 출현은 체질상 동물성 단백질이 맞지 않거나 알레르기 반응을 나타내는 소비자에게도
	마음 놓고 단백질 섭취를 할 수 있는 기회가 될 수 있음도 알 수 있었다.</p><br>
	<p>최근 비건 빵은 물론 케이크, 햄버거, 피자 등 많은 비건 음식들이 생겨나고 있고 예전보다 보다 쉽게 비건 식품을 찾아볼 수 있게 됐다는 점을 소비자들은 긍정적으로 평가했다.
	또한 더 많은 육류 제품을 위해 황폐화되는 지구, 공장식 축산으로 비인도적인 취급을 받는 가축들의 문제에 대한 인식이 커져 채식의 필요성을 더욱 체감하고 있음이 드러났다.
	실제로 이러한 윤리적인 인식으로 채식주의로 변화한 사람들이 삶의 질, 건강에도 큰 도움이 된다고 답한 경우가 많았다.</p><br>
	<p>최근 비건 식당이 늘어나고 편의점, 패스트푸드점 등 접근성이 용이한 유통·외식업계도 비건 메뉴를 내놓고 있으나 관련 시장이 성숙기에 접어들 때까지는 비건 인구의 불편함이 있을 수 밖에 없을 것으로 보인다.</p><br>
	<h4 align="right">[출처 : 식품음료신문(http://www.thinkfood.co.kr)]</h4>
	</div>
</div>
</div>
<jsp:include page="/main/footer.jsp" />
</body>
</html>