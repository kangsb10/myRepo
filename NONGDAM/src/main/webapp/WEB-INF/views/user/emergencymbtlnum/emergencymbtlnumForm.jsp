<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<head>
<meta charset="UTF-8">
    <meta name="description" content="Homes Template">
    <meta name="keywords" content="Homes, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    
<link rel="stylesheet" href="css/bootstrap.min.css">

<!-- Animate CSS
   ================================================== -->
<link rel="stylesheet" href="css/animate.min.css">

<!-- Font Icons CSS
   ================================================== -->
<link rel="stylesheet" href="css/font-awesome.min.css">
<link rel="stylesheet" href="css/ionicons.min.css">

<!-- Main CSS
   ================================================== -->
<link rel="stylesheet" href="css/style.css">

<!-- Google web font 
   ================================================== -->
<!--   <link href='https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,700,300' rel='stylesheet' type='text/css'> -->

    <link rel="stylesheet" href="/css/view/nice-select.css" type="text/css">
    <link rel="stylesheet" href="/css/view/owl.carousel.min.css" type="text/css">
    
    <link rel="stylesheet" href="/css/view/flaticon.css" type="text/css">
    <link rel="stylesheet" href=/css/view/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="/css/view/jquery-ui.min.css" type="text/css">

<link
	href="https://fonts.googleapis.com/css?family=Do+Hyeon&display=swap&subset=korean"
	rel="stylesheet">
	
<link href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i"
    rel="stylesheet">
	
<style>
h1,p,span,a,div,option,input,td,h3,h4 {
	font-family: 'Do Hyeon', sans-serif;
	color: #585858;
}

h1,h3 {
	font-weight: 400;
	font-size: 25px;
	color: #F89152;
}
h4 {
	font-weight: 400;
	font-size: 20px;
}

span,a {
	font-weight: 300;
	font-size: 17px;
	color: #F89152;
}

p {
	font-weight: 200;
	font-size: 15px;
	color: #585858;
}

option,input {
	color: #346D4E;
}

div#a,div#b {
	font-weight: 200;
	font-size: 40px;
	color: #FFFFFF;
}

th {
	text-align: center;
}
</style>
</head>

<!-- <form name="updateForm"  role="form" action="" method="post"> -->
<form name="insertForm"  class="form-horizontal"  method="post" enctype="multipart/form-data" action="/user/emergencymbtlnum/insertemergencymbtlnum.do">
<div id="" style="position: relative; top: 70px;">
	<div class="">
		<ul >
			<li style="position: relative; left: 0px;  font-size: 15px; color: #0B3B24; float: left;">비상연락처</li>
			<li style="position: relative; left: 10px; top: -5px; font-size: 20px; color: #0B3B24; float: left;"> 연락처 등록하기</li>
		</ul>
	
    <section class="property-details">
        <div class="container">
            <div class="row sp-40 spt-40">
                <div class="col-lg-8">
                    <div class="p-ins">
                        <div class="row">
                        <ul style="margin-top: 50px;">
	                                        	<li style="float:left; padding-left: -10px;"> <img src="/img/view/view_reg.png" width="25px" height="20px" style=" "></li>
	                                        	<li style="float:left;  padding-left: 10px;"> <label class="" for="ctvt_mth_sj" style="">이 름</label></li>
	                                       		<li style="float:left; padding-left: 18px;"> <input type="text" class="form-control" id="egmn_nm" name="egmn_nm" placeholder="이름 입력" style="position: relative; top:-5px; width: 100px;  height: 30px;"></li>
	                                        </ul>
	                     </div>
                        <div class="row">
                        <ul style="margin-top: 10px;">
	                                        	<li style="float:left; padding-left: -10px;"> <img src="/img/view/view_reg.png" width="25px" height="20px"></li>
	                                        	<li style="float:left;  padding-left: 10px;"> <label class="" for="mber_ncnm" style="">전화번호</label></li>
	                                       		<li style="float:left; padding-left: 10px;"> <input type="text" class="form-control" id="egmn_mbtlnum" name="egmn_mbtlnum" style=" position:relative; top: -5px; height: 30px;"></li>
	                    </ul>
	                    <input type="hidden" value="${login_mberInfo.mber_id}" name="mber_id">
	                     </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
	</div>
	<div style="float: left; position: absolute; left: 60px; top: 550px;">
		<button type="button" id="cancelbt" style=" color: #fff; background: #E16422; border-radius: 20px; padding: 5px 12px 5px 12px; border: 0;" >취소</button>
	</div>
	<div style="float: left; position: absolute; left: 110px; top: 550px;">
		<button type="submit"  style=" color: #fff; background: #E16422; border-radius: 20px; padding: 5px 12px 5px 12px; border: 0;" >등록</button>
	</div>
</div>
</form>





<!-- Javascript 
================================================== -->
<script src="/js/main/jquery.js"></script>
<script src="/js/main/wow.min.js"></script>
<script src="/js/main/custom.js"></script>

 <script src="/js/view/jquery.nice-select.min.js"></script>
    <script src="/js/view/owl.carousel.min.js"></script>
    <script src="/js/view/jquery-ui.min.js"></script>
    <script src="/js/view/jquery.slicknav.js"></script>
    <script src="/js/view/main.js"></script>
<script>
$(function(){
    
	$('#cancelbt').click(function(){
		var mber_id = "${login_mberInfo.mber_id}";
		$(location).attr('href', '/user/emergencymbtlnum/emergencymbtlnumList.do?mber_id='+mber_id);
	});
	
});
</script>

</html>