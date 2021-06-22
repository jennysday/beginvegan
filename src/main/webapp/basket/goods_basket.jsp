<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- JSTL 사용 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<title>쇼핑몰</title>

<link href="${pageContext.request.contextPath}/resources/css/main.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/basket.css" rel="stylesheet" type="text/css">

</head>
<body>
	<jsp:include page="/main/header.jsp" />
	<jsp:include page="/main/banner.jsp" />
	
<div class="basket_border"></div>	
<div class="basket_wrap">
	<table width="50%" align="center">
		<tr>
			<td colspan=2>
				<!-- 장바구니 -->
				<p align="center">
				<form action="./prepareOrder.od" name="basketform" method="post">
					<input type="hidden" name="order" value="basket">
					<table width="100%" class="basket_table1">
						<tr align="center">
							<td>
							<c:if test='${member.id == "admin"}'>
								<span>전체 회원 장바구니 목록</span>
							</c:if>
							<c:if test='${member.id != "admin"}'>
								<span>${member.name}님 장바구니</span>
							</c:if>
							</td>
						</tr>
					</table>

					<table width="100%" cellpadding="0" cellspacing="0">
						<tr height=26 bgcolor="213421">
							<td height="3" colspan="7" align=right></td>
						</tr>
						<tr align="center" height="45px">
							<c:if test='${member.id == "admin"}'>
								<td width="10%" class="under__line">아이디</td>
							</c:if>
							<td width="15%" class="under__line">사진</td>
							<td width="25%" class="under__line">제품명</td>
							<td width="30%" class="under__line">수량</td>
							<td width="10%" class="under__line">가격</td>
							<c:if test='${member.id != "admin"}'>
								<td width="10%" class="under__line">취소</td>
							</c:if>
						</tr>


						<c:if test="${fn:length(basketList) == 0}">
							<tr>
								<td colspan="7" align="center">장바구니에
										담긴 상품이 없습니다.</td>
							</tr>
						</c:if>

						<c:if test="${fn:length(basketList) != 0}">
							<c:set var="sum_money" value="0" />
							<c:forEach var="basket" items="${basketList}">
								<c:set var="sum_money"
									value="${sum_money+ (basket.price * basket.amount)}" />
								<!-- \${basket.필드}은 BasketVO의 필드값이랑 똑같아야 한다 -->
								<tr align="center" class="basket_foreach">
									<c:if test='${member.id == "admin"}'>
										<td>${basket.memberId}</td>
									</c:if>
									<td><img src="/board/GoodsUpload/${basket.image}" width=50 height=50></td>
									<td>${basket.goodsName}</td>
									<td><div class="btn_box"><c:if test='${member.id != "admin"}'>
											<input type="button" value="-"
												onClick='minusClick("${basket.goodsSeq}", ${basket.price})' /> <!-- ${basket.goodsSeq}는 자바스크립트에서 문자열과 합쳐 고유 아이디로 사용하기 위해 숫자형을 문자열로 변환시키기 위해 큰따옴표로 감싸준다 -->
											<span id="am__${basket.goodsSeq}">${basket.amount}</span>
											<input type="button" value="+"
												onClick='plusClick("${basket.goodsSeq}",${basket.goodsAmount}, ${basket.price})' />
										</c:if> <c:if test='${member.id == "admin"}'>
											<input type="hidden" value="-"
												onClick='minusClick("${basket.goodsSeq}", ${basket.price})' />
											<span id="am__${basket.goodsSeq}">${basket.amount}</span>
											<input type="hidden" value="+"
												onClick='plusClick("${basket.goodsSeq}",${basket.goodsAmount}, ${basket.price})' />
										</c:if></div></td>
									<td><fmt:formatNumber value="${basket.price}" pattern="#,###"/></td>
									<c:if test='${member.id != "admin"}'>
									<td> <a
											href="deleteBasket.do?goodsSeq=${basket.goodsSeq}"
											onclick="return confirm('삭제하시겠습니까?')" class="post-request">
											
											<svg xmlns="http://www.w3.org/2000/svg" height="18px" viewBox="0 0 24 24" width="18px" fill="#213421"><path d="M0 0h24v24H0V0z" fill="none"/><path d="M19 6.41L17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12 19 6.41z"/></svg>
											</a>
									</td>
									</c:if>
								</tr>

							</c:forEach>
						</c:if>
					</table>

					<table width="100%" border="0" cellspacing="0" cellpadding="0" >
						<tr>
							<td height="2" bgcolor="213421"></td>
						</tr>

						<tr>
							<td height="30">
								<%-- <div align="right">총 주문금액 : <span id="sum__money">${sum_money}</span>원</div> --%>
								<div align="right" class="sum_money">
									총 주문금액 : <span id="sum__money"><fmt:formatNumber
											value="${sum_money}" pattern="#,###" /> </span>원
								</div>
							</td>
						</tr>
					</table>
					<br>

					<table width="100%" cellpadding="0" cellspacing="0">
						<tr>
							<td align="center">
								<c:if test="${fn:length(basketList) != 0}">
									<a href="javascript:basketform.submit()" class="buy_btn" > 구매하기</a>&#9;&#9;&#9;&#9;
								</c:if>
								<a href="/board/getGoodsList.go" class="post-request buy_btn">상품 구경하기</a>
							</td>
								
								
						</tr>
					</table>
				</form> <!-- 장바구니 -->
			</td>
		</tr>
	</table>
