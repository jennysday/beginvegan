<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자페이지</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>

<body>

<div class="w3-sidebar w3-bar-block w3-border-right" style="display:none" id="mySidebar">
	<button onclick="w3_close()" class="w3-bar-item w3-large">Close &times;</button>
		<a href="#" class="w3-bar-item w3-button"></a>
		<a href="/board/" class="w3-bar-item w3-button post-request">HOME</a>
		<a href="/board/adminGoodsList.go" class="w3-bar-item w3-button">상품관리</a>
		<a href="/board/orderList.od" class="w3-bar-item w3-button post-request" >주문관리</a>
		<a href="/board/getMyReviewList.re" class="w3-bar-item w3-button post-request">리뷰관리</a> 
		<a href="/board/memberList.ad" class="w3-bar-item w3-button post-request">회원관리</a>
		<a href="/board/getBoardList.aq" class="w3-bar-item w3-button post-request">고객문의관리</a>
		<a href="/board/adminRecipeList.go" class="w3-bar-item w3-button">레시피관리</a>
  		<a href="/board/getBoardList.fa" class="w3-bar-item w3-button post-request">자주묻는질문관리</a>
</div>

<div class="w3-teal">
	<button class="w3-button w3-teal w3-xlarge" onclick="w3_open()">☰</button>
	<h1><a href="/board/adminPage/adminMain.jsp">BeginVegan</a></h1>
</div>

<script>
		//앵커테그 post 방식 전달.
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