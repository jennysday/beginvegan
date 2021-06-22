<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기본 에러 화면(ArithmeticException)</title>
<link href="${pageContext.request.contextPath}/resources/css/main.css" rel="stylesheet" type="text/css">
<style type="text/css">
.main {
		text-align: center;
		margin: 100px auto;		
		width: 1000px;
		
		
	}
	table {
		text-align: center;
		border-collapse: collapse;
		width: 100%;
		
	}
	
	table tr th {
		padding: 5px;
		border-top: 1px solid #ddd;
	}
	
	
	table tr td {
		padding: 10px;
		border-top: 1px solid #ddd;
	}
	
	tr:first-child th {
		background-color: #F0F0ED;
	}


 	.back {
 		width: 1000px;
	 	margin: 0 auto;
	 	text-align: center;
	 	font-size: small;
 	}
 	
	.chk_btn {
	    border-radius: 8px;
	    font-size: 14px;
	    padding: 10px 15px;
	    background-color: #3B5E3B;
	    transition: all 0.3s;
	    color: #ffffff;
	    border: none;
	    transition: all 0.3s;
	}
	
	.chk_btn:hover {
	    background-color: #649E64;
	}
 	
 	/* .back a {
 		color: white;
	  	background-color: #4C874E;
	  	text-decoration: none;
	  	border-radius: 5px;
	  	padding: 6px 10px ;
	  	
 
 	}
 	
 	.back a:link {
 			color: white;
 	}
 	.back a:visited {
 		
 		color: white;
 	} 	
 	
 	
 	.back a:hover {
 		border: 2px solid #4C874E;
	  	background-color: white;
	  	color: #4C874E;
 	
 	} */
 	
</style>

</head>
<body> 
		<jsp:include page="/main/header.jsp" />
	<jsp:include page="/main/banner.jsp" />
	<div class="main">
		<table>
		<tr>
			<th>기본 에러 화면</th>
		</tr>
		<tr>
			<td>
				<br><br><br><br><br><br>
				Message : ${exception.message}
				<br><br><br><br><br><br>
			</td>
		</tr>
		<tr>
			<td><br></td>
		</tr>
	</table>
		<div class="back">
			<a href="javascript:history.go(-1)" class="chk_btn">돌아가기</a>
		</div>
	</div>
	
<jsp:include page="/main/footer.jsp" />
</body>
</html>