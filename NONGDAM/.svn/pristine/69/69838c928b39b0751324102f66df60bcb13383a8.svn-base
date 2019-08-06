<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
<title>응애~응애~</title>
<link rel="apple-touch-icon" sizes="76x76" href="${pageContext.request.contextPath }/img/apple-icon.png">
<link rel="icon" type="image/png" href="${pageContext.request.contextPath }/img/favicon.png">	
<link href="${pageContext.request.contextPath }/bootstrap3/css/bootstrap.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath }/css/gsdk.css" rel="stylesheet" />  
<link href="${pageContext.request.contextPath }/css/demo.css" rel="stylesheet" />

<!-- shopping -->
<link href="${pageContext.request.contextPath }/css/shop/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/css/shop/font-awesome.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/css/shop/prettyPhoto.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/css/shop/price-range.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/css/shop/animate.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/css/shop/main.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/css/shop/responsive.css" rel="stylesheet">

<!--     Font Awesome     -->
<link href="${pageContext.request.contextPath }/bootstrap3/css/font-awesome.css" rel="stylesheet">
<link href='http://fonts.googleapis.com/css?family=Grand+Hotel' rel='stylesheet' type='text/css'>
<script src="http://code.jquery.com/jquery-latest.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/js/jquery-ui-1.10.4.custom.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/bootstrap3/js/bootstrap.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/js/gsdk-checkbox.js"></script>
<script src="${pageContext.request.contextPath }/js/gsdk-radio.js"></script>
<script src="${pageContext.request.contextPath }/js/gsdk-bootstrapswitch.js"></script>
<script src="${pageContext.request.contextPath }/js/get-shit-done.js"></script>
<script src="${pageContext.request.contextPath }/js/custom.js"></script>
<script src="${pageContext.request.contextPath }/ckeditor/ckeditor.js" type="text/javascript"></script>
<!-- floating button -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/floating.css">
<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
 <link href="https://fonts.googleapis.com/css?family=Do+Hyeon&display=swap&subset=korean" rel="stylesheet">
 <style>
      h1,p,span,a {
        font-family: 'Do Hyeon', sans-serif;
      }
      
      p.a {
        font-weight: 200;
        color: #FFFFFF;
      }
      
      a.a {
      	font-size : 1;
        font-weight: 200;
        color: #FFFFFF;
      }
      
    </style>
<script type="text/javascript">
         
	$('.btn-tooltip').tooltip();
	$('.label-tooltip').tooltip();
	$('.pick-class-label').click(function(){
		var new_class = $(this).attr('new-class');  
		var old_class = $('#display-buttons').attr('data-class');
		var display_div = $('#display-buttons');
		if(display_div.length) {
			var display_buttons = display_div.find('.btn');
			display_buttons.removeClass(old_class);
			display_buttons.addClass(new_class);
			display_div.attr('data-class', new_class);
		}
	});
    $( "#slider-range" ).slider({
		range: true,
		min: 0,
		max: 500,
		values: [ 75, 300 ],
	});
	$( "#slider-default" ).slider({
			value: 70,
			orientation: "horizontal",
			range: "min",
			animate: true
	});
	$('.carousel').carousel({
      interval: 4000
    });
	
	
	
	//floating
	var _gaq = _gaq || [];
	_gaq.push(['_setAccount', 'UA-36251023-1']);
	_gaq.push(['_setDomainName', 'jqueryscript.net']);
	_gaq.push(['_trackPageview']);

	(function() {
		var ga = document.createElement('script'); 
		ga.type = 'text/javascript'; 
		ga.async = true;
		ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
		var s = document.getElementsByTagName('script')[0]; 
		s.parentNode.insertBefore(ga, s);
	})();
	
</script>
</head>
<body>
<div id="navbar-full">
	<div class="container">
		<nav class="navbar navbar-ct-blue navbar-transparent navbar-fixed-top" role="navigation">
          
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
                  <a href="/admin/main/main_mod.do">
                     <div class="logo-container">
<!--                         <div > -->
                        <div class="logo" style="border: none;">
                        <!--  -->
                            <img src="/img/log2.png" style="width: 48.7px; height: 48.7px;" onclick="localhost">
                        </div>
                        <div style="display:inline;">
                        	<c:if test="${empty login_mberInfo }">
                               	<div style="display:inline;float:left; margin-right: 10px;"><a href="/join/loginForm.do" class="a">LOGIN</a></div>
                               	<div style="display:inline;float:left; "><a href="/join/findInfomation.do" class="a">ID/PW찾기</a></div>
                            </c:if>
                            <c:if test="${!empty login_mberInfo }">
                             	<a href="/join/loginOut.do">로그아웃</a>
                            </c:if>
                        </div>
                    </div>
                </a>
            </div>
        <!--  -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1" >
              <c:if test="${empty login_mberInfo }" >
	              <ul class="nav navbar-nav navbar-right" style="background-color: black; opacity: 0.9;">
	              		<li><a href="/admin/sfms/farmList.do">스마트팜관리</a></li>
	              		<li><a href="/admin/member/memberList.do">회원관리</a></li>
	                    <li><a href="/admin/notice/noticeList.do">공지사항관리</a></li>
	                    <li><a href="components.html">고객센터관리</a></li>
	                    <li><a href="components.html">CropsDoctor관리</a></li>
	                    <li><a href="components.html">농업IN관리</a></li>
	                    <li><a href="components.html">같이키워요관리</a></li>
	                    <li><a href="components.html">커뮤니티관리</a></li>
	                    <li><a href="components.html">쇼핑몰관리</a></li>
	                    <li><a href="http://www.creative-tim.com/product/get-shit-done-kit" class="btn btn-round btn-default">응애~</a></li>
	               </ul>
	            </c:if>
       			<c:if test="${!empty login_mberInfo }">
	              <ul class="nav navbar-nav navbar-right">
	                    <li><a href="/admin/sfms/farmList.do">스마트팜관리</a></li>
	                    <li><a href="/admin/member/memberList.do">회원관리</a></li>
	                    <li><a href="/admin/notice/noticeList.do">공지사항관리</a></li>
	                    <li><a href="/admin/customercenter/customerCenterList.do">고객센터관리</a></li>
	                    <li><a href="/admin/cropsdoctor/mngAstt.do">CropsDoctor관리</a></li>
	                    <li><a href="/admin/farmingdiary/farmingDiaryList.do">영농일지</a></li>
	                    <li><a href="#">농업IN관리</a></li>
	                    <li><a href="/admin/cultivationmethod/cultivationMethodList.do">같이키워요관리</a></li>
	                    <li><a href="#">커뮤니티관리</a></li>
	                    <li><a href="/admin/shop/shopList.do">쇼핑몰관리</a></li>
	                    <li><a href="http://www.creative-tim.com/product/get-shit-done-kit" class="btn btn-round btn-default">응애~</a></li>
	               </ul>
               </c:if>
              
            </div><!-- /.navbar-collapse -->
          </div><!-- /.container-fluid -->
        </nav>
    </div><!--  end container-->
    
 </div>
