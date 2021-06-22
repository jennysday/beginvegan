<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>고객서비스 메인</title>
<script src="https://kit.fontawesome.com/91f031aec8.js" crossorigin="anonymous"></script>
<style type="text/css">

	#category {
	width:17%;
	display:inline-block;
	margin-left: 50px;
	vertical-align: top;
}

#category b{
	height:100px;
	font-size:30px;
}

#category table{
	padding: 25px 0;
}

#category table tr td{
	font-weight: normal;
	line-height: 50px;
	width:200px;
}

#category table tr td a {
  margin-bottom: 10px;
}

#category table tr td a span {
  position: relative;
  font-weight: bold;
  color: #243421;
}

.hvr-icon-forward {
  display: inline-block;
  vertical-align: middle;
  -webkit-transform: perspective(1px) translateZ(0);
  transform: perspective(1px) translateZ(0);
  box-shadow: 0 0 1px rgba(0, 0, 0, 0);
  -webkit-transition-duration: 0.1s;
  transition-duration: 0.1s;
}
.hvr-icon {

	display: none;
	transition: all .2s ease-in-out;
}




.hvr-icon-forward:hover .hvr-icon {
display:inline-block;
 transition: all .2s ease-in-out;
  -webkit-transform: translateZ(0);
  transform: translateZ(0);
  -webkit-transition-duration: 0.1s;
  transition-duration: 0.1s;
  -webkit-transition-property: transform;
  transition-property: transform;
  -webkit-transition-timing-function: ease-out;
  transition-timing-function: ease-out;
  -webkit-transform: translateZ(4px);
  transform: translateZ(4px);
  

}





</style>

</head>
<body>



		
			<div id="category">
				<b>고객 서비스</b>
				<table>
				<c:if test="${member.id == null}">
					<tr><td ><a href="/board/getBoardList.fu"><span class="hvr-icon-forward">자주 묻는 질문 <i class="fas fa-arrow-right hvr-icon"></i></span></a></td></tr>
					<tr><td><a href="/board/getBoardList.qa"><span class="hvr-icon-forward">1:1 문의 목록 <i class="fas fa-arrow-right hvr-icon"></i></span></a></td></tr>
				</c:if>
				<c:if test="${member.id != null}">
					<tr><td ><a href="/board/getBoardList.fu?id=${member.id }" class="post-request"><span class="hvr-icon-forward">자주 묻는 질문  <i class="fas fa-arrow-right hvr-icon"></i></span></a></td></tr>
					<tr><td><a href="/board/getBoardList.qa?id=${member.id }" class="post-request"><span class="hvr-icon-forward">1:1 문의 목록 <i class="fas fa-arrow-right hvr-icon"></i></span></a></td></tr>
					<tr><td><a href="/board/customerService/QAAinsert.jsp?id=${member.id }" class="post-request"><span class="hvr-icon-forward">1:1 문의 하기 <i class="fas fa-arrow-right hvr-icon"></i></span></a></td></tr>
				</c:if>
					
				</table>
			</div>
	
<script type="text/javascript" >
	
		// GET ALL THE LINKS WE WANT TO DO A POST ON
		// jQuery EQUIVALENT WOULD BE $('.post-request').click(function(e)
		var links = document.querySelectorAll('.post-request');
		 
		// LOOP THROUGH THE FOUND LINKS AND ADD A CLICK HANDLER
		for(var l = 0; l < links.length; l++) {
		  links[l].addEventListener('click', function(e) {
		    // PREVENT DEFAULT click BEHAVIOUR
		    e.preventDefault();
		    
		    // BREAK THE URL INTO TWO action AND parameters
		    var url = this.href.split('?');
		    
		    // ONLY LOOK FOR PARAMS IF THEY WERE SPECIFIED
		    var params = (url.length > 1) ? url[1].split('&') : []
		 
		    // CREATE A FORM
		    var form = document.createElement('form');
		    
		    // MAKE IT POST TO THE URL
		    form.setAttribute('method','post');
		    form.setAttribute('action', url[0]);
		    
		    // LOOP THROUGH THE PARAMETERS AND ADD THEM AS CONTROLS TO THE FORM
		    for(var i = 0; i < params.length;i++) {
		      // CREATE THE <input> AS A text CONTROL
		      var inp = document.createElement('input');
		      inp.setAttribute('type', 'hidden');
		      // SPLIT parameter INTO key / value AND ADD TO input
		      var value = params[i].split('=');
		      inp.setAttribute('name',value[0]);
		      inp.setAttribute('value', value[1]);
		 
		      // APPEND TO <form>
		      form.appendChild(inp);
		    }
		    // APPEND <form> TO BODY AND SUBMIT
		    document.getElementsByTagName('body')[0].appendChild(form);
		    form.submit();
		  });
		}
	</script>	


</body>
</html>