<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<head>
<%--    <script src="${pageContext.request.contextPath}/js/shop/jquery.js"></script> --%>
<%--    <script src="${pageContext.request.contextPath}/views/user/shop/shopPay.jsp"></script> --%>
   <script
      src="${pageContext.request.contextPath}/js/shop/bootstrap.min.js"></script>
   <script
      src="${pageContext.request.contextPath}/js/shop/jquery.scrollUp.min.js"></script>
   <script src="${pageContext.request.contextPath}/js/shop/price-range.js"></script>
   <script
      src="${pageContext.request.contextPath}/js/shop/jquery.prettyPhoto.js"></script>
<%--    <script src="${pageContext.request.contextPath}/js/shop/main.js"></script> --%>
   
   <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
   
   <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- <script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script> -->
<link href="https://fonts.googleapis.com/css?family=Yeon+Sung&display=swap&subset=korean" rel="stylesheet">
   
   <style>
 h1,p,span,a,div,option,input,td {
  font-family: 'Yeon Sung', cursive;
    color: #585858;
 }
 
 h1,h2{
   font-weight: 500;
    font-size: 40px;
    color: #DF7401;
 }
 
 
 span,a {
   font-weight: 300;
    font-size: 20px;
    color: #DF7401;
 }
 
 
 
 p {
   font-weight: 200;
   font-size: 26px;
   color: #585858;
 }
 
 
option,input {
   color: #346D4E;
 }
 
 div#a, div#b {
   font-weight: 200;
   font-size: 40px;
   color: #FFFFFF;
 }
 
 th {
 text-align: center;
 }
 
 
   </style>
   
   <script type="text/javascript">
   
   
      
// console.log(g_qty);
// console.log(totalPrice);
// $(function(){ 
//   $('.bt_up').click(function(){ 
//     var n = $('.bt_up').index(this);
//     var num = $(".num:eq("+n+")").val();
//     num = $(".num:eq("+n+")").val(num*1+1); 
//   });
//   $('.bt_down').click(function(){ 
//     var n = $('.bt_down').index(this);
//     var num = $(".num:eq("+n+")").val();
//     num = $(".num:eq("+n+")").val(num*1-1); 
//   });
// }) 


   

   function gopay() {
      
       var g_qty = $('#goods_qty').val();
       var qty_int = parseInt(g_qty);
       var g_price = ${shoppingInfo.goods_pc };
       var price_int = parseInt(g_price);
//        var totalPrice = qty_int*price_int;
       var totalPrice = parseInt(sum.value);
       
       console.log("g_qty : " + g_qty);
       console.log("totalPrice : " + totalPrice);
       
      var IMP = window.IMP;
      IMP.init('imp49596208');

      IMP.request_pay({
          pg : 'kakao',
          pay_method : 'html5_inicis',
          merchant_uid : 'merchant_' + new Date().getTime(),
          name : '${shoppingInfo.goods_nm }',
          amount : totalPrice,
          buyer_email : '${login_mberInfo.mber_email}',
          buyer_name : '${login_mberInfo.mber_id }',
          buyer_tel : '${login_mberInfo.mber_mbtlnum }',
          buyer_addr : '${login_mberInfo.mber_bass_adres }',
          buyer_postcode : '${login_mberInfo.mber_zip }'
//           m_redirect_url : '${pageContext.request.contextPath}/user/shop/shopList.do'
      }, function(rsp) {
          if ( rsp.success ) {
              var msg = '결제가 완료되었습니다.';
              msg += '고유ID : ' + rsp.imp_uid;
              msg += '상점 거래ID : ' + rsp.merchant_uid;
              msg += '결제 금액 : ' + rsp.paid_amount;
              msg += '카드 승인번호 : ' + rsp.apply_num;
              
           
              
          } else {
              var msg = '결제에 실패하였습니다.';
              msg += '에러내용 : ' + rsp.error_msg;
          }
          alert(msg);
          $(location).attr('href' ,'${pageContext.request.contextPath}/user/shop/insertPayment.do?goods_id=${shoppingInfo.goods_id }&mber_id=${login_mberInfo.mber_id }&goods_qty=' + g_qty + '&total_price=' + totalPrice);
//           $(location).attr('href', '/user/farmingdiary/farmingDiaryList.do?mber_id=${login_mberInfo.mber_id}');
      
      });
   };
   
   
   
    var sell_price;
    var amount;
   var hm;
   var sum;
   
   function init() {
//    sell_price = ${shoppingInfo.goods_pc };
//       amount     = $('#goods_qty').val();
//       $('#sum_input').document.write('${shoppingInfo.goods_pc }'); 
//       document.$('#sum_input').value = sell_price.val();
//       $('#sum_input')= ${shoppingInfo.goods_pc };
//       $('#sum').innerHTML =  ${shoppingInfo.goods_pc };
//       document.getElementById('sum_input').innerHTML= sell_price;

   sell_price = document.form.sell_price.value;
   amount = document.form.amount.value;
   document.form.sum.value = sell_price;
      change();
   }

   function del () {
      hm = document.form.amount;
      sum = document.form.sum;
         if (hm.value > 1) {
            hm.value -- ;
            sum.value = parseInt(hm.value) * sell_price;
         }
   }

