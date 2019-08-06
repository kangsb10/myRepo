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
    

<!-- Google web font 
   ================================================== -->
<!--   <link href='https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,700,300' rel='stylesheet' type='text/css'> -->

    <link rel="stylesheet" href="/css/view/nice-select.css" type="text/css">
    <link rel="stylesheet" href="/css/view/owl.carousel.min.css" type="text/css">
    
    <link rel="stylesheet" href="/css/view/flaticon.css" type="text/css">
    <link rel="stylesheet" href="/css/view/jquery-ui.min.css" type="text/css">

<link
	href="https://fonts.googleapis.com/css?family=Do+Hyeon&display=swap&subset=korean"
	rel="stylesheet">
	
<link href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i"
    rel="stylesheet">
	
<style>
h1,p,span,a,div,option,input,td,h3,h4 {
	font-family: 'Do Hyeon', sans-serif;
	color: #585858;ROLLBACK

}

h1,h3 {
	font-weight: 400;
	font-size: 25px;
	color: #346D4E;
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

ul.nong_bar {
	float: left;
	
}

li.nong_bar_li {
	float: left;
	margin-left: 5px;
	
}

span.dayANDhit {
	font-weight : 200;
	color: silver;
}
</style>
</head>

<!-- <form name="updateForm"  role="form" action="" method="post"> -->
<!-- <form name="updateForm" method="post" enctype="multipart/form-data" > -->
	
<div class="" style="position: absolute; top: 80px; margin: 0 auto;" >
	<div class="" data-type="scroll-x" id="lnb_nav" style="height:43px; ">
		<div class="">
			<ul class="nong_bar">
				<li class="nong_bar_li"><a href="/user/nongupin/nongupinCategoryList.do" class="" onclick=""><span class="">| 홈 | </span></a></li>
			<c:forEach items="${guNM }" var="guNM">
				<li class="nong_bar_li"><a href="/user/nongupin/nongupinCategoryList.do?farm_in_gu=${guNM.farm_in_nm }"> ${guNM.farm_in_nm } | </a></li>
			</c:forEach>
			</ul>
		</div>
	</div>
</div>

<div id="" style="position: relative; top: 100px;">

<!-- 나중에 백그라운드 아래쪽에 로고로 넣기 -->

	<div class="single-property" style=" ">
        <div class="container">
            <div class="">
                <div class="" style="float: left; position: absolute; left: 20px; top: 25px;"  >
                    <div class="" style="background-color: pink; width: 300px; ">
                		<img alt="" src="/img/nongupin/dig.png" style="width: 20px; margin-left:2px; margin-top: 0px; height: 20px;  float: left; ">
                        <h3 style="float:left; margin-left: 10px; margin-top: 0px;" id="cstmr_cnter_sj">${nongupinInfo.farm_in_sj }</h3>
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
                        <div class="" style="position: absolute; top: 60px; 
                        								border-top : 1px solid #585858; border-bottom: 1px solid #585858; width: 350px; margin: 0 auto;">
                            <div class="">
                                <div class="" >
<!--                                 	<div style="border-top : 1px solid #585858;" > </div> -->
                                    <div class="register-id" style="float: left; position: relative; left :0px; width: 150px;">
                                        <img src="/img/view/view_reg.png" width="25px" height="20px">
                                            <i class="flaticon-bath"></i>
                                            <span id="mber_ncnm" >닉네임 : ${nongupinInfo.mber_ncnm }</span>
                                    </div>
                                    <div class="register-id" style="float: left; position: relative; left :0px; width: 200px;">
                                        <img src="/img/nongupin/battle.png" width="25px" height="20px">
                                            <i class="flaticon-bath"></i>
                                            <span id="mber_ncnm" >씨앗개수 : ${nongupinInfo.farm_in_seed }</span>
                                    </div>
                                </div>
                            </div> 
                        </div>
                        
                        <div class="row">
                            <div class="col-lg-12">
                                <div style=" position: relative; top: 100px;  ">
                                    <p style="text-align: left;" id="cstmr_cnter_cn" >${nongupinInfo.farm_in_cn } </p>
                                </div>
                            </div>
                        </div>
                        <c:choose>
                        <c:when test="${not empty nongupinInfo.items[0].farming_in_file_save_name }">
	                        <div >
								<img style="margin-left:-200px; margin-top:140px; height: 150px; width: 180px;" src="/files/${nongupinInfo.items[0].farming_in_file_save_name }">
	                        </div>
                        </c:when>
                        <c:otherwise>
                        	 <div >
								<img style="margin-left:-200px; margin-top:140px; height: 150px; width: 180px; visibility: hidden;">
	                        </div>
                        </c:otherwise>
                        </c:choose>
                        <div style="position: relative; top: 10px; left: 60px; width: 200px; margin: 0 auto;">
                        	<span id="" class="dayANDhit" >${nongupinInfo.farm_in_input_de }</span><!-- 등록일  -->
                        	<span id="" class="dayANDhit" >${nongupinInfo.farm_in_rdcnt }hit</span><!-- 등록일  -->
                        </div>
                        <div style="position: relative; top: 10px; left: 50px; width: 200px; margin: 0 auto;">
                        	<a style="float: left; width:200px; color: blue;">${nongupinInfo.farm_in_tag }</a>
                        </div>
                    </div>
                </div>
             
            </div>
        </div>
    </section>
	
	</div>
	

<!-- 답변등록 되었을때 -->

<%-- <c:if test="${customerCenterInfo.cstmr_cnter_answer eq '등록' }"> --%>
<div style="float: left; position: absolute; left: 10px; top: 460px;">
	<button type="button" id="listBt" style=" color: #fff; background: #0B3B24; border-radius: 20px; padding: 5px 12px 5px 12px; border: 0;" >목록</button>
	<c:if test="${empty nongupinAnswerInfo && login_mberInfo.mber_ncnm eq nongupinInfo.mber_ncnm }">
		<button type="button" id="delBtn" style="margin-left: 0px; color: #fff; background: #0B3B24; border-radius: 20px; padding: 5px 12px 5px 12px; border: 0;" >삭제</button>
		<button type="button" id="updateBtn" style="margin-left: 0px; color: #fff; background: #0B3B24; border-radius: 20px; padding: 5px 12px 5px 12px; border: 0;" >수정</button>
	</c:if>
<%-- 	<input type="text" disabled="disabled" value="$ {nongupinInfo.farm_in_tag }" style="background-color:white; width:150px; margin-left: 170px;"> --%>
</div>
<c:if test="${login_mberInfo.mber_ncnm ne nongupinInfo.mber_ncnm }">
	<input type="button" id="spreadBtn" value="답변하기" name="spreadBtn" style="position: relative; top: 140px;">
</c:if>
<div id="hiddenList" style="margin-left:15px; display:none; position: relative; top: 150px; border-top : 3px solid #DF3A01;" >
<form name="AnswerInsForm" id="AnswerInsForm" class="form-horizontal" role="form" action="" method="post"">
	<div class="" style=" position: relative; top:10px;">
	<textarea id="answer_cn" name="answer_cn"></textarea>
	<button type="submit" style="width:50px; height:30px;">등록</button>
	</div>
</form>
</div>
<div class="" style="position: relative; top:150px;">
	<c:forEach items="${nongupinAnswerInfo }" var="nongupinAnswerInfo">
	<div style="background-color: pink; ">
<!-- 		<div style="float: left; margin-left:20px;"> -->
<!-- 		<img alt="" src="/img/nongupin/question.png" style="  width: 50px; height: 50px; background-color: gold;"> -->
<!-- 		</div> -->
		<ul style="float: left; margin-left:0px; width: 300px; " >
			<li style="float: left; font-size: 17px; color: #0B3B24; float: left;">${nongupinAnswerInfo.mber_ncnm }</li>
			<li style="float: left; font-size: 17px;">님 답변
			<c:choose>
				<c:when test="${nongupinAnswerInfo.answer_choice_at eq 'n' && nongupinAnswerInfo.answer_check eq 'x' && login_mberInfo.mber_ncnm eq nongupinInfo.mber_ncnm }">
					<a id="selectBtn" href="/user/nongupin/answerSelect.do?answer_no=${nongupinAnswerInfo.answer_no }&farm_in_no=${nongupinAnswerInfo.farm_in_no }&mber_ncnm=${nongupinAnswerInfo.mber_ncnm }&farm_in_seed=${nongupinInfo.farm_in_seed }" style="width: 65px; height: 10%;">채택하기</a>
				</c:when>
				<c:when test="${nongupinAnswerInfo.answer_choice_at eq 'y' }">
					<label style="">★질문자채택★</label> 
				</c:when>
			</c:choose>
			</li>			
		</ul>
		<ul style="float: left; margin-left:0px; width: 380px;">
			<li style="float: left; font-size: 15px;">${nongupinAnswerInfo.answer_cn }</li>			
		</ul>
		<ul style="float: left; margin-left:0px; width: 380px;">
			<li class="dayANDhit" style="float: left;  font-size: 12px;">${nongupinAnswerInfo.answer_input_de }</li>			
		</ul>
	</div>
	</c:forEach>
	</div>
<%-- </c:if> --%>

<!-- 답변등록 안되었을때 -->
<%-- 	<c:if test=""> --%>

<!-- 		<div style="float: left; position: absolute; left: 10px; top: 550px;"> -->
<!-- 			<button type="button" id="listBt" style=" color: #fff; background: #0B3B24; border-radius: 20px; padding: 5px 12px 5px 12px; border: 0;" >목록</button> -->
<!-- 		</div> -->
<!-- 		<div style="float: left; position: absolute; left: 60px; top: 550px;"> -->
<!-- 			<button type="button" id="deleteBt" style=" color: #fff; background: #E16422; border-radius: 20px; padding: 5px 12px 5px 12px; border: 0;" >삭제</button> -->
<!-- 		</div> -->
<!-- 		<div style="float: left; position: absolute; left: 110px; top: 550px;"> -->
<!-- 			<button type="submit" id="updateBt" style=" color: #fff; background: #E16422; border-radius: 20px; padding: 5px 12px 5px 12px; border: 0;" >수정</button> -->
<!-- 		</div> -->

<%-- 	</c:if>	 --%>
</div>
<!-- </form> -->


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

// $('#answer_cn').val('');

$(document).ready(function(){
    $("#spreadBtn").click(function(){
        if($("#hiddenList").is(":visible")){
            $("#hiddenList").slideUp();
        }else{
            $("#hiddenList").slideDown();
        }
    });
});

 $(function(){
	 var backUrl = document.referrer;
	 
// 	$('form[name=AnswerInsForm]').submit(function(){
// 		$(location).attr("href", "/user/nongupin/nongupinForm.do");
// 	});


	$('#listBt').click(function(){
		document.referrer ? location.href = backUrl : location.href = "/user/nongupin/nongupinList.do";
	});
	$('#updateBtn').click(function(){
		$(location).attr("href", "/user/nongupin/updateNongupinForm.do?farm_in_no=${nongupinInfo.farm_in_no }");
	});
	$('#delBtn').click(function(){
		$(location).attr("href", "/user/nongupin/deleteNongupin.do?farm_in_no=${nongupinInfo.farm_in_no }");
	});
	 
// 	 $('#listBt').on("click",function(){
// 		var search_keyword = encodeURIComponent('${search_keyword }'); 
//         var search_keycode = '${search_keycode }';
//         var currentPage = '${currentPage }';
// 		$(location).attr('href', '/user/nongupin/nongupinList.do?&search_keyword=' + search_keyword 
// 	              + '&search_keycode=' + search_keycode + '&currentPage=' + currentPage );
// 	});
	 
	 
	 
	 
	 $('form[name=AnswerInsForm]').submit(function(){
	      var flag = true;
	      $(this).attr('action', '/user/nongupin/insertAnswer.do?'); 
//	      DB로 엔터값 처리해서 저장
	      var str = $('#answer_cn').val();
	      str = str.replace(/(?:\r\n|\r|\n)/g, '<br/>');
	     
	      
//          var bbs_sj = $('#bbs_sj').val();
	      var cafe_mber_ncnm = $('#cafe_mber_ncnm').val();
	      var answer_cn = $('#answer_cn').val(str);
	      
         $(this).append('<input type ="hidden" name="farm_in_no" value="${nongupinInfo.farm_in_no }"></input>');
         $(this).append('<input type ="hidden" name="mber_ncnm" value="${login_mberInfo.mber_ncnm }"></input>');
// 	     $(this).append('<textarea type="hidden" name="ctvt_mth_cn" value="'+ ctvt_mth_cn +'" ></textarea>' );

	      return flag;
	   });
	 
	 
 });

</script>

</html>