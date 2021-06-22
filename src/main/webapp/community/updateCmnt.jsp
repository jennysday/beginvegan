<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티</title>
<link href="${pageContext.request.contextPath}/resources/css/main.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/css/community/updateCmnt.css" rel="stylesheet" type="text/css">
</head>

<body>

<jsp:include page="/main/header.jsp" />
<jsp:include page="/main/banner.jsp" />

	<input name="seq" type="hidden" value="${community.seq}" />

	<div class="all_wrap">
		<h1>커뮤니티</h1>
		
		<div class="tbl_wrap">
			<form name="updateform" action="${pageContext.request.contextPath}/updateCmnt.co" method="post">
				<table class="tbl">
					<tr>
						<th class="category">제목</th>
						<td class="content">
							<input name="subject" type="text" value="${community.subject }"> 
						</td>
					</tr>
					<tr>
						<th class="category">작성자</th>
						<td class="content">${community.writer }</td>
					</tr>
					<tr class="content_tr">
						<td class="wrap_padding_content">
							<c:if test="${!empty community.cmnt_file }">
								<img src="./communityUpload/${community.cmnt_file }" width="300px">
							</c:if>
							<div class="content_wrap">
								<textarea rows="10" cols="45" name="content">
									${community.content }
								</textarea> 
							</div>
						</td>
					</tr>
					<tr class="content_last">
						<c:if test="${!empty community.cmnt_file }">
							<th class="category">첨부파일</th>
							<td class="content">${community.cmnt_file }</td>
						</c:if>
					</tr>
				</table>
			
			
			<div class="wrap_button_all">
				<div class="wrap_button_first">
					<span class="button_left">
						<a href="#" class="chk_btn" onclick="location.href='${pageContext.request.contextPath}/getCmntList.co'">목록</a>
					</span>
				</div>
				
				<div class="wrap_button_second">
					<span class="button_right">
						<input type="submit" value="수정" class="chk_btn" />
						<a href="#" class="chk_btn" onclick="history.go(-1);">취소</a>
					</span>
				</div>
			</div>
		</form>
	</div>
</div>
		
		<div class="thin_line"></div>
		

		
		<!-- 댓글 -->
		<%-- <div id="comment">
			<table>
				<tr id="category">
					<td>댓글달기</td>
				</tr>
				<tr>
					<td>
						이름 : <input type="text" value="${member.name }" id="style">
						비밀번호 : <input type="password" value="${member.pw }" id="style">
					</td>
				</tr>
				<tr>	
					<td>
						<!-- <form action="updateReply_content.co"> -->
							<textarea rows="2" cols="130" name="reply_content"></textarea>
							<!-- <input type="submit" value="확인" id="button_comment"> -->
							<a href="updateReply_content.co?seq=${community.seq }" class="chk_btn">확인</a>
						<!-- </form> -->
					</td>
				</tr>
			</table>
		</div> --%>
		
<jsp:include page="/main/footer.jsp" />

<script type="text/javascript">
function deleteCheck(){
	var url = "./deleteCmnt.co?seq="+form.seq.value;
	var answer = confirm("정말로 삭제하시겠습니까?");
	
	if(answer == true){
		alert("삭제되었습니다.");
		location.href = url;
	}
}

function updateCmnt(){
	${pageContext.request.contextPath}
	
	location.href = "board/updateCmnt.co";
}

function updateReply_content(){
	location.href = "board/updateReply_content.co"; 
}
</script>

</body>
</html>