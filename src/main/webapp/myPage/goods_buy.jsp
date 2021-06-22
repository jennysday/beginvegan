<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 페이지</title>
<link href="${pageContext.request.contextPath}/resources/css/main.css" rel="stylesheet" type="text/css">
<style type="text/css">
	* {
	box-sizing: border-box;
	font-family: 'Malgun Gothic';
}

html, body {
	margin: 0;
	padding: 0;
}

h1, h2, h3, h4, h5, h6, p {
	margin: 0;
}

header, section, article, main, nav, aside, footer {
	display: block;
}

header:after, section:after, article:after, main:after, nav:after, aside:after,
	footer:after {
	content: "";
	display: block;
	clear: both;
}

.clear {
	clear: both;
}

ul, ol {
	list-style: none;
	margin: 0;
	padding: 0;
}

a {
	color: inherit;
	text-decoration: none;
}

button{
	background: inherit ; 
	border:none; 
	box-shadow:none; 
	border-radius:0; 
	padding:0; 
	overflow:visible;
	 cursor:pointer;
} 

.text_hide {
	display: inline-block;
	text-indent: -9999px;
}

body {
	font-size: 16px;
    font-weight: bold;
    color: #213421;
}



#category_wrap{
	width: 80%;
	margin:100px auto;
	min-height: 600px;
	text-align: center;
}

span::after {
  content: '';
  display: block;
  width: 0;
  height: 5px;
  position: absolute;
  left: 0;
  bottom: 0px;
  background: rgba(255, 201, 5, 0.5);
}
a:hover span::after {
  width: 100%;
  transition: width .3s;
}

#order_wrap{
	display:inline-block;
	width:65%;
	text-align: center;
}

#order_wrap .member_name{
	text-align: center;
	vertical-align:top;
	
	margin-bottom: 13px;
}

.under__line{
	border-bottom: 2px solid #243421;
	font-weight: bold;
}

.order_foreach{
	height:65px;
}


.select_btn{
	width: 97px;
    padding: 3px 5px;
    margin: 10px 0 0;
    border-radius: 5px;
}

.sum_money {
    padding-top: 10px;
    margin-bottom: 10px;
}

#admin_btn{
	width:100%;
	height:50px;
}

#admin_btn tr{
	text-align: center;
}


.btn {
 	border-radius: 8px;
    font-size: 14px;
    padding: 10px 15px;
    background-color: #213421;
    transition: all 0.3s;
    color: #ffffff;
    border: none;
    transition: all 0.3s;
    margin: 50px 0px;
}

.btn:hover{
	  background-color: #649E64;
}
	
.orderInfo {
	border-collapse: collapse;
	margin-top: 5px;
}

.orderInfo tr td {
		border-bottom: 1px solid grey;
		font-weight: normal;
		border-top: 1px solid grey;
		padding: 10px;
}

.orderInfo tr td:first-child {
	background-color: #243421;
	color: white;
	width: 30%;
	
}
.orderInfo tr td:nth-child(2) {
	text-align: left;
	
}

</style>
</head>
<body>
<jsp:include page="/main/header.jsp" />
<jsp:include page="/main/banner.jsp" />


