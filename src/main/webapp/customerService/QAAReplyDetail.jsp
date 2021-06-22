<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/main.css" rel="stylesheet" type="text/css">

</head>

<body>

		
			<div class="title_wrap clfix member_name">
				<h3>문의 사항</h3>
				<h5>${member.name}님이 남겨주신 문의에 대한 답변입니다. </h5>
			</div>
			
			<div class="inquiry_cont_wrap"><br>			
				<div class="inquiry_cont_wrap">
				
								<table class="inquiry_table">
				<tr>
					<th>카테고리</th>
					<td  colspan="2" name="category">${qaa.category }</td>
				</tr>
				
				<tr>
					<th>제목</th>
					<td colspan="2" name="subject">${qaa.subject }</td>
				</tr>
				
				<tr>
					<th>내용</th>
					<td colspan="2" name="content" id="content">${qaa.content }</td>
				</tr>
				<c:if test='${qaa.image != null}'>
				<tr>
					<th>첨부파일</th>
					<td colspan="2"><img src="${qaa.image }" width="300" height="200"/></td>
				</tr> </c:if>
				<tr>
					<th >등록일</th>
					<td colspan="2"><fmt:formatDate value="${qaa.qaa_date }" pattern="yyyy-MM-dd"/></td>
				</tr>
				
				<tr>
					<td colspan="3" id="lasttag">
						
						<a href="/board/customerService/QAAinsert.jsp?id=${member.id }" id="insertBoard" class="post-request"><button class="chk_btn">새글 등록</button></a>&emsp;
						<a href="deleteBoard.qa?re_ref=${qaa.re_ref }&id=${member.id }" id="deleteBoard" class="post-request"><button class="chk_btn">글삭제</button></a>&emsp;
						<a href="./getBoardList.qa?id=${member.id }" class="post-request"><button class="chk_btn">취소</button></a>
					</td>
				</tr>
			</table>
				</div>
				
			</div>




</body>
</html>