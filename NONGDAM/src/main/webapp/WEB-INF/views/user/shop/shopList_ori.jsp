<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<head>
	 <link href="https://fonts.googleapis.com/css?family=Do+Hyeon&display=swap&subset=korean" rel="stylesheet">
	<style>
 h1,h2.List_category,h2.list_goods,p,span,a,div,option,input,td {
   font-family: 'Do Hyeon', sans-serif;
    color: #585858;
 }
 
 h1,h2.List_category,h2.list_goods {
   font-weight: 400;
    font-size: 25px;
    color: #DF7401;
 }
 
 
 span,a {
   font-weight: 300;
    font-size: 20px;
    color: #FBD9A7;
 }
 
 
 
 p {
   font-weight: 200;
   font-size: 15px;
   color: #FFFFFF;
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
			<a href="#" style="">
				<img alt="" src="/img/shop/images/list/shopping-cart.png" 
							style="height: 30px; width: 30px; position:absolute; z-index: 300; 
							       top: 0px; left: 360px;  " ></a>		
			<a href="/user/shop/shopList.do">
				<img alt="" src="/img/shop/images/list/nongdamShopping.png" 
							style="height: 100px; width: 110px; position:relative; z-index: 100; 
							margin-top:-50px; left: -50px; " ></a>
			<a href="/user/shop/shopList.do" style=" width: 50px; margin-right: -150px;"><!-- 뒤에 파라미터 넘기기 -->
				<img alt="" src="/img/shop/images/list/searchbox_mod.png" 
							style="height: 200px; width: 200px; position:relative; z-index: 200; 
							margin-top:-20px; left: -70px; " ></a>
			<a><input type="text" id="" style="position:relative; margin-left:-110px; top:-24px; 
												width:150px; background-color: transparent; border: none; z-index: 500;" ></a>
			<!-- 장바구니가기 -->
							
<!-- 		<input type="text" class="" title="11번가 통합검색" name="kwd" value="" id="AKCKwd"  -->
<!-- 				onFocus="" onKeyPress="if ( event.keyCode == 13) HeaderGnb.search('enter'); " style="ime-mode:active;"> -->
<!-- 		<input type="text" class="header_inp_txt" title="11번가 통합검색" name="kwd" value="{{SRCH_KWD}}" id="AKCKwd" onfocus="clearAdUrl();searchManager.init(true);"> -->
		<div id="gnbTxtAd_divId" title="MA01I" data-log-actionid-area="searchbox"><button title="검색" type="button" class="btn_search" id="gnbTxtAd" onclick="HeaderGnb.search('click'); return false;">검색</button></div>
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
						<a href="/user/shop/shopList.do">
							<div class="carousel-inner">
								<div class="item active">
									<div class="col-sm-6">
<!-- 											<img alt="" src="/img/shop/images/list/nongdamShopping.png"  -->
<!-- 												  style="height: 100px; width: 110px; position:relative; z-index: 100;  -->
<!-- 														 margin-top:-50px; left: -50px; " > -->
									</div>
									<div class="col-sm-6">
										<img src="/img/shop/images/list/hwakta.png" class="girl img-responsive" alt="" style=" border-radius: 10px; height: 400px; margin: 0 auto;"/>
										<img src="/img/shop/images/list/freedelivery.png" style="position:relative; margin-left:-30px; top:-100px; width: 175px; height: 110px; z-index: 500; "  class="" alt="" />
										<button type="button" class="" style="position: relative; left: 30px; top: -90px; font-size: 17px; border-radius: 10px; background-color: white;">사러가기</button>
	<!-- 									<img src="/img/shop/images/list/freedelivery.png" style="width: 30px; height: 30px; z-index: 500;"  class="pricing" alt="" /> -->
									</div>
								</div>
<!-- 								<div class="item"> -->
<!-- 									<div class="col-sm-6"> -->
<!-- 										<h2>자유 농-시장</h2> -->
 	<!-- 									<p>코딩 그것은 참으로 신비하고 힘든 작업이다. "나는 할수 있는가" 코딩의 노예들이여 컴 앞에서 모니터만 보면서 코딩을 하여라!!!!! </p> --> 
<!-- 										<button type="button" class="btn btn-default get">바로 구매</button> -->
<!-- 									</div> -->
<!-- 									<div class="col-sm-6"> -->
<%-- 										<img src="${pageContext.request.contextPath}/img/shop/images/home/girl2.jpg" class="girl img-responsive" alt="" /> --%>
<%-- 										<img src="${pageContext.request.contextPath}/img/shop/images/home/pricing.png"  class="pricing" alt="" /> --%>
<!-- 									</div> -->
<!-- 								</div> -->
							</div>
						</a>
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
	</section><!--/slider-->
	
	<section id="categorySection">
		<div class="container">
			<div class="row">
				<div class="col-sm-3" style="border-top: 3px solid silver; border-bottom: 3px solid silver;">
					<div class="left-sidebar">
						<div class="brands_products"><!--brands_products-->
							<h2 class="List_category" 
								style="background-color: transparent;  padding-top: 10px;">카테고리</h2>
							<div class="brands-name" style="position: relative; top:-40px;">
								<ul class="nav nav-pills nav-stacked" style="float: left;  width: 500px; border: none;">
									<li style="float: left; padding-left: 20px; " ><a href="#"  style="border: 0px;  background-color: #0B6121; border-radius: 15px; "> <span class="pull-right" style="border: 0px; ">50</span>
																						<img alt="" src="/img/shop/images/list/nongyack.png" style="width: 30px; height: 30px;"> </a></li>
									<li style="float: left; padding-left: 20px; " ><a href="#"  style="border: 0px;  background-color: #0B6121; border-radius: 15px;"> <span class="pull-right">56</span>
																						<img alt="" src="/img/shop/images/list/nonggigu.png" style="width: 30px; height: 30px;" ></a></li>
									<li style="float: left; padding-left: 20px;" ><a href="#"  style="border: 0px;  background-color: #0B6121; border-radius: 15px;"> <span class="pull-right">27</span>
																						<img alt="" src="/img/shop/images/list/biryo.png" style="width: 30px; height: 30px;"></a></li>
								</ul>
							</div>
						</div><!--/brands_products-->
					</div>
				</div>
				
				<div class="col-sm-9 padding-right" >
					<div class="features_items"><!--features_items-->
						<h2 class="list_goods">농-상품리스트</h2>
<!-- 						<input type="button" id="btn_reg" value="상품등록하기"> -->
						<c:forEach items="${shoppingList }" var="shoppingList">
							<div class="col-sm-4">
									<div class="product-image-wrapper">
										<div  class="single-products">
													<div class="productinfo text-center">
														<p>
															<input type="hidden" id="no" value="${shoppingList.goods_id }" />
														</p>
														<img src="/files/${shoppingList.items[0].goods_file_save_name }" alt="" />
														<h2>${shoppingList.goods_nm }</h2>
														<p>${shoppingList.goods_pc }</p>
														<a href="/user/shop/shopView.do?goods_id=${shoppingList.goods_id }" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>상세보기</a>
													</div>
	<!-- 											마우스갔다대면 돈나옴 -->
												<div class="product-overlay">
													<div class="overlay-content">
														<h2>${shoppingList.goods_nm }</h2>
														<p>${shoppingList.goods_pc }</p>
														<a href="/user/shop/shopView.do?goods_id=${shoppingList.goods_id }" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>상세보기</a>
													</div>
												</div>
										</div>
										<div class="choose">
											<ul class="nav nav-pills nav-justified">
												<li><a href="#"><i class="fa fa-plus-square"></i>장바구니</a></li>
											</ul>
										</div>
									</div>
							</div>
						</c:forEach>
						${pagingHtmls }
 					</div><!--features_items -->
					
					<div class="category-tab"><!--category-tab-->
						<div class="col-sm-12">
							<ul class="nav nav-tabs">
								<li class="active"><a href="#P100" data-toggle="tab">농약</a></li>
								<li><a href="#P101" data-toggle="tab">비료</a></li>
								<li><a href="#P102" data-toggle="tab">농기구</a></li>
							</ul>
						</div>
						<div class="tab-content">
							<div class="tab-pane fade active in" id="P100" >
								<c:forEach items="${shoppingList }" var="shoppingList">
									<c:if test="${shoppingList.lprod_gu eq 'P100' }">
										<div class="col-sm-3">
											<div class="product-image-wrapper">
												<div class="single-products">
													<div class="productinfo text-center">
														<p>
															<input type="hidden" id="no" value="${shoppingList.goods_id }" />
														</p>
														<img src="/files/${shoppingList.items[0].goods_file_save_name }" alt="" />
														<h2>${shoppingList.goods_nm }</h2>
														<p>${shoppingList.goods_pc }</p>
														<a href="/user/shop/shopView.do?goods_id=${shoppingList.goods_id }" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>상세보기</a>
													</div>
												</div>
											</div>
										</div>
									</c:if>
								</c:forEach>
							</div>
							
							<div class="tab-pane fade" id="P101" >
								<c:forEach items="${shoppingList }" var="shoppingList">
										<c:if test="${shoppingList.lprod_gu eq 'P101' }">
											<div class="col-sm-3">
												<div class="product-image-wrapper">
													<div class="single-products">
														<div class="productinfo text-center">
															<p>
																<input type="hidden" id="no" value="${shoppingList.goods_id }" />
															</p>
															<img src="/files/${shoppingList.items[0].goods_file_save_name }" alt="" />
															<h2>${shoppingList.goods_nm }</h2>
															<p>${shoppingList.goods_pc }</p>
															<a href="/user/shop/shopView.do?goods_id=${shoppingList.goods_id }" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>상세보기</a>
														</div>
													</div>
												</div>
											</div>
										</c:if>
									</c:forEach>
							</div>
							
							<div class="tab-pane fade" id="P102" >
								<c:forEach items="${shoppingList }" var="shoppingList">
										<c:if test="${shoppingList.lprod_gu eq 'P102' }">
											<div class="col-sm-3">
												<div class="product-image-wrapper">
													<div class="single-products">
														<div class="productinfo text-center">
															<p>
																<input type="hidden" id="no" value="${shoppingList.goods_id }" />
															</p>
															<img src="/files/${shoppingList.items[0].goods_file_save_name }" alt="" />
															<h2>${shoppingList.goods_nm }</h2>
															<p>${shoppingList.goods_pc }</p>
															<a href="/user/shop/shopView.do?goods_id=${shoppingList.goods_id }" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>상세보기</a>
														</div>
													</div>
												</div>
											</div>
										</c:if>
									</c:forEach>
							</div>
							
						</div>
					</div><!--/category-tab-->
					
					
<!-- 					보류 -->

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
// $(function(){
	
// 	$('#btView div').click(function(){
// 		var goods_id =  $(this).find('#no').val()
// 		$(location).attr('href', '/user/shop/shopView.do?goods_id=' + goods_id);
// 	});
// });

</script>
</html>











