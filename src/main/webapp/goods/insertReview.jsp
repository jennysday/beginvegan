<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- JSTL 사용 -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
	

<!DOCTYPE html>
<html>
<head>
<title>쇼핑몰</title>
<link href="${pageContext.request.contextPath}/resources/css/main.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/memberGoodsOrder.css" rel="stylesheet" type="text/css">
<style type="text/css">

.order_wrap{
		display:inline-block;
		width:75%;
	}
	
	.chk_btn {
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
	
	.chk_btn:hover {
	    background-color: #649E64;
	}
	

	#lasttag {
		
		text-align: center;

	}
	 
		 .inquiry_table {	  	
	 	width: 85%;
	 	margin-top: 0;
	 	
	 	margin-left: 100px;
	 	border-collapse: collapse;
	 	font-size: 12pt;
	 	text-align: right;
  		
	 	
	 }

	 
	.inquiry_table tr td:not(#lasttag), .inquiry_table tr th{
		border-top: 1px solid #ddd;
		border-right: 1px solid white;
	 	border-left: 1px solid white;
	
	}
	

	 
	.inquiry_table td {
	 	
 		padding: 10px;
  		text-align: left;
  		font-weight: normal;
	 
	 }
	
	.inquiry_table th {
		padding: 4px;
		text-align: center;
	  	color: white;
	  	width: 15%;
	  	    background-color: #213421;
	  	font-weight: normal;
	}
	
	.inquiry_table input[type=text] {
	  	height: 25px;
	  	font-size: 13pt;
	  	border: 1px solid #ddd;
	}
	
	
	#content {
		vertical-align: top;
		height: 200px;
	  	font-size: 11pt;
	  	width: 100%;
	  	border: 1px solid #ddd;
	}
.inquiry_table input[type=file] {
	  	height: 30px;
	  	font-size: 13pt;
	  	
	}
	
	.inquiry_table select {
	  	height: 25px;
	  	font-size: 13pt;
	  	border: 1px solid #ddd;
	}
	

</style>
</head>
<body>

	<jsp:include page="/main/header.jsp" />
	<jsp:include page="/main/banner.jsp" />




<div id="member_all_wrap">
		<div id="together">
					<ul>
						<li>
							<div id="first">
								<p> 저희 쇼핑몰을 이용해주셔서 감사합니다. </p>
								<p>${member.name}님은 [씨앗]등급이십니다.</p>
						</div>
					</li>
					<li>
						<div id="second">
							<p>가용 적립금 : </p>
							<p>사용 적립금 : </p>
							<p>쿠폰 : </p>
						</div>
					</li>
					<li>
						<div id="third">
							<p>총 적립금 : </p>
							<p>총 주문금액 : </p>
						</div>
					</li>
				</ul>
		</div>
		
		<div id="category_wrap">
			<div id="category" style="vertical-align: top;">
				<b>마이페이지</b>
				<%@ include file="/myPage/myPageIncludeSide.jsp" %>	
			</div>
		
	
		<div id="order_wrap">
			<div class="member_name" style="margin-left: 100px;">
				<h3>${goods.name} 리뷰 작성</h3>
			</div>
			
			<div class="under_line"></div>
				<form name="reviewform" action="/board/saveReview.re" method="post" enctype="multipart/form-data">
					<table  class="inquiry_table" id="member_table" cellpadding="0" cellspacing="0">
						<tr>
							<th>상품 이름</th>
							<td colspan="2">
								<input type="text" name="name" value="${goods.name} " style="border-style: none;" readonly>
							</td>
						</tr>
						<tr>
							<th>작성자</th>
							<td colspan="2">
								<input type="text" name="user_name" value="${member.name }"  style="border-style: none;" readonly>
							</td>
						</tr>
						<tr>
							<th>포토 리뷰</th>
							<td align="left" colspan="2">
								<input type="file" name="file" size="1"/>
							</td>
						</tr>
						
						<tr>
							<th>리뷰 제목</th>
							<td colspan="2">
								<input type="text" name="content_name" size="50">
							</td>
						</tr>	
						
						<tr>
							<th>리뷰★</th>
							<td colspan="2">
								<textarea name="content" rows=15 style="resize: none; width: 100%"></textarea>
							</td>
						</tr>						
						<tr style="border-bottom: 1px solid #ddd">
							<th>별점</th>
							<td colspan="2" align="center" valign="middle">
								<div id="rating" align=center valign="middle">
									<span>
									    <img id="image1" onmouseover=show(1) onclick=mark(1) onmouseout=noshow(1) src="./image/starb.png" width="20px" height="20px">
									    <img id="image2" onmouseover=show(2) onclick=mark(2) onmouseout=noshow(2) src="./image/starb.png" width="20px" height="20px">
									    <img id="image3" onmouseover=show(3) onclick=mark(3) onmouseout=noshow(3) src="./image/starb.png" width="20px" height="20px">
									    <img id="image4" onmouseover=show(4) onclick=mark(4) onmouseout=noshow(4) src="./image/starb.png" width="20px" height="20px">
									    <img id="image5" onmouseover=show(5) onclick=mark(5) onmouseout=noshow(5) src="./image/starb.png" width="20px" height="20px">
				 					</span>	<br>
				 					<span id="startext">평가하기</span>
			 					</div>
			 					<input type="hidden" name="star">
							</td>
						</tr>	
						

						<tr>
							<td colspan="3" id="lasttag">
								<input  class="chk_btn" value="댓글 등록" type="submit"/>
							</td>
				
						</tr>
					</table>
				</form>
			
			
		</div>
	</div>
</div>


<jsp:include page="/main/footer.jsp" />

<script src="/board/js/jquery-3.6.0.min.js"></script> 

<script type="text/javascript">
	
$(function() {
	
});
	var locked=0;
	
	function show(star) {
		 if (locked)
			return; 
		var i;
		var image;
		var el;
		var e =document.getElementById('startext');
		var stateMsg;
		
		for (i = 1; i <=star; i++){
			image='image' +i;
			el = document.getElementById(image);
			el.src =  "./image/star1.png";
		}
		
		switch(star) {
		case 1:
			stateMsg = "너무 별로네요";
			break;
		case 2:
			stateMsg = "별로네요";
			break;
		case 3:
			stateMsg = "보통이요";
			break;
		case 4:
			stateMsg = "좋아요";
			break;
		case 5:
			stateMsg = "너무 좋아요";
			break;
		default:
			stateMsg = "";
		}
		e.innerHTML = stateMsg;
	}
	
	function noshow (star){
		 if(locked)
			return; 
		var i;
		var image;
		var el;
		
		for (i = 1; i <=star; i++){
			image='image' +i;
			el = document.getElementById(image);
			el.src =  "./image/starb.png";
		}
	}
	
	function lock(star){
		show(star);
		locked = 1;
	}
	function mark(star){
		
		if(locked==0){
			lock(star);
			
			
			document.reviewform.star.value=star;
		}else if(locked==1){
			locked=0;
			noshow(5);
			lock(star);
			
			
			document.reviewform.star.value=star;
			
			
		}
		
		
	}
	
	
 

</script>
<%-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/javaScript.js"></script> --%>


</body>
</html>
