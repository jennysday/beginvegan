<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티</title>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="${pageContext.request.contextPath}/resources/css/main.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/community/getCmntList.css" rel="stylesheet" type="text/css"> <!-- ${pageContext.request.contextPath } -->
</head>

<body>
<jsp:include page="/main/header.jsp" />
<jsp:include page="/main/banner.jsp" />

<div class="under_line"></div>	

	<div class="all_wrap">
	
		<div class="wrapper">
			<div class="title">
				<h1>커뮤니티</h1>
			</div>
			<div class="bold_line"></div>
			<div class="styled-select">
				<form action="./getCmntList.co">
					<select name="category" class="search">
						<option value="전체">전체</option>
						<option value="레시피">레시피</option>
						<option value="식당 정보">식당 정보</option>
					</select>
					<input type="submit" class="chk_btn" value="검색" />
				</form>
			</div>
			<div class="under_line"></div>	
			
			<div class="tbl_wrap">
				<table>
					<tr class="tbl_category">
						<th width= "10%" class="under_line">번호</th>
						<th width= "15%" class="under_line">카테고리</th>
						<th width= "40%" class="under_line">제목</th>
						<th width= "10%" class="under_line">작성자</th>
						<th width= "15%" class="under_line">작성일</th>
						<th width= "10%" class="under_line">조회수</th>
					</tr>
					
					<c:set var="sum" value="0" /> 
			      	<c:set var="count" value="-1" /> 
			      	<c:forEach items="${communityList }" var="community" >
			        	<c:set var="sum" value="${sum+1 }"/>
			      	</c:forEach>
					
					<c:forEach items="${communityList }" var="community">
					 <c:set var="count" value="${count+1 }"/>
						<tr class="tbl_content">
	               			<td class="thin_line" >${sum - count}</td>
							<td class="thin_line">${community.category }</td>
							<td class="thin_line" align="center">
								<a href="./getCmnt.co?seq=${community.seq }">${community.subject }</a></td>
							<td class="thin_line">${community.writer }</td>
							<td class="thin_line"><fmt:formatDate value="${community.cmnt_date}" pattern="yyyy-MM-dd"/></td>
							<td class="thin_line">${community.readcount }</td>
						</tr>
					</c:forEach>
					<c:if test="${empty communityList }">
						<tr class="tbl_content">
							<td class="thin_line" colspan="6">등록된 글이 없습니다.</td>
						</tr>
					</c:if>
	
				</table>
			</div>

			<div id="insertCmnt">
				<div style="text-align: end;">
					<c:if test="${member.id != null }"> <!-- 로그인O -->
						<input type="button" value="글쓰기" onclick="location.href='community/insertCmnt.jsp'" class="chk_btn" />
					</c:if>
					<c:if test="${member.id == null }"> <!-- 로그인X -->
						<input type="button" value="글쓰기" onclick="location.href='community/insertCmntLogin.jsp'" class="chk_btn" />
					</c:if>
				</div>
			</div>
			
			<div class="search_wrap">
				<div class="search">
					<form action="./getCmntList.co" method="post">
					<select name="searchCondition" class="selectdrop" > 
						<c:forEach items="${conditionMap }" var="option">
							<option value="${option.value }">${option.key }
						</c:forEach>
					</select>
					<input type="text" class="selectsearch" name="searchKeyword" /> 
					<input type="submit" class="chk_btn" value="검색" />
					</form>
				</div>
			</div>
			
		</div>
	</div>

<jsp:include page="/main/footer.jsp" />

<script type="text/javascript">
/* $(function() {
	   $(".search").change(function() {
	       //선택한 값 = val
	      var val = $(this).val();
	      location.href="getCmntList.co?value="+val;
	   });
	}); */
</script>

</body>
</html>