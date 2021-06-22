<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Nanum+Gothic&display=swap" rel="stylesheet">

<link href="${pageContext.request.contextPath}/resources/css/main.css" rel="stylesheet" type="text/css">
<style type="text/css">
.login_wrap {
	min-height: 600px;
}

.login_form {
	padding: 5% 0 0;
}

#style { /* 로그인 */
	width: 70px; padding: .5em .3em;
	border: 1px solid #CACAC6;
	font-family: inherit; font-size: 2;
	background-color:#213429; color:white;
	border-radius: 5px; appearance: none; 
	-webkit-appearance: none; -moz-appearance: none;
}
	
#style:hover { /* 로그인 hover */
	background-color: #3d5b3d;
	color: white;
}
</style>
</head>
<body>

<jsp:include page="/main/header.jsp" />
<jsp:include page="/main/banner.jsp" />

<div class="login_wrap">
   <table class="login_form" width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
         <td align="center">
            <form action="/board/memberFindPw.me" method="post" id="loginform">
               <table cellpadding=0 cellspacing=0 border=0>
                  <tr>
                     <td align="center" style="font-family: 'Do Hyeon', sans-serif; font-size: 25pt;">
                        <br>비밀번호 찾기<br><br></td>
                  </tr>
                  <tr>
					<td align="center" style="padding: 10px; ">
						<font color="#213429" size="5pt" style="font-family: 'Nanum Gothic', sans-serif;">
							<b>고객님의 비밀번호가</b>
						</font><br>
						<font color="#213429" size="5pt" style="width: 400px; font-family: 'Nanum Gothic', sans-serif;">
							<b>이메일로 전송되었습니다!</b>
						</font><br>
					</td>
				</tr>
				<tr>
					<td align="center">
						<font size="2pt">
							${memberPw.email}으로 비밀번호가 발송되었습니다.<br>
							메일함을 확인해주세요.
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
            </form>
         </td>
      </tr>
   </table>
</div>

<jsp:include page="/main/footer.jsp" />
</body>
</html>