//    function del () {
//       hm  = parseInt( $('#goods_qty').val());
//       sum = parseInt($('#sum').val());
//          if (hm.val() > 1) {
//             hm.val() -- ;
//             sum.val() = hm.val() * parseInt(sell_price.val());
//          }
//    }
function add () {
   hm = document.form.amount;
   sum = document.form.sum;
   hm.value ++ ;

   sum.value = parseInt(hm.value) * sell_price;
}



   function change() {
      hm = document.form.amount;
      sum = document.form.sum;

         if (hm.value < 0) {
            hm.value = 0;
         }
      sum.value = parseInt(hm.value) * sell_price;
   }  
   </script>
</head>
<body onload="init()">
   
   <section >
   <form name="form" method="get">
      <div class="container" style="padding-top: 50px;">
         <div class="row">
            <div class="col-sm-9 padding-right">
               <div class="features_items">
<!--                   features_items -->
<%--                   <h2 class="title text-center">${shoppingInfo.goods_nm }</h2> --%>
                  <div class="col-sm-4">
                     <div style="">
                        <img id="img_back" src="/img/shop/images/view/bcx.png" style="margin-left:-130px;  width: 100px; margin-top: -11px; z-index: 400 "  class="" alt="" />
                        <!-- 농시장 이미지 > 넣기 -->
                        <img src="/img/shop/images/view/sangpumsangsae.png" style="padding-left:40px;  width: 170px; margin-top: -11px; "  class="" alt="" /></div>
                        <img alt="" src="/img/shop/images/list/shopping-cart.png" 
                              style="height: 30px; width: 30px; position:absolute; z-index: 300; 
                                 top: 15px; left: 360px;  " ></div>
                     <div class="product-image-wrapper">
                        <div class="single-products">
                           <div id="prdcBigimg" class="prdc_bigimg">
                              <div id="thumb" class="thumb ui_templateContent">
                                 <div class="thumbBox">
                                 <c:forEach items="${shoppingInfo.items }" var="fileItem" varStatus="stat">
                                    <span class="v-align"> 
                                       <img src="/files/${fileItem.goods_file_save_name }" style=" border-radius: 10px; height: 300px; margin: 0 auto;">
                                    </span>
                                 </c:forEach>
                                 </div>
                              </div>
                           </div>
                        </div>
                        <div id="prdcInfoColumn2" class="prdc_info_column2" style=" margin-top: 10px;">
                           <div class="prdc_default_info ">
                              <h3 class="hide">상품가격정보</h3>
                              <div class="price_info ">
                              
                                 <span class="price_detail"> <span class="hide">정상가</span>
                                 <!-- 상품명 -->
                                 <div style=" border: 1px solid silver; width: 280px; margin: 0 auto; margin-bottom: 20px; margin-top: 20px;">
                                    <span  >
                                       <p style="float: left; font-size: 14px; width: 70px; margin-top: 10px; ">[무료배송]</p>
                                       <p style=" width: 110px; margin-left: 80px;"> ${shoppingInfo.goods_nm }</p></span>
                                    <div style="margin-top: -17px;">
                                       <span class='normal_price'><strong style="font-size: 30px; margin-left: -190px; margin-top: -20px;" id="goods_price">${shoppingInfo.goods_pc }</strong></span>
                                       <!-- 원이미지  -->   
                                          <span class='normal_price'><img src="/img/shop/images/view/wom.png" 
                                             style="margin-left:-20px;  width: 60px; margin-top: -14px; "  class="" alt="" /></span>   
                                    </div>
                                 </div>
                                 
                                 <div style=" border: 1px solid silver; width: 280px; text-align: right; margin-left: 59px; margin-top: -21px; height: 25px;" >
                                 
                                    <p style="font-size: 17px;">1,114개 구매</p>
                                 </div>
                                 
                                    <div style="margin-top: 10px; ">
                                       <span class='normal_price' style="float: left;"><img src="/img/shop/images/view/wonsanji.png" 
                                             style="margin-left: 65px;  width: 80px; margin-top: -16px; "  class="" alt="" /></span>
                                       <span class="normal_price" style="float: left;"  ><p style=" width: 160px; margin-left: 0px; margin-top : -5px; padding-right: 40px; font-size: 20px;" > 해외- 아시아/중국</p></span>
                                    </div>   
                                    <div style="" >
                                       <span class='normal_price' style="float: left;"><img src="/img/shop/images/view/baesongjungbo.png" 
                                             style="margin-left: 65px;  width: 80px; margin-top: -17px;  "  class="" alt="" /></span>
                                       <span class="normal_price" style="float: left;"  ><p style=" width: 200px; margin-left: 0px; margin-top : -5px; padding-right: 40px;  font-size: 15px;" >지금 주문하면 배송비 무료무료 </p></span>
                                    </div>
                                    
                              </div>
                              </div>
                           </div>
                           <!-- url 카카오 연결 -->
                           <div style=" position: relative;  margin: 0 auto; margin-top: 75px; border-top: 1px solid silver;  width: 280px;  height:  60px;">
                              <img src="/img/shop/images/view/kaka.png" 
                                    style="margin-left: -70px;  width: 50px; margin-top: 5px;  "  class="" alt="" />
                              <img src="/img/shop/images/view/url.png" 
                                    style="margin-left: 20px;  width: 80px; margin-top: 2px;  "  class="" alt="" />
                           </div>
                           <!-- 항목선택부분 -->
                            <div class="nav nav-tabs" style="position: relative; top:10px; margin: 0 auto;  width: 100%; ">
                               <span class="active" style="border-left: 1px solid silver; "><a data-toggle="tab" href="#sangpumjung">
                               <img src="/img/shop/images/view/sangpumsulmyung.png" 
                                    style="margin-left: 5px;  width: 80px;"  class="" alt="" />
                                      </a>
                               </span>
                               <span style="border-left: 1px solid silver; " ><a data-toggle="tab" href="#gumaejungbo">
                               <img src="/img/shop/images/view/gumaejungbo.png" 
                                    style="margin-left: 10px;  width: 80px;    "  class="" alt="" />
                                    </a>
                              </span>
                               <span style="border-left: 1px solid silver; border-right: 1px solid silver;"><a data-toggle="tab" href="#hwanbulgyohwan">
                               <img src="/img/shop/images/view/hwanbulgyohwan.png" 
                                    style="margin-left: 10px;  width: 80px; "  class="" alt="" />
                                   </a>
                              </span>
                            </div>
  
                       <div class="tab-content">
                       
                        <!-- 상품설명 선택  -->
                               <div  class="tab-pane fade in active" id="sangpumjung">
                                  <span>
                                     <img src="/img/shop/images/view/hwakta2.PNG" 
                                          style="margin-left: 10px; margin-top:20px;  width: 340px; "  class="" alt="" />
                                   </span>
                               </div>
                        <!-- 구매정보 선택  -->
                               <div class="tab-pane fade" id="gumaejungbo">
                                  <span>
                                     <img src="/img/shop/images/view/gumaejungbo_pic.png" 
                                          style="margin-left: 10px; margin-top:20px;  width: 340px; "  class="" alt="" />
                                   </span>
                               </div>
                               <!-- 교환환불 선택  -->
                               <div class="tab-pane fade"  id="hwanbulgyohwan">
                                  <span>
                                     <img src="/img/shop/images/view/hwanbulgyohwan_pic.png" 
                                          style="margin-left: 10px; margin-top:20px;  width: 340px; height: 250px;"  class="" alt="" />
                                   </span>
                               </div>
                            
                            </div>
                            


                                       
                                    <input type="button" class=""
                                        id="buyBtn" 
                                       style="margin-left: 5px; padding: 4px 10px 4px 10px; "  value="구매하기"/>
                                    

                                 </div>
                                 
                              </div>
                           </div>
                              <!-- 구매하기 클릭시 수량선택 -->
