<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>쇼핑몰</title>


</head>
<body>
<table>
	<tr><td >
	<form action="/board/orderList.od" method="post" id="orderList"></form>
	<tr><td><a href="javascript:action()"><span>주문 내역</span></a></td></tr>	
	<tr><td><a href="/board/getMyReviewList.re"><span>내가 쓴 리뷰</span></a></td></tr>
	<tr><td><a href="/board/myPage/memberPage.jsp"><span>개인정보 수정</span></a></td></tr>
	<tr><td><a href="/board/getBoardList.fu"><span>문의하기</span></a></td></tr>
	<tr><td><a href="/board/myPage/memberOut.jsp"><span>탈퇴하기</span></a></td></tr>
</table>


<script type="text/javascript">
	function action(){
		orderList.action = '/board/orderList.od';
		orderList.method = 'post';
		orderList.submit();
	}
</script>

</body>
</html>
