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


.order_foreach td {
   border-bottom: 1px solid #243421;
}

 #updateRe{border-radius: 8px; font-size: 11px;padding: 5px 10px;  background-color: #213421; border: none; color:#fff; transition: all 0.3s; text-align: center;
    text-decoration: none; display: inline-block; font-size: 15px; margin: 4px; cursor: pointer; }
 #deleteRe{border-radius: 8px; font-size: 11px;padding: 5px 10px;  background-color: #213421; border: none; color:#fff; transition: all 0.3s; text-align: center;
    text-decoration: none; display: inline-block; font-size: 15px; margin: 4px; cursor: pointer; }
#updateRe{margin-top: 5px;  margin-bottom: 5px; }
#updateRe:hover{ background-color: #649E64;}
#deleteRe{margin-top: 5px;  margin-bottom: 5px; }
#deleteRe:hover{ background-color: #649E64;}

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
			<div id="category">
				<b>마이페이지</b>
				<%@ include file="myPageIncludeSide.jsp" %>	
			</div>
		
	
		<div id="order_wrap">
			<div class="member_name">
				<c:if test='${member.id == "admin"}'>
					<h3>리뷰 관리</h3>
				</c:if>
				<c:if test='${member.id != "admin"}'>
				<h3>${member.name}님께서 남겨주신 리뷰는 ${fn:length(reviewList)}개 입니다.</h3>
				</c:if>			
						
			</div>
			<div class="under_line"></div>
				<table width="95%" align="center" id="member_table" cellpadding="0" cellspacing="0">
					<tr height=26 bgcolor=243421 >
							<td height="3" colspan="8" align=right></td>
					</tr>
					<tr align="center" height="45px">
						<td width="5%" class="under__line" >번호</td>
						<c:if test='${member.id == "admin"}'>
							<td width="10%" class="under__line" >아이디</td>
						</c:if>
						<td width="25%" class="under__line">상품명</td>
						<td width="20%" class="under__line">제목</td>
						<td width="15%" class="under__line">별점</td>
						<td width="20%" class="under__line">작성 날짜</td>
						<td width="15%" class="under__line"> </td>
					</tr>
					
					
					
					<c:if test="${fn:length(reviewList) == 0}">
						<td align=center colspan=6>작성하신 리뷰가 없습니다.</td>
					</c:if>
					
					<c:if test="${fn:length(reviewList) != 0}">
						<c:set var="sum" value="0" /> 
						<c:set var="count" value="-1" /> 
						<c:forEach var="review" items="${reviewList}">
							<c:set var="sum" value="${sum+1 }"/>
						</c:forEach>
						<c:forEach var="review" items="${reviewList}">
						<c:set var="count" value="${count+1 }"/>
							<tr align=center class="order_foreach">
								<td height="20">${sum - count}</td>
								
								<c:if test='${member.id == "admin"}'>
									<td>${review.user_id}</td>
								</c:if>
								
								<td height="20">${review.name}</td>
								<td height="20">${review.content_name}</td>
								
								<td>
									<c:if test="${review.star==1 }">
										<img src="./image/star1.png" width="20px" height="20px"><br/>
										"너무 별로네요"
									</c:if>
									<c:if test="${review.star==2 }">
										<img src="./image/star2.png" width="40px" height="20px"><br/>
										"별로네요"
									</c:if>
									<c:if test="${review.star==3 }">
										<img src="./image/star3.png" width="60px" height="20px"><br/>
										"보통이요"
									</c:if>
									<c:if test="${review.star==4 }">
										<img src="./image/star4.png" width="80px" height="20px"><br/>
										"좋아요"
									</c:if>
									<c:if test="${review.star==5 }">
										<img src="./image/star5.png" width="100px" height="20px"><br/>
										"너무 좋아요"
									</c:if>
								</td>
								<td><fmt:formatDate value="${review.write_date}" pattern="yyyy-MM-dd"/></td>	
								
									<td>
										<a href="/board/myPage/updateReview.jsp?seq=${review.seq}" class="updateReview" ><button id="updateRe">수정</button></a>
										<a href="/board/deleteReview.re?seq=${review.seq}" class="deleteReview" ><button id="deleteRe">삭제</button></a>
									</td>
								</tr>
								<!-- 토글 자리 -->
								<tr class="con" style="display:none; text-align: center;" >
									<td  colspan="6" align="center" style="font-size:15px; font-weight: 400; border-bottom: 2px solid #243421;  padding: 30px 10px;"  >
										${review.content }<br>
										<img src="./ReviewUpload/${review.image}"  width="300px">
									</td>
								</tr>
						</c:forEach>
					</c:if>
				</table>
				<table width="75%" border="0" cellspacing="0" cellpadding="0"align="center" >
					<tr>
						<td height="2" bgcolor="213421"></td>
					</tr>
				</table>

			
			<c:if test='${member.id == "admin"}'>
				<table id="admin_btn">
					<tr style="margin-top: 10px;"><td><a href="/board/adminPage/adminMain.jsp">관리자 페이지</a></td></tr>
				</table>
			</c:if>
			
			
			
		</div>
	</div>
</div>


<jsp:include page="/main/footer.jsp" />
<script src="/board/js/jquery-3.6.0.min.js"></script> 

<script type="text/javascript">

$(function() {
    $(".order_foreach").click(function() {
       var view = $(this).next(".con");
       view.toggle();   
    
    });
 }); 
 
$(function() {
    $(".deleteReview").click(function() {
    	var result = confirm("해당리뷰를 삭제하시겠습니까?");

    	
    	if(result) { //yes 
    		
    	} else { 
    			//no 
    			return false;
    			}

    	
    
    });
 }); 

</script>


<%-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/javaScript.js"></script> --%>


</body>
</html>