<div id="member_all_wrap">
	 <div id="category_wrap">
	 	<form action="./startOrder.od" method="post">
	 	 <div id="order_wrap">
		 	  <div class="member_name">            
	               <h3>주문 상세내역</h3>           
	         </div>
	         <div class="under_line"></div>
	         <table width="85%" align="center" id="member_table" cellpadding="0" cellspacing="0" >
	         	<tr height=26 bgcolor=243421 >
                     <td height="3" colspan="5" align=right></td>
               </tr>
                <tr align="center" height="45px">
                  <td width="23%" class="under__line">번호</td>
                  <td width="18%" class="under__line">상품명</td>
                  <td width="23%" class="under__line">상품이미지</td>
                  <td width=13%" class="under__line">수량</td>
                  <td width="23%" class="under__line">상품 금액</td>
                  
               </tr>
               
               <c:set var="num" value="0" scope="session"/>
               <c:forEach items="${checkout}" var="ck">
                   
                     <tr align=center class="order_foreach">
                       
                        
                        <td height="20">${num=num+1}</td>
                        <td height="20">${ck.order_goods_name}</td>
                        <td><img src="/board/GoodsUpload/${ck.order_goods_image}" width=50 height=50>
                        </td>
                        <td>${ck.order_goods_count}</td>
                        <td><fmt:formatNumber value="${ck.order_goods_price}" pattern="#,###" />
                        <c:set var="totalAmount" value="${ck.order_goods_price*ck.order_goods_count+totalAmount}"/><td>
                        

          
                     </tr>
                     
                     
                  </c:forEach>
                  <tr>
								<td colspan="6" style="border-top: 2px solid #243421">
									<div align="right"><br>
									총 주문금액 : <span><fmt:formatNumber value="${totalAmount}" pattern="#,###" /> </span>원
									</div>
								</td>

						</tr>
                
	         </table>
         
	 	 
	 	 
	 	 </div>
	 	 
	 	 <div id="order_wrap">
	 	  <div class="member_name">            
	               <br><br><h3>주문자 정보</h3>           
	         </div>
	 	 	<table width="50%" class="orderInfo" cellpadding="0" cellspacing="0" align="center">
						
						<tr>
							<td>이름</td>
							<td >
								${checkout_member.order_receive_name}
								<input type="hidden" name="order_sum_money" value="${totalAmount}">
								<input type="hidden" name="order_member_orderNum" value="${checkout_member.order_member_orderNum }"/>
								<input type="hidden" name="order_member_seq" value="${checkout_member.order_member_seq }"/>
							</td>
						</tr>
						
						<tr>
							<td>휴대폰</td>
							<td>${checkout_member.order_receive_phone}
								</td>
						</tr>
						
						<tr>
							<td>이메일 주소</td>
							<td>${checkout_member.order_receive_email}
							</td>
						</tr>
						
					</table> 
	 	 
	 	 
	 	 </div>
	 	 <div id="order_wrap">
	 	 	<div class="member_name">            
	               <br><br><h3>배송지 정보</h3>           
	         </div>
	 	 	<table width=80% class="orderInfo" cellpadding="0" cellspacing="0" align="center">
						
						<tr>
							<td>받는사람</td>
							<td>
								<input type="text" name="order_receive_name" size=12
								value="${checkout_member.order_receive_name}">
							</td>
						</tr>
						<tr>
							<td>집 전화</td>
							<td>
								<input type="text" name="order_receive_phone" size=15
								value="${checkout_member.order_receive_phone}">
							</td>
						</tr>						
						<tr>
							<td>배송지 우편번호</td>
							<td>
								<input type="text" name="order_receive_zipcode1" size=7
								value="${checkout_member.order_receive_zipcode1}">-
								<input type="text" name="order_receive_zipcode2" size=7
								value="${checkout_member.order_receive_zipcode2}">
							</td>
						</tr>	
						
						<tr>
							<td>배송지 주소</td>
							<td>
								<input type="text" name="order_receive_addr1" size=50
								value="${checkout_member.order_receive_addr1}">
							</td>
						</tr>		
						<tr>
							<td>배송지 나머지 주소</td>
							<td>
							<input type="text" name="order_receive_addr2" size=50
								value="${checkout_member.order_receive_addr2}">
							</td>
						</tr>										
						<tr>
							<td>기타 요구사항</td>
							<td>
								<textarea name="order_memo" style="resize: none; width: 100%; height: 50px;"></textarea>
							</td>
						</tr>	


				</table>
	 	 
	 	 </div>
	 
	 	<div id="order_wrap">
	 		 <div class="member_name">            
	               <br><br><h3>결제 정보</h3>           
	         </div>
	 				<table width=80% class="orderInfo" cellpadding="0" cellspacing="0" align="center">
						<tr>
							<td>결제 방식: </td>
							<td>
								<input type="radio" id="card" name="order_trade_type" value="카드결제">
							  <label for="card">카드결제</label>    
							  <input type="radio" id="deposit" name="order_trade_type" value="온라인 입금">
							  <label for="deposit">온라인 입금</label>
							</td>
						</tr>
						<tr>
							<td>입금자명(온라인입금일 경우) :</td>
							<td>
								<input type="text" name="order_trade_payer"
								size=20 value="${checkout_member.order_receive_name}">
							</td>
						</tr>								

					</table>
					
					 <table id="admin_btn">
               				<tr><td><input type=submit value="주문" class="btn">&nbsp;
								<a href="/board/backOrder.od" class="post-request"><button class="btn">취소</button></a></td></tr>
            </table>
	 	
	 	</div>
	 </form>
	 </div>
	


</div>

 

<jsp:include page="/main/footer.jsp" />
	<script type="text/javascript" >
	
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