</div>
	<jsp:include page="/main/footer.jsp" />
	
	<%-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/javaScript.js"></script> --%>



	<script>
	
		function numberWithCommas(x) {
		    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}
	
		function updateAmount(qs, goodsSeq, amount, price){
			
			var reqData = {};//객체
			reqData.goodsSeq = goodsSeq;//필드값 정의
			reqData.amount = amount;
			
			$.ajax({
				url:'/board/updateBasket.do',
				type:'post',
				contentType:'application/json;charset=UTF-8', //클라이언트 -> 서버 로 보낼 데이터 형식
				dataType:'json',//서버 -> 클라이언트 전달 받는 형식
				data:JSON.stringify(reqData),//()안에 있는 값을 서버로 전송
				success:function(data){
					if(data.OK){
						qs.innerHTML = amount;
						var mqs = document.querySelector('#sum__money');
						mqs.innerHTML = numberWithCommas(Number(mqs.innerHTML.replaceAll(",","")) + price);
					}else{
						alert('로그인하세요');
						location.href="/board";
					}

				}
			});
		}
	
		//수량감소
		function minusClick(goodsSeq, price){
			var qs = document.querySelector("#am__"+goodsSeq);  /* goodsSeq는 문자열과 합쳐 고유 아이디를 만들기 위해 */
			var currentAmount = Number(qs.innerHTML);
			if(currentAmount <= 1){
				qs.innerHTML = 1;
				alert('1개 이상 필수');
			}else{
				updateAmount(qs, Number(goodsSeq), currentAmount - 1, price* -1);
			}
		}
	
		//수량증가
		function plusClick(goodsSeq, goodsAmount, price){//goodsAmount : 상품 재고 //상품 재고까지만 수량을 올릴 수 있게 제어해주어야 함
			var qs = document.querySelector("#am__"+goodsSeq);//셀렉터지정
			var currentAmount = Number(qs.innerHTML);//문자 -> 숫자
			if(currentAmount >= goodsAmount){//재고 수량 초과시 최대수량으로 셋팅
				qs.innerHTML = goodsAmount
				alert('구매가능한 최대수량은 [ '+ goodsAmount + ' ] 입니다');
			}else{
				updateAmount(qs, Number(goodsSeq), currentAmount + 1, price);
			}
		}
		
		
		//앵커테그 post 방식 전달.
		// GET ALL THE LINKS WE WANT TO DO A POST ON
		// jQuery EQUIVALENT WOULD BE $('.post-request').click(function(e)
		var links = document.querySelectorAll('.post-request');
		 
		// LOOP THROUGH THE FOUND LINKS AND ADD A CLICK HANDLER
		for(var l = 0; l < links.length; l++) {
		  links[l].addEventListener('click', function(e) {
		    // PREVENT DEFAULT click BEHAVIOUR
		    e.preventDefault();
		    
		    // BREAK THE URL INTO TWO action AND parameters
		    var url = this.href.split('?');
		    
		    // ONLY LOOK FOR PARAMS IF THEY WERE SPECIFIED
		    var params = (url.length > 1) ? url[1].split('&') : []
		 
		    // CREATE A FORM
		    var form = document.createElement('form');
		    
		    // MAKE IT POST TO THE URL
		    form.setAttribute('method','post');
		    form.setAttribute('action', url[0]);
		    
		    // LOOP THROUGH THE PARAMETERS AND ADD THEM AS CONTROLS TO THE FORM
		    for(var i = 0; i < params.length;i++) {
		      // CREATE THE <input> AS A text CONTROL
		      var inp = document.createElement('input');
		      inp.setAttribute('type', 'hidden');
		      // SPLIT parameter INTO key / value AND ADD TO input
		      var value = params[i].split('=');
		      inp.setAttribute('name',value[0]);
		      inp.setAttribute('value', value[1]);
		 
		      // APPEND TO <form>
		      form.appendChild(inp);
		    }
		    // APPEND <form> TO BODY AND SUBMIT
		    document.getElementsByTagName('body')[0].appendChild(form);
		    form.submit();
		  });
		}
		
	</script>


</body>
</html>

