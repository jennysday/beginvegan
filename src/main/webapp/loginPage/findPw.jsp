<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Nanum+Gothic&display=swap" rel="stylesheet">

<link href="${pageContext.request.contextPath}/resources/css/main.css" rel="stylesheet" type="text/css">
<style type="text/css">
.find_pw_wrap {
	min-height: 600px;
}

.find_pw_form {
	padding: 5% 0 0;
}

input:focus { /* 아이디/비밀번호 커서로 클릭했을 때 */
	outline-color: #213421;
}
	
#style { /* 로그인 */
	width: 70px; padding: .5em .3em;
	border: 1px solid #CACAC6;
	font-family: inherit; font-size: 2;
	background-color:#213429; color:white;
	border-radius: 5px; appearance: none; 
	-webkit-appearance: none; -moz-appearance: none;
}
	
#style:hover { /* input 단추 hover */
	background-color: #3d5b3d;
	color: white;
}
</style>

</head>
<body>
<jsp:include page="/main/header.jsp" />
<jsp:include page="/main/banner.jsp" />

<div class="find_pw_wrap">
   <table class="find_pw_form" width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
         <td align="center">
            <form action="/board/memberFindPw.me" method="post" id="loginform">
               <table cellpadding=0 cellspacing=0 border=0>
                  <tr>
                     <td align="center" style="font-family: 'Do Hyeon', sans-serif; font-size: 25pt;">
                        <br>비밀번호 찾기<br><br></td>
                  </tr>
                  <tr>
						<td width=103 style="font-family: 'Nanum Gothic', sans-serif; font-size: 8pt;">&nbsp;&nbsp;이름</td>
					</tr>
                  <tr>
                     <td width=103 height="56">
                        <input type=text name="name" size=43 maxlength=20 
                                 placeholder="고객님의 이름을 입력해주세요" 
                                 style="font-family: 'Nanum Gothic', sans-serif; height: 50px; margin: 5px 5px; width: 305px;">
                     </td>
                  </tr>
                  <tr>
						<td width=103 style="font-family: 'Nanum Gothic', sans-serif; font-size: 8pt;">&nbsp;&nbsp;아이디</td>
					</tr>
                  <tr>
						<td width=103 height="56">
							<input type=text name="id" size=43 maxlength=12
										placeholder="고객님의 아이디를 입력해주세요"
										style="font-family: 'Nanum Gothic', sans-serif; height: 50px; margin: 5px 5px; width: 305px;"><br>
						</td>
					</tr>
                  <tr>
						<td width=103 style="font-family: 'Nanum Gothic', sans-serif; font-size: 8pt;">&nbsp;&nbsp;이메일</td>
					</tr>
                  <tr>
                     <td width=103>
                        <input type=text name="email" size=43 maxlength=30
                                 placeholder="가입시 등록하신 이메일 주소를 입력해주세요"
                                 style="font-family: 'Nanum Gothic', sans-serif; height: 50px; margin: 5px 5px; width: 305px;">
                     </td>
                  </tr>
                  <tr>
                     <td >
                        <input type="submit" value="찾기" id="style" onclick="return blankCheck()"
                                 style="font-family: 'Nanum Gothic', sans-serif; font-size:12pt;
                                    width: 305px; height:50px; margin: 10px; transition: all 0.3s;">
                     </td>
                  </tr>
               </table>
            </form>
         </td>
      </tr>
   </table>
</div>

<jsp:include page="/main/footer.jsp" />

<script>
function formSubmit(){
	var forms = document.getElementById("findform");
	
	if ((forms.name.value=="") ||
		(forms.name.value.length<3)){
		alert("이름을 입력해주세요");
		forms.name.focus();
        return false;
	}else if((forms.id.value=="") ||
			(forms.id.value.length==0)){
		alert("아이디를 입력해주세요");
   		forms.jumin1.focus();
        return false;
 	}else if((forms.email.value=="")||
 			(forms.email.value.length==0)){
		alert("이메일을 입력해주세요");
      	forms.jumin2.focus();
        return false;
	}
	return true;
}
</script>

</body>
</html>