<!--                                     <div id="input_qty"  -->
<!--                                          style="display:none; z-index: 300; position:relative; top:-20px; border: 2px solid black;"> -->
<!--                                      <span><input type="text" id="goods_qty" /> </span> -->
<!--                                      <span><input type="button" id="paygogo" onclick="gopay()" value="결제"/></span> -->
<!--                                     </div> -->
                                    
                                    <div id="input_qty" 
                                         style="display:none; z-index: 300; position:relative; top:-20px; border: 2px solid black;">
                                                     수량 : <input type=hidden name="sell_price" value="${shoppingInfo.goods_pc }">
<!--                                                      수량 : <input type=hidden name="sell_price" value="23000"> -->
                           <input type="text" id="goods_qty"  name="amount" value="1" size="3" onchange="change()" class="num">
                           <input type="button" value=" + "  class = "bt_up" onclick="add()"><input type="button" value=" - " class="bt_down" onclick="down()"><br>
                           
                           금액 : <input type="text" id="sum_input" name="sum" size="11" readonly>원
                           <input type="button" id="paygogo" onclick="gopay()" value="결제"/>
                                  </div>
                                  
<!--                                   수량 : <input type=hidden name="sell_price" value="5500"> -->
<!-- <input type="text" name="amount" value="1" size="3" onchange="change();"> -->
<!-- <input type="button" value=" + " onclick="add();"><input type="button" value=" - " onclick="del();"><br> -->

