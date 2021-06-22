<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글목록</title>

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css">
<link href="${pageContext.request.contextPath}/resources/css/main.css" rel="stylesheet" type="text/css">
<style type="text/css">
   body, div, h2, table, tr, th, td, input, ul, li, form, table, h4, a{margin: 0; padding: 0;}
   body, input{font-size: 14px; }


   ul{list-style: none; }
   img{border: none;}
   table{border-collapse:collapse; }
   a{text-decoration: none; color: #222; }
   #wrapper{width: 1100px; margin: 50px auto; position: relative; padding:50px 0;}
   /* h2{width: 1200px; height: 100px; background-color: #008B8B; color: #fff; line-height: 100px; font-size: 20px; margin-bottom: 50px; } */
   i{font-size: 20px; border: 1px solid #07c; }
   
   .bkin{border-radius: 8px; font-size: 14px;padding: 10px 15px;  background-color: #213421; border: none; color:#fff; transition: all 0.3s; text-align: center;
    text-decoration: none; display: inline-block; font-size: 15px; margin-left: 15px; margin-top:4px; cursor: pointer; float:right; }
   


   .bkin:hover {
       background-color: #649E64;
   }


   input[type=number]::-webkit-inner-spin-button {
        -webkit-appearance: none;
        margin: 0;
   }

   input[type=number] {
      width: 40px;
   }
   
   .result {
      font-size: large;
   }

   
   #floatMenu{ text-align:center; position:absolute; width:80px; height: 300px; top:250px; right:0px; padding:0px; margin:0px; z-index:1000; border: 0; right:30px;}
   #menulist{position: absolute; top: 0; left:0; border:0px; }
   #menulist a{width: 80px; height: 100px; width:100%; height:100%; font-size:15px; padding:5px; }
   
   
   #pdprice{font-size:26px;}
   #pdname{font-size:24px;}
   
   
   #topBotton{border:none;}
   #insertB{border-radius: 8px; font-size: 14px;padding: 10px 15px;  background-color: #213421; border: none; color:#fff; transition: all 0.3s; text-align: center;
    text-decoration: none; display: inline-block; font-size: 15px; margin: 4px; cursor: pointer; }


   #tabwrap1{width: 100%; height: 50px;margin-top: 100px; box-sizing: border-box;}
   #tabwrap2{width: 100%; height: 50px;margin-top: 100px; box-sizing: border-box;}
   #tabwrap3{width: 100%; height: 50px;margin-top: 100px; box-sizing: border-box;}
   #tabwrap4{width: 100%; height: 50px;margin-top: 100px; box-sizing: border-box;}
   .tablist{ overflow: hidden; }
   .tablist li{ float: left; width: 25%; height: 50px; background-color: #213421;  text-align: center; border: 1px solid #ccc; box-sizing: border-box;border-collapse: collapse;
border-collapse: separate;}
   
   .tablist li.tab1{background-color: #731d09;  }
   .tablist li.tab2{background-color: #731d09;  }
   .tablist li.tab3{background-color: #731d09;  }
   .tablist li.tab4{background-color: #731d09;  }
   .tablist > li > a{color: #fff; line-height: 50px; font-size: 16px; width:100%; height:100%; display:block;}
   
   
   .mainImg{width: 1050px; height: 830px; position: relative; overflow: hidden; }
   .mainImg .left_content{float: left; width: 430px; height: 550px; }
   .mainImg .right_content{float: right; width: 560px; height: 830px; }
   .right_content > table{width: 560px; height: 770px; border: none; }
   .right_content > table tr{border-bottom: 1px solid #d9d9d9; }
   .right_content > table tr:first-child{border-bottom: none; }
   
   h4{font-size: 16px; margin: 20px 0; width: 70%; text-align: center}
   .contentwrap{width: 1100px; }
   .content01{margin:50px;}
   .content01 th{padding: 10px 0; }
   
   .detail{margin:50px; text-align:center;}
   #dtimage{position:absolute; margin-top: 30px;}
   
   .content03{margin-left: 50%; transform: translateX(-50%);  width: 980px; height: 510px;  }
   .reviewtb{ border-top: 1px solid #000; border-bottom: 1px solid #000; }
   .reviewtb th{padding: 10px 0;  }
   .reviewtb td{border-bottom: 1px solid #d9d9d9; padding: 10px 0; text-align: center; }
   #insertB{float: right; margin-top: 20px;  margin-bottom: 50px; }
   #insertB:hover{ background-color: #649E64;}

.but{
   border:none;
   cursor: pointer;
   background:none;
   line-height: 30px;
   width:10%;
   height:30px;
   font-weight: 600;
   font-size: 25px;
   padding:0;
   transition:all 0.5s;
   border-radius: 5px;
}

.but:hover{
   color:#731d09;
}

.btn_box{
   border: 1px solid #ccc;
   width: 135px;
   height: 35px;
   line-height: 35px;
   border-radius: 5px;
   text-align: center;
   padding:0;
   margin:0;
}




</style>


</head>
<body>

<jsp:include page="/main/header.jsp" />
<jsp:include page="/main/banner.jsp" />



<div id="wrapper">
   

   <div class="mainImg">
      <div class="left_content">
         <img src="./GoodsUpload/${goods.image01}"  width="100%" height="100%">
      </div>
   
      <div class="right_content">
         <table align="center">
            <colgroup>
               <col width="20%"/>
               <col width="*"/>
            </colgroup>
            <tr>
               <th colspan="2" id="pdname">${goods.name }</th>
            </tr>
            <tr>
               <th colspan="2" id="pdprice">${goods.price }원</th>
            </tr>
            <tr>
               <th>판매단위</th>
               <td>1개</td>
            </tr>
            <tr>
               <th>중량/용량</th>
               <td>180g</td>
            </tr>
            <tr>
               <th>배송구분</th>
               <td>택배배송</td>
            </tr>
            <tr>
               <th>포장타입</th>
               <td>상온/종이포장</td>
            </tr>
            <tr>
               <th>안내사항</th>
               <td><p>- 시세에 따라 가격이 변동될 수 있습니다.<br/>
                        - 산지 사정상 한정수량으로 운영될 수 있습니다.</p></td>
            </tr>
            <tr>
               <th valign="middle">구매수량</th>
               <td>
               
               <c:set var="buyAmount" value="1" />
                  <input type="button" onclick="downAmount()"  value="-" class="but"/>
                  <input type="number" value="${buyAmount }" name="amount" id="buyAmount" onkeyup="buyAmount()" style="text-align: center;"/>
                  <input type="button" onclick="upAmount()"  value="+" class="but"/>
                  <input type="hidden" value="${goods.price}" id="price"/>
                  <input type="hidden" value="${goods.amount}" id="maxAmount"/>
         
                  <input type="hidden" value="${goods.amount}" id="maxAmount"/>
                  (구매가능 수량: ${goods.amount }개)
                     
               
            </td>
            
      
            </tr> 
            <tr style="border-bottom-color: white">
               <td colspan="2">
               <div style="text-align: right; font-size: large;">
                  총 상품금액 : <div id="sum" style="display: inline-block;"><fmt:formatNumber value="${goods.price}" pattern="#,###"/>원</div><br><br>
               </div>
               <c:if test="${member.id == null}">
                  <form action="/board/prepareOrderOnly.od" method="get">
                     <input type="hidden" value="${goods.seq}" name="order_goods_num"/>
                     <input type="hidden" name="order_goods_count" class="buyAmount" value="${buyAmount }"/>
                     <input type="submit" value="비회원 바로 주문" class="bkin" />   
                  </form>
                  <form action="/board/addBasket.do" method="get">
                     <input type="hidden" value="${goods.seq}" name="goodsSeq"/>
                     <input type="hidden" name="amount" class="buyAmount" value="${buyAmount }"/>
                     <input type="hidden" value="${goods.amount}" name="goodsAmount"/>
                     <input type="submit" value="비회원 장바구니 담기" class="bkin" />   
                  </form>

               </c:if>
               <c:if test="${member.id != null}">
               
                  <form action="/board/prepareOrderOnly.od" method="post">
                     <input type="hidden" value="${goods.seq}" name="order_goods_num"/>
                     <input type="hidden" name="order_goods_count" class="buyAmount" value="${buyAmount }"/>
                     <input type="hidden" value="${member.seq}" name="seq"/>
                     <input type="hidden" value="${member.id}" name="id"/>
                     <input type="submit" value="바로 주문" class="bkin" />   
                  </form>
                  <form action="/board/addBasket.do" method="post"  enctype="multipart/form-data">
                     <input type="hidden" value="${goods.seq}" name="goodsSeq"/>
                     <input type="hidden" value="${member.seq}" name="seq"/>
                     <input type="hidden" value="${goods.amount}" name="goodsAmount"/>
                     <input type="hidden" class="buyAmount" value="${buyAmount }" name="amount"/>
                     <input type="submit" value="장바구니 담기" class="bkin" />   
                  </form>
                     
               </c:if>
               </td>
            
            </tr>
                  
         </table>
      </div>
   </div>
   
<div id="tabwrap1">
    <ul class="tablist">
          <li class="tab1"><a href="#tabwrap1">상품설명</a></li>
          <li class="tab2_1"><a href="#tabwrap2">상품이미지</a></li>
          <li class="tab3_1"><a href="#tabwrap3">상세정보</a></li>
          <li class="tab4_1"><a href="#tabwrap4">고객후기</a></li>
     </ul>
</div>



   <div class="contentwrap">
   <div class="content01 on">
   <h4>  </h4>
         <div>
            <img src="./GoodsUpload/${goods.image01}" width="100%">
            <%-- <c:if test="${goods.image02}!=null"> --%>
               <img src="./GoodsUpload/${goods.image02}" width="100%" >
            <%-- </c:if> --%>
            <%-- <c:if test="${goods.image03}!=null"> --%>
            <img src="./GoodsUpload/${goods.image03}" width="100%" >
            <%-- </c:if> --%>
            <p style="text-align: center;">${goods.content }</p>
         </div>
      </div>
      
      
   <div id="tabwrap2">
    <ul class="tablist">
            <li class="tab1_1"><a href="#tabwrap1">상품설명</a></li>
          <li class="tab2"><a href="#tabwrap2">상품이미지</a></li>
          <li class="tab3_1"><a href="#tabwrap3">상세정보</a></li>
          <li class="tab4_1"><a href="#tabwrap4">고객후기</a></li>
     </ul>
   </div>
   
   
   <div class="content02">
         <div class="detail">
            <img src="./GoodsUpload/${goods.image02}" width="100%">
            <img src="./GoodsUpload/${goods.image03}" width="100%">
         </div>
   
   </div>
   
   
   
   <div id="tabwrap3">
       <ul class="tablist">
          <li class="tab1_1"><a href="#tabwrap1">상품설명</a></li>
          <li class="tab2_1"><a href="#tabwrap2">상품이미지</a></li>
          <li class="tab3"><a href="#tabwrap3">상세정보</a></li>
          <li class="tab4_1"><a href="#tabwrap4">고객후기</a></li>
        </ul>
   </div>
   
   <div class="content03">
      <div></div><p/>
      <img src="./image/de.png" id="dtimage">
      
   </div>
   
   
   <div id="tabwrap4">
       <ul class="tablist">
          <li class="tab1_1"><a href="#tabwrap1">상품설명</a></li>
          <li class="tab2_1"><a href="#tabwrap2">상품이미지</a></li>
          <li class="tab3_1"><a href="#tabwrap3">상세정보</a></li>
          <li class="tab4"><a href="#tabwrap4">고객후기</a></li>
        </ul>
   </div>


      <div class="content4">
      <h4></h4>
      <form name="review" action="/board/getReviewList.re" method="post" enctype="multipart/form-data">   
         <table class="reviewtb" width="100%" cellspacing="0" cellpadding="15px" align="center">
            <tr>
               <th>번호</th>
               <th>상품이름</th>
               <th>작성자</th>
               <th>제목</th>
               <th>작성일</th>
               <th>별점</th>
               
            </tr>
            
      <c:set var="sum" value="0" /> 
      <c:set var="count" value="-1" /> 
      <c:forEach items="${review }" var="review" >
         <c:set var="sum" value="${sum+1 }"/>
      </c:forEach>
      
         <c:forEach items="${review }" var="review" >
            <c:set var="count" value="${count+1 }"/>
         
            <tr class="view" >
               <td class="seq" >${sum - count}</td>
               
               <td>${review.name}</td>
               <td>${review.user_name}</td>
               <td >${review.content_name}</td>
               <td><fmt:formatDate value="${review.write_date }" pattern="yyyy-MM-dd"/></td>
               <td>
                  <c:if test="${review.star==1 }">
                     <img src="./image/star1.png" width="20px" height="20px"><br/>
                     "너무 별로네요"
                  </c:if>
                  <c:if test="${review.star==2 }">
                     <img src="./image/star2.png" width="40px" height="20px"><br/>
                     "별로네요"
                  </c:if>
                  <c:if test="${review.star==3 }">
                     <img src="./image/star3.png" width="60px" height="20px"><br/>
                     "보통이요"
                  </c:if>
                  <c:if test="${review.star==4 }">
                     <img src="./image/star4.png" width="80px" height="20px"><br/>
                     "좋아요"
                  </c:if>
                  <c:if test="${review.star==5 }">
                     <img src="./image/star5.png" width="100px" height="20px"><br/>
                     "너무 좋아요"
                  </c:if>
               </td>
               
            </tr>
            <tr  class="con" style="display:none">
               <td align="center" colspan="7">
               <c:if test="${review.image == null }">
               <p>${review.content }</p>
               </c:if>
                  <c:if test="${review.image!=null }">
                  <img  src="./ReviewUpload/${review.image}"  width="200px" height="250px" border="0" >
                  <p>${review.content }</p>
               </c:if>
               </td>
            </tr>
            
         </c:forEach>
   
      </table>
   </form>   
                  
      <%-- <input id="insertB" type="button" value="리뷰쓰기" onClick="location.href='insertReview.re?name=${goods.name }'" > --%>
			<c:if test="${member.seq !=null }">
				<a href="/board/insertReview.re?goods_seq=${goods.seq}" class="post-request" ><button id="insertB">리뷰쓰기</button></a>
			</c:if><%-- onClick="location.href='/board/insertReview.re?goods_seq=${goods.seq}&name=${goods.name }'" --%> 
			<c:if test="${member.seq ==null }">
				<a href="/board/insertReview.re?goods_seq=${goods.seq}"><button id="insertB">리뷰쓰기</button></a>
			</c:if>	
   </div>




</div>


</div>
      <div id="topBotton" >
         <a href="javascript:void(0);"></a>
      </div>
      
      
      
      
<jsp:include page="/main/footer.jsp" />

<script src="/board/js/jquery-3.6.0.min.js"></script> 

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

<script type="text/javascript">
//배너들
$(function() {

   //밑에 top 기능      
   var topb="#topBotton";
   
      $(window).on("scroll touchmove mousewheel DOMMouseScroll", function(e) {
      if($(window).scrollTop() >= 20) $(topb).fadeIn();
      else $(topb).fadeOut();
      });
      $(topb).click(function(){
      $("html,body").animate({ scrollTop: 0 }, "fast");

      });

});

 //상품 함수

function buyAmount() {
   var buyAmount = document.getElementById('buyAmount').value;
   buyAmount *=1;
   
   var price = document.getElementById('price').value;
    price *=1;
    var sum=1;
     sum *= price;
     sum *= buyAmount;
   
      if(1000<=sum && sum<1000000) {
         var sum1 = parseInt(sum/1000);
         var sum2 = sum%1000;
         if(sum2!=0){
            sum =sum1+","+sum2;   
         }else {
            sum = sum1+",000";
         }
            
         
      }else if (sum>=1000000 && sum<1000000000) {
         var sum1 = parseInt(sum/1000000);
         var sum2 = sum%1000000;
         var sum3 = parseInt(sum2/1000);
         var sum4 = sum2%1000;
         
         if(sum2!=0) {
            if(sum4!=0){
               sum = sum1+","+sum3+","+sum4;
            }else {
               sum = sum1+","+sum3+",000";
            }
            
         }else {
            sum=sum1+",000,000";
         }
   
      }
   
      document.getElementsByClassName('buyAmount')[0].value = buyAmount;
      document.getElementsByClassName('buyAmount')[1].value = buyAmount;
     document.getElementById("sum").innerText = sum;
 }
 
 
function downAmount()  {
   var buyAmount = document.getElementById('buyAmount').value;
   
   buyAmount *=1;
   
   
   if(buyAmount==1) {
      alert("최소 주문 수량은 1 개 입니다.")
      
   }else {
      buyAmount -=1;
      
      document.getElementById("buyAmount").value = buyAmount;
      
      var price = document.getElementById('price').value;
       price *=1;
       var sum=1;
        sum *= price;
        sum *= buyAmount;
        
         if(1000<=sum && sum<1000000) {
            var sum1 = parseInt(sum/1000);
            var sum2 = sum%1000;
            if(sum2!=0){
               sum =sum1+","+sum2;   
            }else {
               sum = sum1+",000";
            }
               
            
         }else if (sum>=1000000 && sum<1000000000) {
            var sum1 = parseInt(sum/1000000);
            var sum2 = sum%1000000;
            var sum3 = parseInt(sum2/1000);
            var sum4 = sum2%1000;
            
            if(sum2!=0) {
               if(sum4!=0){
                  sum = sum1+","+sum3+","+sum4;
               }else {
                  sum = sum1+","+sum3+",000";
               }
               
            }else {
               sum=sum1+",000,000";
            }
      
         }
      
         document.getElementsByClassName('buyAmount')[0].value = buyAmount;
         document.getElementsByClassName('buyAmount')[1].value = buyAmount;
        document.getElementById("sum").innerText = sum;
      
      
   }
   
}



function upAmount()  {
   var buyAmount = document.getElementById('buyAmount').value;   
   buyAmount *=1;
   
   var maxAmount = document.getElementById('maxAmount').value;   
   maxAmount *=1;
   
   if(buyAmount==maxAmount) {
      alert("최대 주문 수량을 넘었습니다.")
      
   }else {
      buyAmount +=1;
      
      document.getElementById("buyAmount").value = buyAmount;
      
      var price = document.getElementById('price').value;
       price *=1;
       var sum=1;
        sum *= price;
        sum *= buyAmount;
        
         if(1000<=sum && sum<1000000) {
            var sum1 = parseInt(sum/1000);
            var sum2 = sum%1000;
            if(sum2!=0){
               sum =sum1+","+sum2;   
            }else {
               sum = sum1+",000";
            }
               
            
         }else if (sum>=1000000 && sum<1000000000) {
            var sum1 = parseInt(sum/1000000);
            var sum2 = sum%1000000;
            var sum3 = parseInt(sum2/1000);
            var sum4 = sum2%1000;
            
            if(sum2!=0) {
               if(sum4!=0){
                  sum = sum1+","+sum3+","+sum4;
               }else {
                  sum = sum1+","+sum3+",000";
               }
               
            }else {
               sum=sum1+",000,000";
            }
      
         }
      
         document.getElementsByClassName('buyAmount')[0].value = buyAmount;
         document.getElementsByClassName('buyAmount')[1].value = buyAmount;
   
        document.getElementById("sum").innerText = sum;
}}

 
//리뷰 함수
      $(function() {
         $(".view").click(function() {
            var view = $(this).next(".con");
            view.toggle();   
         
         });
      }); 
      
      
      
</script>  
   
      
</body>
</html>