<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
 	margin-top: 5%;
 	margin-bottom: 10%;
}
p{
 	font-size: 15px;
}
div.guide {
	margin-right: 3%;
	margin-bottom: 10%;
  	width: 42%;
  	display: inline-block;
}
div.guide img {
	width: 100%;
 }
div.desc {
  	padding: 15px;
  	text-align: justify;
  	background-color: #FFFFFF;
  	line-height: 1.6;
}
.button {
	margin-left: 10%; 
	background-color:#FFFFFF; 
	border: 1px solid #213421;
	padding: 10px 25px;
	color: #213421;
	font-size: 16px;
	transition-duration: 0.4s;
	float: right;
	width: 50%;
	font-family: Malgun Gothic;
}
.button:hover{
	background-color: #213421;
	color: #FFFFFF;
	font-family: Malgun Gothic;
}

a {
    color: inherit;
    text-decoration: none;
    width: 100%;
}
</style>
</head>
<body>
<jsp:include page="/main/header.jsp" />
<jsp:include page="/main/banner.jsp" />
<div class="contentall">
<div class="content">
	<div class="guide">
  		<a target="_blank" href="/board/image/guide01.jpg">
    	<img src="/board/image/guide01.jpg"></a>
  	<div class="desc"><h3><b>채식을 해야하는 이유</b></h3><br><p>비건 생활 방식은 다양한 만성 질환의 위험을 줄이고 최고 수준의 건강을 촉진합니다.
  	특히 기후 변화와 관련하여 환경 발자국을 줄이는 강력한 방법을 제공하며 동물 도살과 고통을 줄입니다...</p>
	<br><br><button class="button" onclick="location.href='lifeGuide02.jsp'">자세히 알아보기</button>
	</div>
	</div>
	<div class="guide">
  		<a target="_blank" href="/board/image/guide02.jpg">
    	<img src="/board/image/guide02.jpg"></a>
  	<div class="desc"><h3><b>비건의 종류</b></h3><br><p>채식주의자는 육식을 피하고 식물을 재료로 만든 음식만을 먹는 사람을 말합니다.
  	먹는 음식에 따라 프루테리언, 비건, 락토 베지테리언, 오보 베지테리언 등의 단계로 구분됩니다...</p>
	<br><br><button class="button" onclick="location.href='lifeGuide02.jsp'">자세히 알아보기</button>
	</div>
	</div>
	<div class="guide">
  		<a target="_blank" href="/board/image/guide03.jpg">
    	<img src="/board/image/guide03.jpg"></a>
  	<div class="desc"><h3><b>비건 음식 쇼핑법</b></h3><br><p>평범한 슈퍼마켓조차도 다양한 종류의 신선한 과일과 채소와 포괄적인 비건 식품을 제공합니다. 
  	비건 채식은 비쌀 필요가 없으며 간단한 식사조차도 감각적인 풍미를 가져올 수 있습니다...</p>
	<br><br><button class="button" onclick="location.href='lifeGuide02.jsp'">자세히 알아보기</button>
	</div>
	</div>
	<div class="guide">
  		<a target="_blank" href="/board/image/guide04.jpg">
    	<img src="/board/image/guide04.jpg"></a>
  	<div class="desc"><h3><b>비건 다이어트</b></h3><br><p>채식은 사람들이 자연스럽게 먹는 칼로리 양을 줄여 체중을 줄이는 데 효과적입니다.
  	많은 사람들이 과체중을 줄이는 방법으로 비건 채식을 선택합니다. 채식은 건강한 다이어트 방법 중 하나입니다...</p>
	<br><br><button class="button" onclick="location.href='lifeGuide02.jsp'">자세히 알아보기</button>
	</div>
	</div>
	<div class="guide">
  		<a target="_blank" href="/board/image/guide05.jpg">
    	<img src="/board/image/guide05.jpg"></a>
  	<div class="desc"><h3><b>지구를 살리는 식사</b></h3><br><p>채식은 단순히 식생활 차원이 아니라 지구온난화를 막을 수 있는 실현가능한 대안입니다. 
  	네덜란드 환경평가국은 채식식단이 기후변화 해결비용의 80%의 절감할 수 있다고 분석했습니다...</p> 
	<br><br><button class="button" onclick="location.href='lifeGuide02.jsp'">자세히 알아보기</button>
	</div>
	</div>
	<div class="guide">
  		<a target="_blank" href="/board/image/guide06.jpg">
    	<img src="/board/image/guide06.jpg"></a>
  	<div class="desc"><h3><b>함께하는 단체</b></h3><br><p>비긴비건과 함께 채식을 통한 건강한 삶을 유지하고, 지구를 살리는 운동을 진행하는 관련 단체들을 소개합니다.
  	혼자는 어려울지 몰라도 힘을 합쳐 함께 하면 모든 것이 가능합니다...</p>
	<br><br><button class="button" onclick="location.href='lifeGuide02.jsp'">자세히 알아보기</button>
	</div>
	</div>
</div>
</div>
	
<jsp:include page="/main/footer.jsp" />
</body>
</html>