<!-- 금액 : <input type="text" name="sum" size="11" readonly>원 -->

<!--                                <div id="input_qty"  -->
<!--                                                style="display:none; z-index: 300; position:relative; top:-20px; border: 2px solid black;"> -->
<!--                                          <input type="number" -->
<!--                                               id="usernumber" name="usernumber" -->
<!--                                               value="100" -->
<!--                                               step="10" -->
<!--                                               min="0" -->
<!--                                               max="1000">  -->
                                              
<!--                              </div> -->


                                              
                        </div>
                     </div>
                  </div>
               </div>
<!--                features_items -->
            </div>
            </form>
   </section>
<script >




/* 상품정보 , 교환환불 클릭시 변하기  */
// $(document).ready(function() {
//    $('#input_qty').css('display', 'none');
//    $('#input_qty').hide();
   
   
//       $('#input_qty').css('display','block');
      
   
   
//    $('#purchaseBT').click(function(){
//    $('#input_qty').show();
//       $('#input_qty').css('display', 'block');
//    });
   
   
// });

   document.getElementById('sum_input').value = change();



$(function(){
   $('#buyBtn').click(function(){
      $('#input_qty').css('display', 'block');
   });
   
   $('#img_back').click(function(){
	   $(location).attr('href', '/user/shop/shopList.do');
   });
   
   
   $('#cartBT').click(function() {
      $('#cartYes').css('display', 'block');
   });
   
   
   $('#closeBT').click(function() {
      $('#cartYes').hide();
   });
   
   
   $('#deliveryBt').click(function() {
      $('#deliveryOpBt').css('display', 'block');
   });
   
   $('#deliveryClBt').click(function() {
      $('#deliveryOpBt').hide();
   });
   
   $('#DCBt').click(function() {
      $('#DCOpBt').css('display', 'block');
   });
   
   $('#DCClBt').click(function() {
      $('#DCOpBt').hide();
   });
   
 
});
</script>   
</body>
</html>