<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Nanum+Gothic&display=swap" rel="stylesheet">
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
<link href="${pageContext.request.contextPath}/resources/css/main.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/loginPage/css/login.css" rel="stylesheet" type="text/css">
</head>
<body>
<jsp:include page="/main/header.jsp" />
<jsp:include page="/main/banner.jsp" />

<form action="/board/insertMember.me" id="joinform">
	<table width="660" cellspacing="0" cellpadding="0" border="0" align="center">
		<tr>
			<td colspan="3" align="center" style="font-family: 'Do Hyeon', sans-serif; font-size: 25pt;">
				<br>회원가입<br><br>
				<hr size="1" color="black" noshade="noshade" width="660"/>
			</td>
		</tr>
		<tr align="center">
			<td>
				<table width="600" border="0" cellspacing="4" cellpadding="0" align="center">
					<tr>
						<td id="input">아이디</td>
						<td >
							<input type=text name="id" size=43 maxlength=20 id="input" 
										placeholder="6자 이상의 영문 혹은 영문과 숫자를 조합"><br>
						</td>
						<td>
							<a href="javascript:idCheckAction()" class="chk_btn">
								중복확인
							</a>
						</td>
					</tr>
					<tr>
						<td id="input">비밀번호</td>
						<td >
							<input type=password name="pw" size=43 maxlength=12 id="input"
										placeholder="비밀번호를 입력해주세요"><br>
						</td>
					</tr>
					<tr>
						<td id="input">비밀번호 확인</td>
						<td>
							<input type=password name="pw2" size=43 maxlength=12 id="input"
										placeholder="비밀번호를 한번 더 입력해주세요"><br>
						</td>
					</tr>
					<tr>
						<td id="input">이름</td>
						<td>
							<input type=text name="name" size=43 maxlength=12 id="input"
										placeholder="이름을 입력해주세요"><br>
						</td>
					</tr>
					<tr>
						<td id="input">이메일</td>
						<td>
							<input type=text name="email" size=43 maxlength=30 id="input"
										placeholder="예: beginvegan@beginvegan.com"
										style="height: 40px;"><br>
						</td>
					</tr>
					<tr>
						<td id="input">이메일 수신 여부</td>
						<td>
							<div class="checks">
								<input type=radio id="radio" name="email_get" value="YES" checked>
								<label for="radio" id="radio">수신</label>&nbsp;
								<input type=radio id="radio2" name="email_get" value="NO">
								<label for="radio2" id="radio">수신 안함</label>
							</div>
						</td>
					</tr>
					<tr>
						<td id="input">휴대폰</td>
						<td>
							<input type="text" name="phone" size=43 maxlength=11 id="input"
										placeholder="숫자만 입력해주세요"><br>
						</td>
					</tr>
					<tr>
						<td id="input" rowspan="3" valign="top" style="line-height: 4;">주소</td>
						<td >
							<input type="text" name="zipcode1" size="10" id="zipcodeinput"
										onkeypress="gNumCheck()" maxlength="3"/>-
							<input type="text" name="zipcode2" size="10" id="zipcodeinput"
										onkeypress="gNumCheck()" maxlength="3" />
							<a href="javascript:openZipcode(joinform);" id="style2">
								주소 검색  <i class="fa fa-search"></i>
							</a>
						</td>
					</tr>
					<tr>
						<td>
							<input type="text" name="addr1" size="43" id="input"/>
						</td>
					</tr>
					<tr>
						<td>
							<input type="text" name="addr2" size="43" id="input" placeholder="나머지 주소를 입력해주세요"/>
						</td>
					</tr>
					<tr>
						<td id="input">생년월일</td>
						<td width=103>
							<input type=text name="birth" size=43 maxlength=6 id="input"
										onkeypress="gNumCheck()" placeholder="숫자 6자리로 입력해주세요"><br>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td colspan="3">
				<hr size="1" color="black" noshade="noshade" ><br>
				<div style="line-height: 2; height: 200px; text-align: center;" >
					<a href="javascript:check()" class="chk_btn">
						가입하기
					</a>
				</div>
			</td>
		</tr>
	</table>
</form>

<jsp:include page="/main/footer.jsp" />

<script type="text/javascript">
function check(){
	var v_id=joinform.id.value;
	var v_password=joinform.pw.value;
	var v_password2=joinform.pw2.value;
	var v_name=joinform.name.value;
	var v_email=joinform.email.value;
	var v_zipcode1=joinform.zipcode1.value;
	var v_zipcode2=joinform.zipcode2.value;
	var v_phone=joinform.phone.value;
	var v_addr1=joinform.addr1.value;
	var v_addr2=joinform.addr2.value;
	var v_birth=joinform.birth.value;
	
	if(v_id.length == 0 || v_id.length < 6){
		alert("아이디는 최소 6자리 이상 입력하세요.");
		joinform.id.focus();
		return false;
	}
	if(v_password.length == 0 || v_password.length < 6){
		alert("비밀번호는 최소 6자리 이상 입력하세요.");
		joinform.pw.focus();
		return false;
	} 
	if(v_password != v_password2){
		alert("비밀번호가 일치하지 않습니다.");
		joinform.pw.value="";
		joinform.pw2.value="";
		joinform.pw.focus();
		return false;
	}
	if (v_name.length==0){
		alert("이름을 제대로 입력하세요.");
		joinform.name.focus();
        return false;
	}
	if(v_email.length == 0){
		alert("이메일을 제대로 입력하세요.");
		joinform.email.focus();
		return false;
	}
	if(v_phone.length == 0){
		alert("휴대폰 번호를 제대로 입력하세요.");
		joinform.phone.focus();
		return false;
	}
	if((v_zipcode1=="")||(v_zipcode1.length<3)){
		alert("우편번호 앞의 3자리를 입력하세요.");
		joinform.zipcode1.focus();
        return false;
 	}
 	if((v_zipcode2=="")||(v_zipcode2.length<3)){
		alert("우편번호 뒤의 3자리를 입력하세요.");
		joinform.zipcode2.focus();
        return false;
	}  
	if(v_addr1.length == 0){
		alert("집 주소를 입력하세요.");
		joinform.addr1.focus();
		return false;
	} 
	if(v_addr2.length == 0){
		alert("상세 주소를 입력하세요.");
		joinform.addr2.focus();
		return false;
	} 
	if(v_birth.length == 0){
		alert("생년월일을 입력하세요.");
		joinform.birth.focus();
		return false;
	} 
	joinform.submit();
	alert("환영합니다, "+v_name+"님!"); 
	alert("새로운 아이디로 다시 로그인해주세요.");
	return true;
}
function idCheckAction(){ //아이디 중복확인
	var id = joinform.id.value;
	var url = '/board/idCheck.me?id='+id;
	location.href = url;
}
function openZipcode(joinform){ //우편번호
	var url="./memberZipcode.jsp"
	open(url, "confirm", "toolbar=no,location=no,"
								+"status=no,menubar=no,"
								+"scrollbars=yes,resizable=no,"
								+"width=500,height=500,left=700,top=100");
}
function gNumCheck(){ //input 유효성 검사(숫자만 가능)
	if(event.keyCode >=48 && event.keyCode <=57) { 
		return true;
	}else{
		event.returnValue=false;
	}
}
</script>

</body>
</html>