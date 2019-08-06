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
<title>header_login title</title>
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
			<div class="navbar-header" style=" ">

                  <a href="/user/main/main_mod.do" ">
                     <div class="logo-container">
<!--                         <div > -->
                        <div class="logo" style="border: none;">
                            <img src="/img/log2.png" style="width: 48.7px; height: 48.7px;" onclick="/user/main/main_mod.do">
                        </div>
                        <div style="display:inline;">
                               	<div style="display:inline;float:left; margin-left: 270px; margin-top: 10px; "><a href="/join/findInfomation.do" class="a">ID/PW찾기</a></div>
                        </div>
                    </div>
                </a>
            </div>

          </div>
        </nav>
    </div><!--  end container-->
    
 </div>
