<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Nanum+Gothic&display=swap" rel="stylesheet">

<link href="${pageContext.request.contextPath}/resources/css/main.css" rel="stylesheet" type="text/css">
<style type="text/css">
input:focus { /* 아이디/비밀번호 커서로 클릭했을 때 */
   outline-color: #213421;
}
.login_wrap{
   min-height: 600px;

}
.login_form{
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
#style:hover { /* input 단추 hover */
   background-color: #3d5b3d;
   color: white;
}
#style2 { /* 회원가입 */
   padding: .5em .3em;
   border: 1px solid #CACAC6;
    color:#213429;
   border-radius: 5px; 
   font-family: 'Nanum Gothic', sans-serif; 
   display: inline-block; 
   width: 300px; 
   height:48px;
}
#idpw {
   width: 70px; padding: .5em .3em;
   font-family: inherit; font-size: 10pt;
   background-color:white; color: #213429;
   border-radius: 5px; appearance: none; 
   -webkit-appearance: none; -moz-appearance: none;
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
            <form action="/board/memberLogin.me" method="post" id="loginform">
               <table cellpadding=0 cellspacing=0 border=0>
                  <tr>
                     <td align="center" style="font-family: 'Do Hyeon', sans-serif; font-size: 25pt;">
                        <br>로그인<br><br></td>
                  </tr>
                  <tr>
                     <td width=103 height="56">
                        <input type=text name="id" size=43 maxlength=20 
                                 placeholder="아이디를 입력해주세요" 
                                 style="font-family: 'Nanum Gothic', sans-serif; height: 50px; margin: 5px 5px; width: 305px;">
                     </td>
                  </tr>
                  <tr>
                     <td width=103>
                        <input type=password name="pw" size=43 maxlength=12
                                 placeholder="비밀번호를 입력해주세요"
                                 style="font-family: 'Nanum Gothic', sans-serif; height: 50px; margin: 5px 5px; width: 305px;">
                     </td>
                  </tr>
                  <tr>
                     <td width="13" height=25 align="right">
                        <a href="/board/loginPage/findId.jsp" id="idpw"
                           style="font-family: 'Nanum Gothic', sans-serif; text-decoration: none;">
                              아이디 찾기
                        </a> |
                        <a href="/board/loginPage/findPw.jsp" id="idpw"
                           style="font-family: 'Nanum Gothic', sans-serif; text-decoration: none;">
                              비밀번호 찾기
                        </a><br>
                     </td>
                  </tr>
                  <tr>
                     <td >
                        <input type="submit" value="로그인" id="style" onclick="return blankCheck()"
                                 style="font-family: 'Nanum Gothic', sans-serif; font-size:12pt;
                                    width: 300px; height:50px; margin: 10px; transition: all 0.3s;">
                     </td>
                  </tr>
                  <tr>
                     <td align="center">
                        <div style="line-height: 2;">
                           <a href="/board/loginPage/memberJoin.jsp" id="style2">
                                 회원가입
                           </a>
                        </div>
                     </td>
                  </tr>
               </table>
            </form>
         </td>
      </tr>
   </table>
</div>

<br><br>
<jsp:include page="/main/footer.jsp" />



<script type="text/javascript" >
function blankCheck(formId){
   var id = loginform.id.value;
   var pw = loginform.pw.value;
   
   if(id.length <= 0){
      alert('아이디를 입력해주세요.');
      loginform.id.focus();
      return false;
   }
   if(pw.length <= 0){
      alert('비밀번호를 입력해주세요.');
      loginform.pw.focus();
      return false;
   }
      return true;
}

function action(){
   loginform.action = '../memberLogin.me';
   loginform.method = 'post';
   loginform.submit();
}
</script>

</body>
</html>