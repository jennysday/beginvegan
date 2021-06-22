<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.vegan.admin.member.repository.ZipcodeVO" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<% 
	List<ZipcodeVO> zipcodeList = (ArrayList)request.getAttribute("zipcodeList");
%>

<!DOCTYPE html>
<html>
<head>
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<style type="text/css">
#input {
	border-left-width: 0px; border-right-width: 0px; border-top-width: 0px;
	border-bottom-width: 1px;
	width: 400px; 
}
#input:focus {
	outline: none;
}
a {
	text-decoration: none; color: black;
}
a:hover {
	text-decoration: underline;
}

.thin_line {
	 border-bottom:1px solid #243421;
}
</style>
<title>쇼핑몰</title>

</head>
<body>

<%-- 우편번호 검색 --%>
<form action="/board/searchZipcode.me" method="post" name="zipcodeform">
	<table width="500" border="0" cellspacing="0" cellpadding="5" style="padding: 10px;">
		<tr align="center">
			<td align="center"><br>
				<input type="text" name="dong" id="input" placeholder="예) 녹번동 123, 방배동 "/>
				<a href="javascript:zipcodeAction()"><i class="fa fa-search"></i></a>
			</td>
		</tr>
	</table>
	<table width="95%" border="0" cellspacing="10" cellpadding="5" style="padding-left: 30px;">
		<%
			if(zipcodeList!=null && zipcodeList.size()!=0){	
					for(int i=0;i<zipcodeList.size();i++){
						ZipcodeVO vo=(ZipcodeVO)zipcodeList.get(i);
						
						String sido = vo.getSido();
						String gugun = vo.getGugun();
						String dong = vo.getDong();
						String ri = vo.getRi();
						String bunji = vo.getBunji();
						String zipcode = vo.getZipcode();
						
						if(ri == null && bunji == null){
							ri = ""; bunji = "";
						}else if(ri == null){
							ri = "";
						}else if(bunji == null){
							bunji = "";
						}
						
						String addr1 = sido+" "+gugun+" "+dong+" "+ri+" "+bunji;
						String zip1=zipcode.split("-")[0];
						String zip2=zipcode.split("-")[1];
		%> 
			<tr>
				<td class="thin_line">
					<a href="#"	onclick="setZipcode(<%=zip1%>,<%=zip2%>,'<%=addr1 %>')">
						<font size="2"><%=zipcode%></font>
					</a>
					<font size="2" style="padding-left: 65px;"><%=addr1 %></font>
				</td>
			</tr>
		<%		 } 
			}else{  %>
			<tr>
				<td align="left" >
						<b style="font-size: 18pt;">tip</b><br>
						<p style="font-size: 10pt;">아래와 같은 조합으로 검색을 하시면 더욱 정확한 결과가 검색됩니다.</p><br>
						지역명(동/리) + 번지<br>
						<font color="skyblue" size="2pt">예) 삼평동 681, 제주 영평동 2181</font><br><br>
						지역명(동/리) + 건물명(아파트명)<br>
						<font color="skyblue" size="2pt">예) 분당 주공, 연수동 주공3차</font><br><br>
						사서함명 + 번호<br>
						<font color="skyblue" size="2pt">예) 분당우체국사서함 1~100</font><br>
					</td>
			</tr>
	<%	 } %>
	</table>
</form>
<br>
					 
<script>
function zipcodeAction(){
	zipcodeform.submit();
}

function setZipcode(zip1,zip2,addr1){ /*  */
	opener.joinform.zipcode1.value=zip1;
	opener.joinform.zipcode2.value=zip2;
	opener.joinform.addr1.value=addr1; /*  */
	self.close();
}
</script>
					 
</body>
</html>