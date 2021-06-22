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
<link href="${pageContext.request.contextPath }/css/community/getCmnt.css" rel="stylesheet" type="text/css">
</head>

<body>
<jsp:include page="/main/header.jsp" />
<jsp:include page="/main/banner.jsp" />

	<form name="form"><input name="seq" type="hidden" value="${community.seq}" /></form>

	<div class="all_wrap">
		<h1>커뮤니티</h1>
		
		<div class="tbl_wrap">
			<table class="tbl">
				<tr>
					<th class="category">제목</th>
					<td class="content">${community.subject }</td>
				</tr>
				<tr>
					<th class="category">작성자</th>
					<td class="content">${community.writer }</td>
				</tr>
				<tr>
					<td class="wrap_padding" colspan="2">
						<ul>
							<li>
								<strong class="category">작성일</strong>
								<span class="txtNum"><fmt:formatDate value="${community.cmnt_date}" pattern="yyyy-MM-dd"/></span>
							</li>
							<li>
								<strong class="category">조회수</strong>
								<span class="txtNum">${community.readcount }</span>
							</li>
						</ul>
					</td>
				</tr>
				<tr class="content_tr">
					<td class="wrap_padding_content" colspan="2">
						<c:if test="${!empty community.cmnt_file }">
							<img src="./communityUpload/${community.cmnt_file }"><br>
						</c:if>
						${community.content }
					</td>
				</tr>
				<tr class="content_last">
					<c:if test="${!empty community.cmnt_file }">
						<th class="category">첨부파일</th>
						<td class="content">${community.cmnt_file }</td>
					</c:if>
				</tr>
			</table>
			
			<!-- 댓글 -->
			<div class="cont_comment">
				<div class="reply_all_wrap">
				
					<div class="comment_view">
						<%-- <c:if test="${community.re_lev > 0 }"> <!-- 댓글O -->
							<c:forEach items="${communityList }" var="community"> --%>
								<ul class="list_comment">
								
									<%-- <c:if test="${member.name == community.writer }"> --%> <!-- 본인 댓글(진한 배경색) --!>
										<!-- 내가 작성한 댓글 -->
										<li class="my_comment">
											<div class="comment_section">
												<div class="comment_info">
													<div class="comment_post">
														<div class="profile_info"> 
															<span class="txt_name">${community.writer }</span>
															<span class="txt_date">
																<fmt:formatDate value="${community.cmnt_date }" pattern="yy.MM.dd hh:ss"/> 
															</span>
														</div>
														<div class="box_post">
															<p class="desc_info">
																<span class="original_comment">ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ</span>
															</p>
														</div>
														<!-- 답글창 -->
														<div class="comment_more"> 
															<input type="hidden" value="${member.id }" />
															<a class="link_write">답글</a>
															<div class="inner_text_write"> 
																<div class="box_textarea">
																	<%-- <input type="hidden" name="writer" value="${member.name }" />
																	<input type="hidden" name="seq" value="${community.seq }" />
																	<input type="hidden" name="re_lev" value="${community.re_lev }" />
																	<input type="hidden" name="re_seq" value="${community.re_seq }" />  --%>
																	<textarea id="reply" name="content" rows="4" cols="120" maxlength="600"
																					placeholder="인터넷은 우리가 함께 만들어가는 소중한 공간입니다. 댓글 작성 시 타인에 대한 배려와 책임을 담아주세요."></textarea>
																</div>
																<div class="wrap_menu">
																	<div class="area_r">
																		<div id="reply_cnt">(0 / 600)</div>
																		<div class="btn_group">
																			<a class="chk_btn_reg">등록</a>
																		</div>
																	</div>
																</div>
															</div>
															<!-- 점 세개(본인:수정,삭제 / 다른 회원:신고 -->
															<div class="opt_more_g"> 
																<button type="button" class="btn_g_ico btn_more_menu" data-target-element-id="_cmt-19472-4" data-modifiable="true" data-removable="true" data-reportable="false" data-content-type="COMMENT">
																	<span class="ico_bbs ico_more">기능 더보기</span>
																</button>
															</div>
														</div>
													</div>
												</div>
											</div>
										</li>
									<%-- </c:if> --%>
									<!-- 다른 회원 댓글 -->
										<li>
										<%-- <c:if test="${member.name != community.writer }"> --%> 
											<div class="comment_section">
												<div class="comment_info">
													<div class="comment_post">
														<div class="profile_info"> 
															<span class="txt_name">${community.writer }</span>
															<span class="txt_date">
																<fmt:formatDate value="${community.cmnt_date }" pattern="yy.MM.dd hh:ss"/>
															</span>
														</div>
														<div class="box_post">
															<p class="desc_info">
																<span class="original_comment">댓글 테스트 글의 댓글</span>
															</p>
														</div>
														<!-- 답글창 -->
														<div class="comment_more"> 
															<input type="hidden" value="${community.writer }" />
															<a class="link_write">답글</a>
															<div class="inner_text_write">
																<div class="box_textarea">
																	<%-- <input type="hidden" name="writer" value="${member.name }" />
																	<input type="hidden" name="seq" value="${community.seq }" />
																	<input type="hidden" name="re_lev" value="${community.re_lev }" />
																	<input type="hidden" name="re_seq" value="${community.re_seq }" />  --%>
																	<textarea id="reply" name="content" rows="4" cols="120" maxlength="600"
																					placeholder="인터넷은 우리가 함께 만들어가는 소중한 공간입니다. 댓글 작성 시 타인에 대한 배려와 책임을 담아주세요."></textarea>
																</div>
																<div class="wrap_menu">
																	<div class="area_r">
																		<div id="reply_cnt">(0 / 600)</div>
																		<div class="btn_group">
																			<a class="chk_btn_reg">등록</a>
																		</div>
																	</div>
																</div>
															</div>
															<!-- 점 세개(본인:수정,삭제 / 다른 회원:신고 -->
															<div class="opt_more_g"> 
																<button type="button" class="btn_g_ico btn_more_menu" data-target-element-id="_cmt-19472-4" data-modifiable="true" data-removable="true" data-reportable="false" data-content-type="COMMENT">
																	<span class="ico_bbs ico_more">기능 더보기</span>
																</button>
															</div>
														</div>
													</div>
												</div>
											</div>
											<%-- </c:if> --%>
										</li>
								</ul>
							<%-- </c:forEach>
						</c:if> --%>
					</div>
					
					<!-- 페이징 -->
					<div class="simple_paging light-theme simple-pagination">
						<ul>
							<li class="disabled">
								<span class="current prev">
									<span class="ico_prev">
										<span class="sr_only">이전 목록으로 이동</span>
									</span>
								</span>
							</li>
							<li class="active">
								<span class="current">1</span>
							</li>
							<li class="disabled">
								<span class="current next">
									<span class="ico_next">
										<span class="sr_only">다음 목록으로 이동</span>
									</span>
								</span>
							</li>
						</ul>
					</div>
					
					<div class="text_write_g comment_write">
						
						<c:if test="${member != null }"> 
						<!-- 로그인O -->
							<div class="inner_text_write">
								<div class="box_textarea">
									<input type="hidden" name="writer" value="${member.name }" />
									<%-- <input type="hidden" name="seq" value="${community.seq }" />
									<input type="hidden" name="re_lev" value="${community.re_lev }" />
									<input type="hidden" name="re_seq" value="${community.re_seq }" /> --%>
									<textarea id="reply" name="content" rows="4" cols="120" maxlength="600"
													placeholder="인터넷은 우리가 함께 만들어가는 소중한 공간입니다. 댓글 작성 시 타인에 대한 배려와 책임을 담아주세요."></textarea>
								</div>
								<div class="wrap_menu">
									<div class="area_r">
										<div id="reply_cnt">(0 / 600)</div>
										<div class="btn_group">
											<a class="chk_btn_reg">등록</a>
										</div>
									</div>
								</div>
							</div>
						</c:if>
						
						<c:if test="${member == null }"> 
						<!-- 로그인X -->
							<div class="inner_text_write">
								<div class="box_textarea">
									<span>회원에게만 댓글 작성 권한이 있습니다.</span>
									<div class="btn_group">
										<a href="#" class="chk_btn" onclick="location.href='./community/insertReplyLogin.jsp'">로그인</a>
									</div>
								</div>
							</div>
						</c:if>
					</div>
				</div>
		</div>
			
		<div class="wrap_button_all">
			<div class="wrap_button_first">
				<span class="button_left">
					<a href="#" class="chk_btn" onclick="location.href='./getCmntList.co'">목록</a>
				</span>
			</div>
			<c:if test="${member.name == community.writer }">
				<div class="wrap_button_second">
					<span class="button_right">
							<a href="./community/updateCmnt.jsp" class="chk_btn">수정</a>
						<a href="#" class="chk_btn" onclick="deleteCheck()">삭제</a>
					</span>
				</div>
			</c:if>
		</div>
			
	</div>
	
</div>
		
<div class="thin_line"></div>
		
<jsp:include page="/main/footer.jsp" />

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/community/js/getCmnt.js"></script>

</body>
</html>