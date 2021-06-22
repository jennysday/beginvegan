<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	
	#category_wrap{
	width: 80%;
	padding-bottom:100px;
	padding-top: 100px;
	margin-left: auto;
	margin-right: auto;
	min-height: 900px;
	background-color: white;
}



.order_wrap{
	display:inline-block;
	width:75%;
}

.order_wrap .member_name{
	text-align: center;
	vertical-align:top;
	
	margin-bottom: 50px;
}


.title_wrap h3  {
    display: block;
    font-size: 2em;
    margin-block-start: 0.67em;
    margin-block-end: 0.67em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    font-weight: bold;
        margin: 0;
        text-align: center;
     box-sizing: border-box;
    font-family: 'Malgun Gothic';
}	

.title_wrap h5 {
	    display: block;
    font-size: 1.17em;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    font-weight: bold;
    margin: 0;
     text-align: center;
  box-sizing: border-box;
    font-family: 'Malgun Gothic';

}




	 .inquiry_table {	  	
	 	width: 85%;
	 	margin: 0 auto;
	 	border-collapse: collapse;
	 	font-size: 12pt;
  		
	 	
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
	
	#lasttag {
		border-top: 1px solid #ddd;
		text-align: center;

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



</style>
</head>

<body>

	<jsp:include page="/main/header.jsp" />
	<jsp:include page="/main/banner.jsp" />



<div class="under_line"></div>
<div  id="member_all_wrap">

	<div  id="category_wrap">
		
		<%@ include file="customerServiceSidenav.jsp" %>	
		
		
		<div class="order_wrap">
			<div class="title_wrap clfix">
				<h3>1:1 문의 게시판</h3>
				<h5>문의를 남겨주시면, 신속하게 도와 드리겠습니다.</h5><br><br>
			</div>
			<div class="inquiry_cont_wrap"><br>			
				<form action="/board/insertBoard.qa" method="post" enctype="multipart/form-data" name="insertQaa">
				
					<table class="inquiry_table">
						<tr >
						<th>카테고리</th>
						<td colspan="2" >
							<select name="category">
								<option value="회원문의">회원문의</option>
								<option value="주문/결제">주문/결제</option>
								<option value="배송문의">배송문의</option>
								<option value="취소/교환/반품">취소/교환/반품</option>
								<option value="서비스 이용 및 기타">서비스 이용 및 기타</option>					
							</select> 
						</td>
					</tr>
					
					<tr>
						<th>제목</th>
						<td colspan="2">
							<input type="hidden" name="id" value="${member.id }"/>
							<input type="text" name="subject" size="50" placeholder="제목을 적어주세요."/></td>
					</tr>
	
					
					<tr>
						<th>내용</th>
						<td colspan="2"><textarea name="content" id="content" placeholder="원하시는 내용을 남겨주세요."></textarea></td>
					</tr>
					<tr>
						<th>파일 첨부</th>
						<td align="left" colspan="2"><input type="file" name="uploadFile"/></td>
					</tr>
					
					<tr>
						<td colspan="3" id="lasttag">
							<input  class="chk_btn" value="등록 하기" type="submit"/>&emsp;						
							<a href="/board/getBoardList.fu" class="chk_btn">취소</a>
						</td>
			
					</tr>
					</table>
				</form>
				
			</div>
	</div>
		
		</div>
		
		
		
		</div>


	
		<jsp:include page="/main/footer.jsp" />



</body>
</html>