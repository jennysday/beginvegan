<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="${pageContext.request.contextPath}/resources/css/banner_background.css"
   rel="stylesheet" type="text/css">
   
 <link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"
  />   

</head>
<body>
   <div id="floatMenu">
           <div id="menulist"> 
              <ul>
               <c:if test="${member.id !=null }">
                     <li ><a href="#" class="post-request"><img class="banner_img" src="/board/resources/image/banner.jpg" width="80px" 
                     style="border-radius: 10px;"/></a></li>                  
                    <li><a href="/board/recipeList.go" class="post-request">레시피</a></li>
                    <li><a href="/board/getMyPage.me" class="post-request">마이페이지</a></li>
                    <li><a href="life/lifeGuide01.jsp" class="post-request">비건</a></li>
                  </c:if>
                  <c:if test="${member.id ==null }">
                     <li><a href="#"><img class="banner_img" src="/board/resources/image/banner.jpg" width="80px"
                     style="border-radius: 10px;"/></a></li>                  
                    <li><a href="/board/recipeList.go">레시피</a></li>
                    <li><a href="/board/getMyPage.me">마이페이지</a></li>
                    <li><a href="life/lifeGuide01.jsp">비건</a></li>
                    <li></li>
                  </c:if>
               </ul>
      
            </div> 
         <div class="top_wrap">
               <a class="top"><i class="fas fa-chevron-up"  id="topBotton" style="display: inline-block;font-size: 50px; color:#ffff"></i></a>
         </div>
     </div>
    
                
      
 <script type="text/javascript"
      src="${pageContext.request.contextPath}/resources/js/jquery-1.12.3.js"></script>
      <script type="text/javascript"
      src="${pageContext.request.contextPath}/resources/js/banner.js"></script>
      
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