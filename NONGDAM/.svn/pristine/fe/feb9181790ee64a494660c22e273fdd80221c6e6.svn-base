<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<head>
<!-- 	 <link href="https://fonts.googleapis.com/css?family=Do+Hyeon&display=swap&subset=korean" rel="stylesheet"> -->
	<link href="https://fonts.googleapis.com/css?family=Yeon+Sung&display=swap&subset=korean" rel="stylesheet">
	
	<style>
 h1,h2.List_category,h2.list_goods,h2.goodsname,
 p,p.goodsdc,p.goodsprice,p.goodshyetack,span,a,div,option,input,td {
  font-family: 'Yeon Sung', cursive;
    color: #585858;
 }
 
 h1,h2.List_category,h2.list_goods,h2.goodsname {
   font-weight: 500;
    font-size: 40px;
    color: #DF7401;
 }
 
 
 span,a {
   font-weight: 300;
    font-size: 20px;
    color: #FBD9A7;
 }
 
 
 
 p, p.goodsdc{
   font-weight: 200;
   font-size: 25px;
   color: #585858;
 }
 
 p.goodsprice {
   font-weight: 200;
   font-size: 25px;
   color: #FFFFFF;
 }
 
 p.goodshyetack {
   font-weight: 200;
   font-size: 17px;
   color: #FF4000;
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
 
 section#searchSection {
/*  	background-color: pink;  */
 	position: absolute;
 	top:80px;
 	width: 400px;
 
 }
 section#slider {
 	position: relative;
 	margin-top:200px;
 
 }
      
 section#categorySection {
 	position: relative; 
 	margin-top:10px; 
 	width: 100%;
 
 }
      
	</style>

</head>
<body>
<section id="searchSection" style="">
	<fieldset id="tSearch">
<!-- 		<legend></legend> -->
		<!-- 농-시장 로고누르면 농시장리스트 -->
			
			<a href="/user/shop/shopList.do">
				<img alt="" src="/img/shop/images/list/nongdamShopping.png" 
							style="height: 100px; width: 110px; position:relative; z-index: 100; 
							margin-top:-50px; left: -70px; " ></a>
			<a href="/user/shop/shopList.do" style=" width: 50px; margin-right: -150px;"><!-- 뒤에 파라미터 넘기기 -->
				<img alt="" src="/img/shop/images/list/searchbox_mod.png" 
							style="height: 200px; width: 200px; position:relative; z-index: 200; 
							margin-top:-20px; left: -95px; " ></a>
			<a><input type="text" id="" style="position:relative; margin-left:-110px; top:-24px; 
												width:150px; background-color: transparent; border: none; z-index: 500;" ></a>
			<!-- 상품등록하기 -->
			<div style="float: left; position:relative; left:325px; top:0px;">
				<input type="button" id="prodRegBtn" style=" z-index:10000; color: #fff; background: #B43104; border-radius: 20px; font-size:20px; padding: 5px 12px 5px 12px; border: 0;" value="상품등록" />
			</div>					
</fieldset>
</section>
<section id="slider" style=""><!--slider-->
		<div class="container">
			<div class="row">
				<div class="col-sm-12">
					<div id="slider-carousel" class="carousel slide" data-ride="carousel">
						<ol class="carousel-indicators">    
							<li data-target="#slider-carousel" data-slide-to="0" class="active"></li>
							<li data-target="#slider-carousel" data-slide-to="1"></li>
							<li data-target="#slider-carousel" data-slide-to="2"></li>
						</ol>
<!-- 						<a href="/user/shop/shopList.do"> -->
						<div class="carousel-inner">
<%-- 							<c:forEach items="${shoppingList }" var="shoppingList" begin="1" end="1"> --%>
								<div class="item active">
									<div class="col-sm-6">
										<img src="/files/151448_43319_5135f2c3824e0b244081857cc97761de174e.jpg" class="girl img-responsive" alt="" style=" border-radius: 10px; height: 300px; margin: 0 auto;"/>
										<img src="/img/shop/images/list/freedelivery.png" style="position:relative; margin-left:-20px; top:-300px; width: 175px; height: 110px; z-index: 500; "  class="" alt="" />
										<a href="/user/shop/shopView.do?goods_id=P100000003"><img src="/img/shop/images/list/sangsebogi.png" style="position: relative; left: 15px; top: -80px;width: 100px; "  class="" alt="" /></a>
									</div>
								</div>
<%-- 							</c:forEach> --%>
						</div>
