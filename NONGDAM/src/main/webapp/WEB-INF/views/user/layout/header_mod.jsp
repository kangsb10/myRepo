<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<!-- <meta name="viewport" content="width=device-width, initial-scale=1" /> -->
<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
<title>header_mod title</title>

<!-- manifest -->
<%-- <link rel="manifest" href="${pageContext.request.contextPath }/WEB-INF/views/user/main/manifest.json"> --%>
<link rel="manifest" href="${pageContext.request.contextPath }/manifest.json">
<%-- <link rel="manifest" href="${pageContext.request.contextPath }/js/cropsdoctor/pwa/manifest.json"> --%>

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
<!-- <link href='http://fonts.googleapis.com/css?family=Roboto' rel='stylesheet' type='text/css'> -->
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

	$(function(){
		var ga = document.createElement('script'); 
		ga.type = 'text/javascript'; 
		ga.async = true;
		ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
		var s = document.getElementsByTagName('script')[0]; 
		s.parentNode.insertBefore(ga, s);
		
		
		
// 		$('#boardFormBtn').click(function(){
// 			$(location).attr('href', '${pageContext.request.contextPath }/');
// 		});
		
// 		$('#sels').on('click', 'li[id=Listget]', function(event){
// 			var bbs_creat_no = $(this).find('li[id=Listget]:eq(0) input').val();
// 			$(location).attr('href','${pageContext.request.contextPath }/user/cm/?bbs_creat_no=' + bbs_creat_no);
// 		});	
		
		
		
	});
	
	
	
	
</script>
</head>
<body>
<div id="navbar-full">
	<div class="container">
		<nav class="navbar navbar-ct-blue navbar-transparent navbar-fixed-top" role="navigation">
          
		<div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
                  <a href="/user/main/main_mod.do">
                     <div class="logo-container">
<!--                         <div > -->
                        <div class="logo" style="border: none;">
                            <img src="/img/log2.png" style="width: 48.7px; height: 48.7px;" onclick="/user/main/main_mod.do">
                        </div>
<!--                         <div class="brand"> -->
<!--                             <p class="a" style="font-size: 20px">nNDm</p> -->
<!--                         </div> -->
                        <div style="display:inline;">
                               	<div style="display:inline;float:left; margin-right: 10px;"><a href="/user/main/main_mod.do" class="a">농담</a></div>
                               	<div style="display:inline;float:left; "><a href="${pageContext.request.contextPath }/user/cm/communityList.do" class="a">커뮤니티</a></div>
                        </div>
                    </div>
                </a>
            </div>
        
            <!-- Collect the nav links, forms, and other content for toggling -->
<!--             <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1" style="background-color: black; z-index: 9999; opacity: 0.8; width:500px; height: 650px;"> -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
              <c:if test="${empty login_mberInfo }">
	              <ul class="nav navbar-nav navbar-right" style="background-color: black; opacity: 0.9;">
	                   	<li><a href="${pageContext.request.contextPath }/join/loginForm.do">로그인</a></li>
	                   		<li>게시판</li>
	                   	<!-- 카페의 게시판 이름 리스트 출력 -->
<%-- 	                   	<c:forEach> --%>
<!-- 	                   		<li></li> -->
<%-- 	                   	</c:forEach> --%>
	              </ul>
	            </c:if>
       			<c:if test="${!empty login_mberInfo }">
	              <ul id="sels" class="nav navbar-nav navbar-right" style="background-color: black; opacity: 0.9;">
	              <c:choose>
		              <c:when test="${login_mberInfo.mber_id eq communityInfo.mber_id }">
		             	<li style="">관리자</li>
		             	<li><a href="/user/cm/cafeBoardForm.do?cmmnty_no=${communityInfo.cmmnty_no}&cafe_mber_id=${login_mberInfo.mber_id}">게시판등록</a></li>
		              </c:when>
		              <c:when test="${login_mberInfo.mber_id eq cafeName.cafe_mber_id }">
		             	<li style=""> 별명 : ${cafeName.cafe_mber_ncnm } <a href="/user/cm/updateCafeNCNMForm.do?cmmnty_no=${communityInfo.cmmnty_no}&cafe_mber_id=${login_mberInfo.mber_id}" style=" margin-top: -23px; margin-left: 280px; color: #fff; background: #E16422; border-radius: 20px; padding: 1px 5px 1px 5px; border: 0; font-size:12px; width: 30px;">변경</a></li>
		              </c:when>
		              <c:otherwise>
		              	<li style=""><font color="white">가입해주세요</font></li>
		              </c:otherwise>
	              </c:choose>
	             	<!-- 별명변경 -->
				  <c:forEach items="${cafeBoList }" var="cafeBoList">
				  	<li><a href="/user/cm/cmaddr/${communityInfo.cmmnty_cafe_adres }/cafeSelList.do?bbs_creat_no=${cafeBoList.bbs_creat_no }&cmmnty_no=${communityInfo.cmmnty_no}&cafe_mber_id=${login_mberInfo.mber_id}">${cafeBoList.bbs_creat_sj }</a></li>
				  </c:forEach>
<%-- 	              <c:if test="${login_mberInfo.mber_id eq communityInfo.mber_id }"> --%>
	              	<!-- 게시판등록 -->
	              	
<%-- 	              	<li><button type="button" onclick="${pageContext.request.contextPath }/user/cm/cafeBoardForm.do" style=" margin-left: 5px; color: #fff; background: #E16422; border-radius: 20px; padding: 1px 5px 1px 5px; border: 0; font-size:12px; "  >게시판등록</button></li> --%>
<%-- 	              </c:if> --%>
				
<!-- 	            
	  	<li style="float: left;" ><button type="button" id="" style=" color: #fff; background: #E16422; border-radius: 20px; padding: 5px 12px 5px 12px; border: 0;" >변경</button></li> -->
	                   	<!-- 카페의 게시판 이름 리스트 출력 -->
<%--                    	<c:forEach> --%>
<!--                    		<li></li> -->
<%--                    	</c:forEach> --%>
	              </ul>
               </c:if>
              
            </div><!-- /.navbar-collapse -->
          </div><!-- /.container-fluid -->
        </nav>
    </div><!--  end container-->
    
 </div>
