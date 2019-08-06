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
<form name="updateForm" method="post" enctype="multipart/form-data" >
<div id="" style="position: relative; top: 70px;">
	<div class="">
		<ul >
			<li style="position: relative; left: 20px;  font-size: 15px; color: #0B3B24; float: left;">같이키워요 ></li>
			<li style="position: relative; left: 20px; top: -5px; font-size: 20px; color: #0B3B24; float: left;"> 재배방법보기</li>
		</ul>
		<div>
			<p id="ctvt_mth_no" style="float:right; margin-right: 5px;" ><input type="hidden" value="${cultivationmethodInfo.ctvt_mth_no}"></p>
		</div>
	<div class="single-property" style=" ">
        <div class="container">
            <div class="row spad-p">
                <div class="col-lg-12" >
                    <div class="property-title" >
                        <h3 style="float:left; margin-left: -100px; margin-top: 30px;" id="ctvt_mth_sj" >${cultivationMethodInfo.ctvt_mth_sj}</h3>
                    </div>
                </div> 
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="property-img owl-carousel">
<!--                         <div class="single-img"> -->
<!--                             <img src="img/single-property/1.jpg" alt=""> -->
<!--                         </div> -->
                        <c:if test="${!empty cultivationMethodInfo.items }">
							<c:forEach items="${cultivationMethodInfo.items }" var="fileItem" varStatus="stat">
                        <div class="single-img">
								<img src="/files/${fileItem.ctvt_mth_file_save_name }" alt="" style="width:150px;height:150px;">
                        </div>
							</c:forEach>
						</c:if>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Single Property End -->
    <!-- Single Property Deatails Section Begin -->
    <section class="property-details">
        <div class="container">
            <div class="row sp-40 spt-40">
                <div class="col-lg-8">
                    <div class="p-ins">
                        <div class="row details-top">
                            <div class="col-lg-12">
                                <div class="t-details">
                                	<div style="border-top : 1px solid #585858 "> </div>
                                    <div class="register-id" style="float: left; position: relative; left :90px; width: 100px;">
                                        <img src="/img/view/view_reg.png" width="25px" height="20px">
                                            <i class="flaticon-bath"></i>
                                            <span id="mber_ncnm" >${cultivationMethodInfo.mber_ncnm}</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12">
                                <div style="border-top : 1px solid #585858 ">
                                    <p id="ctvt_mth_cn" >${cultivationMethodInfo.ctvt_mth_cn}</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
             
            </div>
        </div>
    </section>

	</div>
	<div style="float: left; position: relative; left: 5px; top: 300px;">
		<button type="button" id="listBt" style=" color: #fff; background: #0B3B24; border-radius: 20px; padding: 5px 12px 5px 12px; border: 0;" >목록</button>
	</div>
	<div style="float: left; position: relative; left: 5px; top: 300px;">
		<button type="button" id="deleteBt" style=" color: #fff; background: #E16422; border-radius: 20px; padding: 5px 12px 5px 12px; border: 0;" >삭제</button>
	</div>
	<div style="float: left; position: relative; left: 5px; top: 300px;">
		<button type="submit" id="updateBt" style=" color: #fff; background: #E16422; border-radius: 20px; padding: 5px 12px 5px 12px; border: 0;" >수정</button>
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
<script type="text/javascript">
var mber_ncnm1 =  '${login_mberInfo.mber_ncnm}';
var mber_ncnm2 =  '${cultivationMethodInfo.mber_ncnm}';
 $(function(){
	 
// 	 var str = $('#ctvt_mth_cn').val();
// 	 str = str.split('<br/>').join("\r\n");
// 	 $('#ctvt_mth_cn').val(str);
	 
 	
	 $('#deleteBt').click(function(){//삭제
	       if(mber_ncnm1 == mber_ncnm2){
	          $(location).attr('href', '${pageContext.request.contextPath}/user/cultivationmethod/deleteCultivationMethod.do?ctvt_mth_no=${cultivationMethodInfo.ctvt_mth_no}');
	       }else{
	          alert("작성자가 아니면 삭제를 할수 없습니다.");
	       }
	    });
	 
	
	$('#listBt').click(function() {
			var search_keyword = encodeURIComponent('${search_keyword }');
		    var search_keycode = '${search_keycode }';
		    var currentPage = '${currentPage }';
			$(location).attr('href', '/user/cultivationmethod/cultivationMethodList.do?search_keyword='+search_keyword+'&search_keycode='+search_keycode+'&currentPage='+currentPage);
	});
	
	   $('form[name=updateForm]').submit(function() {
	       if(mber_ncnm1 == mber_ncnm2){
	    	 var search_keyword = encodeURIComponent('${search_keyword }');
			 var search_keycode = '${search_keycode }';
			 var currentPage = '${currentPage }';
	         $(this).attr('action', '${pageContext.request.contextPath}/user/cultivationmethod/updateCultivationMethodForm.do?ctvt_mth_no=${cultivationMethodInfo.ctvt_mth_no}' + '&search_keyword='+search_keyword+'&search_keycode='+search_keycode+'&currentPage='+currentPage);
	          }else{
	             alert("작성자가 아니면 수정를 할수 없습니다.");
	          }
	   });
	
	
 });

</script>

</html>