<!-- 						</a> -->
						<a href="#slider-carousel" class="left control-carousel hidden-xs" data-slide="prev">
							<i class="fa fa-angle-left"></i>
						</a>
						<a href="#slider-carousel" class="right control-carousel hidden-xs" data-slide="next">
							<i class="fa fa-angle-right"></i>
						</a>
					</div>
					</div>
					
				</div>
			</div>
		</div>
	</section><!--/slider-->
	
	<section id="categorySection">
		<div class="container">
			<div class="row">
				<div class="col-sm-3" style="border-top: 3px solid silver; border-bottom: 3px solid silver;">
					<div class="left-sidebar">
						<div class="brands_products"><!--brands_products-->
							<h2 class="List_category"><img src="/img/shop/images/list/category.png" style="position: relative; left: 0px; width: 110px; "  class="" alt="" /></h2>
							<div class="brands-name" style="position: relative; top:-40px;">
								<ul class="nav nav-pills nav-stacked" style="float: left;  width: 500px; border: none;">
									<li style="float: left; padding-left: 20px; " ><a href="/user/shop/shopList.do?lprod_nm=P100"  style="border: 0px;  background-color: #0B6121; border-radius: 15px; "> <span class="pull-right" style="border: 0px; ">50</span>
																						<img onclick="changeButton()" alt="" src="/img/shop/images/list/nongyack.png" style="width: 30px; height: 30px;"> </a></li>
									<li style="float: left; padding-left: 20px; " ><a href="/user/shop/shopList.do?lprod_nm=P101"  style="border: 0px;  background-color: #0B6121; border-radius: 15px;"> <span class="pull-right">56</span>
																						<img alt="" src="/img/shop/images/list/nonggigu.png" style="width: 30px; height: 30px;" ></a></li>
									<li style="float: left; padding-left: 20px;" ><a href="/user/shop/shopList.do?lprod_nm=P102"  style="border: 0px;  background-color: #0B6121; border-radius: 15px;"> <span class="pull-right">27</span>
																						<img alt="" src="/img/shop/images/list/biryo.png" style="width: 30px; height: 30px;"></a></li>
								</ul>
							</div>
						</div><!--/brands_products-->
					</div>
				</div>
				
				<div class="col-sm-9 padding-right" >
					<div class="features_items"><!--features_items-->
						<h2 class="list_goods"><img src="/img/shop/images/list/nongsanspumlist.png" style="position: relative; left: 0px; width: 150px; "  class="" alt="" /></h2>
												
						<c:if test="${empty shoppingList  }">
							<tr>
								<td colspan="4" align="center"><font color="red" size="5px;">준비된 상품이가 없습니다....ㅠ.ㅜ</font></td>
							</tr>
						</c:if>
						
						<c:if test="${!empty shoppingList  }">
						<c:forEach items="${shoppingList }" var="shoppingList">
							<div class="col-sm-4">
									<div class="product-image-wrapper">
										<div  class="single-products">
													<div class="productinfo text-center">
														<p>
															<input type="hidden" id="no" value="${shoppingList.goods_id }" />
														</p>
														<img src="/files/${shoppingList.items[0].goods_file_save_name }" alt="" 
																		style="height: 300px; width: 270px; border-radius: 10px;"/>
														<p class="goodshyetack" style=" margin-top: -50px; margin-left: 90px; ">농번기 한정 무료배송 혜택</p>
														<p class="goodsprice" style=" margin-left: 170px; margin-top: -15px;">${shoppingList.goods_pc }원~</p>
														<div style="padding-bottom: 30px;">
															<h2 class="goodsname" style="float:left; margin-left:55px; margin-top:-5px;">${shoppingList.goods_nm } </h2>
															<p class="goodsdc" style="float:left; margin-top: 0px; margin-left: 10px;">| ${shoppingList.goods_dc }</p>
														</div>
														<div style="position: relative; float:left; top:-10px; left: -50px;">
															<a href="/user/shop/shopView.do?goods_id=${shoppingList.goods_id }" style="float: left;  margin-bottom :20px; height: 60px;">
																		<img src="/img/shop/images/list/sangsebogi.png" style="left:50%;  width: 120px; margin-top: -11px; "  class="" alt="" /></a>
<!-- 															<div class="" style="float: left;  margin-left: 20px; " > -->
<!-- 																<ul class="" style="float: left;" > -->
<!-- 																	<li ><a href="#"><img src="/img/shop/images/list/jangbaguni.png" style="position: relative;  width: 116px; margin-top: -8px; margin-left: -30px; class="" alt="" /></a></li> -->
<!-- 																</ul> -->
<!-- 															</div> -->
														</div>
													</div>
										</div>
									</div>
							</div>
						</c:forEach>
						</c:if>
						${pagingHtmls }
 					</div>
				</div>
			</div>
		</div>
	</section>
	
	<script src="${pageContext.request.contextPath}/js/shop/jquery.js"></script>
	<script src="${pageContext.request.contextPath}/js/shop/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/shop/jquery.scrollUp.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/shop/price-range.js"></script>
    <script src="${pageContext.request.contextPath}/js/shop/jquery.prettyPhoto.js"></script>
    <script src="${pageContext.request.contextPath}/js/shop/main.js"></script>
	
</body>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script >
$(function(){

	$('#prodRegBtn').click(function() {
		$(location).attr("href", "/admin/shop/prodForm.do");
	});
	
	

});

</script>
</html>











