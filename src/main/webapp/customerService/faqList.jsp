<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글 목록</title>

<link href="${pageContext.request.contextPath}/resources/css/main.css" rel="stylesheet" type="text/css">
<style type="text/css">
	* {
	box-sizing: border-box;
	font-family: 'Nanum Myeongjo';
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


.under__line{
	border-bottom: 2px solid #213421;
}
#category_wrap{
	width: 80%;
	padding-bottom:100px;
	padding-top: 100px;
	margin-left: auto;
	margin-right: auto;
	min-height: 900px;
	background-color: white;
}



#order_wrap{
	display:inline-block;
	width:75%;
}

#order_wrap .member_name{
	text-align: center;
	vertical-align:top;
	
	margin-bottom: 50px;
}



.chk_btn{
    border-radius: 8px;
    font-size: 14px;
    padding: 15px 50px;
    background-color: #213421;
    transition: all 0.3s;
    color: #ffffff;
    border:none;
    transition:all 0.3s;
}

.chk_btn:hover{
    background-color: #649E64;

}

.under_line {
	border-bottom: 2px solid #243421;
	width:100%;
}

.con {
	padding: 10px 5px;
	margin-top: 20px;
}


.order_foreach td {
	border-bottom: 1px solid #243421;
}


</style>


</head>
<body>
	<jsp:include page="/main/header.jsp" />
	<jsp:include page="/main/banner.jsp" />
<div class="under_line"></div>	
<div id="member_all_wrap">
<br>
	<div id="category_wrap">
			<%@ include file="customerServiceSidenav.jsp" %>	
		<div id="order_wrap">
				<div class="member_name">
					<h1>자주 묻는 질문</h1>
					<h3>고객님들께서 자주 남겨주신 문의 사항들입니다. </h3>
				</div>
				
				
				
				<table width="85%" align="center" id="member_table" cellpadding="0" cellspacing="0">
					<tr style="background-color:#243421; height: 26px ">
							<td height="3" colspan="5" align=right></td>
					</tr>
					<tr style="font-weight: normal; height: 40px;">
						<th width="10%" class="under__line">번호</th>
						<th width="40%" class="under__line">제목</th>
						<th width="15%" class="under__line">등록자</th>
						<th width="20%" class="under__line">등록일</th>
					</tr>				
					
					<c:set var="count" value="0"/>
					<c:forEach items="${faqBoardList}" var="board">
						<tr align=center class="order_foreach" style="font-weight: normal; height: 60px; border-bottom: 1px solid #243421; border-top: 1px solid #243421" >				
							
							
							<c:set var="count" value="${count +1}"/>
							<td>${count }</td>
							<td>${board.title }</td>
							
							<td>${board.writer }</td>
							<td><fmt:formatDate value="${board.regDate }" pattern="yyyy-MM-dd"/></td>
						</tr>
						<tr class="con" style="display:none;" >
							<td align="center" style="font-size:15px; font-weight: 400; border-bottom: 2px solid #243421;  padding: 30px 10px;"  colspan="4">${board.content }</td>
						</tr>
						
					</c:forEach>
				</table>
			</div> 
		</div>
	
<br>
</div>

<jsp:include page="/main/footer.jsp" />

<script src="/board/js/jquery-3.6.0.min.js"></script> 
<script type="text/javascript">
//FAQ함수
		$(function() {
			
			$(".order_foreach").click(function() {
				var view = $(this).next(".con");
				view.toggle();	
			
			});
		}); 
		
		
		
</script>  

	

</body>
</html>