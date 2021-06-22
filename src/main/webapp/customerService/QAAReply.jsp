<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
#firstLastTag th, #firstLastTag td {
		border-bottom: 1px solid #ddd;
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
			<div class="title_wrap clfix member_name">
				<h3>1:1 문의 게시판</h3>
				<h5>${member.name}님이 남겨주신 문의에 대한 답변입니다. </h5>
			</div>
			<div class="inquiry_cont_wrap"><br>			
				<div class="inquiry_cont_wrap">
				
					<table class="inquiry_table">
						<tr>
							<th>답변 내용</th>
							<td colspan="2" id="content">${reply.content}</td>
						</tr>
						<tr id="firstLastTag">
							<th> 답변 등록일</th>
							<td colspan="2"><fmt:formatDate value="${reply.qaa_date }" pattern="yyyy-MM-dd"/></td>
						</tr>
	
					

					</table>
				</div>
				
			</div><br><br><br>
			
			<%@ include file="QAAReplyDetail.jsp" %>
	</div>
		
		</div>
		
		
		
		</div>


	
		<jsp:include page="/main/footer.jsp" />
		
<script type="text/javascript">
		

		
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