<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 페이지</title>
<link href="${pageContext.request.contextPath}/resources/css/main.css" rel="stylesheet" type="text/css">
<style type="text/css">

h2{color:#213421; font-size:30px;}
.info{color:#213421; text-align:left; font-size: 20px; margin: 20px; padding:10px; margin:10px;}
table{padding:10px; margin:10px; width:40%; border:0; cellpadding:0; cellspacing:1px;}
.ttr{background-color:#213421; color:white; padding:10px; margin:10px; text-align: center;v}
.ttinfo{color:#213421; padding:10px; margin:10px; text-align: center;  border-top:0.5px solid gray; }
#border{border-bottom: 0.5px solid gray; }
</style>
</head>
<body>
<jsp:include page="/main/header.jsp" />
<jsp:include page="/main/banner.jsp" />

 <div class="wrap" style="min-height:600px; padding: 200px 0;">
<center>
	<h2>주문이 완료되었습니다.</h2>
	

	
	<table class="payinfo">
	<tr>
	<td colspan=2 align=center class="info">입금정보</td>
	</tr>
		<tr>
			<td class="ttr"> 입금은행</td>
			<td class="ttinfo"> 국민은행</td>
		</tr>
		<tr>
			<td class="ttr" >예금주</td>
			<td class="ttinfo"  >홍길동</td>
		</tr>
		<tr>
			<td class="ttr">입금 계좌</td>
			<td class="ttinfo" id="border">601xxx-xx-xxxxxxx</td>
		</tr>
	</table>
</center>
</div>
<jsp:include page="/main/footer.jsp" />
</body>
</html>
