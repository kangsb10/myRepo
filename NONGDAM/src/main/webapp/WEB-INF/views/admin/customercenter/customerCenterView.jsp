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
			<li style="position: relative; left: 20px;  font-size: 15px; color: #0B3B24; float: left;">고객센터 ></li>
			<li style="position: relative; left: 20px; top: -5px; font-size: 20px; color: #0B3B24; float: left;"> 고객센터보기</li>
		</ul>
		<div>
			<p id="cstmr_cnter_no" style="float:right; margin-right: 5px;" ><input type="hidden" value="${customerCenterInfo.cstmr_cnter_no}"></p>
		</div>
	<div class="single-property" style=" ">
        <div class="container">
            <div class="row spad-p">
                <div class="col-lg-12" >
                    <div class="property-title" >
                        <h3 style="float:left; margin-left: -100px; margin-top: 30px;" id="cstmr_cnter_sj">${customerCenterInfo.cstmr_cnter_sj}</h3>
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
                                            <span id="mber_ncnm" >${customerCenterInfo.mber_ncnm}</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12">
                                <div style="border-top : 1px solid #585858 ">
                                    <p id="cstmr_cnter_cn" >${customerCenterInfo.cstmr_cnter_cn}</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
             
            </div>
        </div>
    </section>
	
	</div>
</div>
</form>


<form name="allForm" class="form-horizontal" role="form" action="" method="post">
<div id="" style="position: relative; top: 70px;">
	<section class="property-details">
        <div class="container">
            <div class="row sp-40 spt-40">
                <div class="col-lg-8">
                    <div class="p-ins">
                        <div class="row">
                        <ul style="margin-top: 50px;">
	                       	<li style="float:left; padding-left: -10px;"> <img src="/img/view/view_reg.png" width="25px" height="20px" style=" "></li>
	                       	<li style="float:left;  padding-left: 10px;"> <label class="" for="answer_sj" style="">제 목</label></li>
                      		<li style="float:left; padding-left: 18px;"> <input type="text" class="form-control" id="answer_sj" name="answer_sj" placeholder="제목 입력" style="position: relative; top:-5px; width: 100px;  height: 30px;"></li>
                       </ul>
	                     </div>
                     
                        <div class="row">
                            <div class="col-lg-12">
                                <div style="border-top : 1px solid #585858; "></div>
                                <div style=" position: relative; top: 5px;">
                                    <textarea rows="15" cols="95" class="answer_cn"  id="answer_cn" name="answer_cn" placeholder="내용을 입력하세요" >${cstmrAnswerInfo.answer_cn }</textarea>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
	
	</div>
	
	<div style="float: left; position: relative; left: 5px; top: 100px;">
		<button type="button" id="updateBt" style=" color: #fff; background: #0B3B24; border-radius: 20px; padding: 5px 12px 5px 12px; border: 0;" >수정</button>
	</div>
	<div style="float: left; position: relative; left: 5px; top: 100px;">
		<button type="button" id="listBt" style=" color: #fff; background: #0B3B24; border-radius: 20px; padding: 5px 12px 5px 12px; border: 0;" >목록</button>
	</div>
	<div style="float: left; position: relative; left: 5px; top: 100px;">
		<button type="button" id="deleteBt" style=" color: #fff; background: #E16422; border-radius: 20px; padding: 5px 12px 5px 12px; border: 0;" >삭제</button>
	</div>
	<c:if test="${customerCenterInfo.cstmr_cnter_answer eq '미등록' }">
	<div style="float: left; position: relative; left: 5px; top: 100px;">
		<button type="submit" style=" color: #fff; background: #E16422; border-radius: 20px; padding: 5px 12px 5px 12px; border: 0;" >등록</button>
	</div>
	</c:if>
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
CKEDITOR.replace('answer_cn'
        , {height: 200                                                 
         });
$(function(){
	
	
	
	$('#answer_sj').val('${cstmrAnswerInfo.answer_sj}');
	var str = $('#answer_cn').val();
	str = str.split('<br/>').join("\r\n");
	$('#answer_cn').val(str);
	
	
	$('#deleteBt').click(function(){//삭제
	         $(location).attr('href', '${pageContext.request.contextPath}/admin/customercenter/deleteCustomerCenter.do?cstmr_cnter_no=${customerCenterInfo.cstmr_cnter_no}');
	       
	    });
	
	$('#listBt').click(function() {
			$(location).attr('href', '/admin/customercenter/customerCenterList.do');
	});
	
	$('form[name=allForm]').submit(function() {
	
		  if($('#answer_sj').val() == null || $('#answer_sj').val().trim() == ""){
		         alert("제목을 입력하세요");
		         return false;
		      }
	      if($('#answer_cn').val() == null || $('#answer_cn').val().trim() == ""){
		         alert("내용을 입력하세요");
		         return false;
		      }
	      
	      $(this).attr('action', '${pageContext.request.contextPath}/admin/customercenter/insertAnswer.do');
	      
// 	      DB로 엔터값 처리해서 저장
	      var str = $('#answer_cn').val();
	      str = str.replace(/(?:\r\n|\r|\n)/g, '<br/>');
	     
	      
          var answer_sj = $('#answer_sj').val();
	      var answer_cn = $('#answer_cn').val(str);
	      
	      $(this).append('<input type ="hidden" name="cstmr_cnter_no" value="${customerCenterInfo.cstmr_cnter_no}"></input>');
//           $(this).append('<input type ="hidden" name="answer_sj" value="' + answer_sj +'"></input>');
// 	      $(this).append('<textarea type="hidden" name="ctvt_mth_cn" value="'+ ctvt_mth_cn +'" ></textarea>' );
		  
	      return true;
	});
	
	
	$('#updateBt').click(function() {
			if($('#answer_sj').val() == null || $('#answer_sj').val().trim() == ""){
		         alert("제목을 입력하세요");
		         return false;
		      }
			
	   		var str = $('#answer_cn').val();
		    str = str.replace(/(?:\r\n|\r|\n)/g, '<br/>');
		      
	        var answer_sj = $('#answer_sj').val();
		    var answer_cn = $('#answer_cn').val(str);
		    
		    var cn = $('#answer_cn').val();
		    $(this).append('<input type ="hidden" name="answer_no" value="${cstmrAnswerInfo.answer_no}"></input>');
		    $(this).append('<input type ="hidden" name="cstmr_cnter_no" value="${cstmrAnswerInfo.cstmr_cnter_no}"></input>');
// 		    $(this).append('<input type ="hidden" name="answer_sj" value="${cstmrAnswerInfo.cstmr_cnter_no}"></input>');
// 		    $(this).append('<input type ="hidden" name="answer_cn" value="${cstmrAnswerInfo.cstmr_cnter_no}"></input>');

		$(location).attr('href', '${pageContext.request.contextPath}/admin/customercenter/updateAnswer.do?answer_sj='+answer_sj+'&answer_cn='+cn+'&cstmr_cnter_no=${cstmrAnswerInfo.cstmr_cnter_no}&answer_no=${cstmrAnswerInfo.answer_no}');
		    return true;
	});
	
	
 });
 
</script>

</html>