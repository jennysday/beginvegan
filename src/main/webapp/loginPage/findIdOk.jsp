<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Nanum+Gothic&display=swap" rel="stylesheet">

<link href="${pageContext.request.contextPath}/resources/css/main.css" rel="stylesheet" type="text/css">
<style type="text/css">
.find_id_wrap {
	min-height: 600px;
}

.find_id_form {
	padding: 5% 0 0;
}

input:focus { /* 아이디/비밀번호 커서로 클릭했을 때 */
	outline-color: #213421;
}
	
#style { /* 로그인하기 */
	width: 70px; padding: .5em .3em;
	border: 1px solid #CACAC6;
	font-family: inherit; font-size: 2;
	background-color:#213429; color:white;
	border-radius: 5px; appearance: none; 
	-webkit-appearance: none; -moz-appearance: none;
}
	
#style:hover { /* 로그인하기 hover */
	background-color: #3d5b3d;
	color: white;
}

font {
	font-family: 'Nanum Gothic', sans-serif; text-decoration: none; 
	display: inline-block; line-height:2; width: 280px; height:30px; margin: 0 10 0 10; 
}
</style>
</head>
<body>
<jsp:include page="/main/header.jsp" />
<jsp:include page="/main/banner.jsp" />

<div class="find_id_wrap">
   <table class="find_id_form" width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
         <td align="center">
              <table cellpadding=0 cellspacing=0 border=0>
                 <tr>
                    <td align="center" style="font-family: 'Do Hyeon', sans-serif; font-size: 25pt;">
                       <br>아이디 찾기<br><br></td>
                 </tr>
                 <tr>
					<td align="center" style="padding: 10px; ">
						<font color="#213429" size="5pt" style="font-family: 'Nanum Gothic', sans-serif;">
							<b>고객님의</b>
						</font><br>
						<font color="#213429" size="5pt" style="width: 400px; font-family: 'Nanum Gothic', sans-serif;">
							<b>아이디 찾기가 완료되었습니다!</b>
						</font><br>
					</td>
				</tr>
				<tr>
					<td align="center">
						<%-- <font size="2pt">아이디 : ${fn:replace(memberId.id.length()-4, memberId.id.length(), '**') }</font> --%>
						<font size="2pt">
							<div id="returnid">
								아이디 : ${memberId.id }
							</div>
						</font>
					</td>
				</tr>
				<tr>
					<td height=35 align="center" colspan=4 ><br>
						<a href="./loginPage/login.jsp" id="style"
							style="font-family: 'Nanum Gothic', sans-serif; text-decoration: none; vertical-align:middle;
									display: inline-block; line-height:2; width: 280px; height:50px; margin: 0 10 0 10;">
								로그인하기
						</a>
					</td>
				</tr>
              </table>
         </td>
      </tr>
   </table>
</div>

<jsp:include page="/main/footer.jsp" />

<script>
	var id2 = "${memberId.id }";
	var id = id2.replace(id2.substring(id2.length-4, id2.length), "****");
	$("#returnid").text(id);
</script>

</body>
</html>


