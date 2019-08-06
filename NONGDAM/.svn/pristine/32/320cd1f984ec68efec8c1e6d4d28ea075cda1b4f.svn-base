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
<form name="updateForm"  class="form-horizontal"  method="post" enctype="multipart/form-data" >
<div id="" style="position: relative; top: 70px;">
	<div class="">
		<ul >
			<li style="position: relative; left: 0px;  font-size: 15px; color: #0B3B24; float: left;">같이키우쟈 ></li>
			<li style="position: relative; left: 10px; top: -5px; font-size: 20px; color: #0B3B24; float: left;"> 재배방법 글쓰기</li>
		</ul>
	
    <section class="property-details">
        <div class="container">
            <div class="row sp-40 spt-40">
                <div class="col-lg-8">
                    <div class="p-ins">
                        <div class="row">
                        <ul style="margin-top: 50px;">
	                                        	<li style="float:left; padding-left: -10px;"> <img src="/img/view/view_reg.png" width="25px" height="20px" style=" "></li>
	                                        	<li style="float:left;  padding-left: 10px;"> <label class="" for="ctvt_mth_sj" style="">제 목</label></li>
	                                       		<li style="float:left; padding-left: 18px;"> <input type="text" class="form-control" id="ctvt_mth_sj" name="ctvt_mth_sj"  placeholder="제목 입력" style="position: relative; top:-5px; width: 100px;  height: 30px;"></li>
	                                        </ul>
	                     </div>
                        <div class="row">
                        <ul style="margin-top: 10px;">
	                                        	<li style="float:left; padding-left: -10px;"> <img src="/img/view/view_reg.png" width="25px" height="20px"></li>
	                                        	<li style="float:left;  padding-left: 10px;"> <label class="" for="mber_ncnm" style="">작성자</label></li>
	                                       		<li style="float:left; padding-left: 10px;"> <input type="text" class="form-control" id="mber_ncnm" name="mber_ncnm" value="${login_mberInfo.mber_ncnm}" readonly="readonly" style=" position:relative; top: -5px; height: 30px;"></li>
	                    </ul>
	                     </div>
                        <div class="row">
                            <div class="col-lg-12">
                                <div style="border-top : 1px solid #585858; "></div>
                                <div style=" position: relative; top: 5px;">
                                    <textarea rows="15" cols="95" class="ctvt_mth_cn"  id="ctvt_mth_cn" name="ctvt_mth_cn" placeholder="내용을 입력하세요" >${cultivationMethodInfo.ctvt_mth_cn}</textarea>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
	</div>
		<div class="row" style="position:relative; top: 10px;">
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
            
	<div style="float: left; position: relative; left: 5px; top: 30px;">
		<button type="button" id="listbt" style=" color: #fff; background: #0B3B24; border-radius: 20px; padding: 5px 12px 5px 12px; border: 0;" >목록</button>
	</div>
	<div style="float: left; position: relative; left: 5px; top: 30px;">
		<button type="button" id="cancelbt" style=" color: #fff; background: #E16422; border-radius: 20px; padding: 5px 12px 5px 12px; border: 0;" >취소</button>
	</div>
	<div style="float: left; position: relative; left: 5px; top: 30px;">
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
var mber_ncnm1 =  '${login_mberInfo.mber_ncnm}';
var mber_ncnm2 =  '${cultivationMethodInfo.mber_ncnm}';
	CKEDITOR.replace('ctvt_mth_cn'
	        , {height: 200                                                 
	         });
$(function(){
	$('#ctvt_mth_sj').val('${cultivationMethodInfo.ctvt_mth_sj}');
	$('#mber_ncnm').val('${cultivationMethodInfo.mber_ncnm}');
	
// 	DB에서 textarea를 <br> 없이 가져오는거 
	 var str = $('#ctvt_mth_cn').val();
	 str = str.split('<br/>').join("\r\n");
	 $('#ctvt_mth_cn').val(str);
	 
	
	
	
	 $('form[name=updateForm]').submit(function(){
// 	      var flag = true;
// 	      $('#files').each(function(index, inputTag){
// 	    	  if(!/\.(jpg|jpeg|gif|png)/.test($(inputTag).val().toLowerCase())){
// 					alert('이미지 파일만 업로드할 수 있어요.');
// 					flag = false;
// 				}
// 	      });
	      
	      
	      if($('#ctvt_mth_sj').val() == null || $('#ctvt_mth_sj').val().trim() == ""){
		         alert("제목을 입력하세요");
		         return false;
		      }
	      if($('#mber_ncnm').val() == null || $('#mber_ncnm').val().trim() == ""){
		         alert("작성자을 입력하세요");
		         return false;
		      }
	    
	      $(this).attr('action', '${pageContext.request.contextPath}/user/cultivationmethod/updateCultivationMethod.do'); 
	      
// 	      DB로 엔터값 처리해서 저장
	      var str = $('#ctvt_mth_cn').val();
	      str = str.replace(/(?:\r\n|\r|\n)/g, '<br/>');
	      
	      
	      var ctvt_mth_sj = $('#ctvt_mth_sj').val();
	      var mber_ncnm = $('#mber_ncnm').val();
	      var ctvt_mth_cn = $('#ctvt_mth_cn').val(str);
	      $(this).append('<input type ="hidden" name="ctvt_mth_no" value="${cultivationMethodInfo.ctvt_mth_no}"></input>');
// 	      $(this).append('<input type="hidden" name="mber_ncnm" value="${cultivationMethodInfo.mber_ncnm}"></input>'); //<==form 셀렉팅하기
//           $(this).append('<input type ="hidden" name="ctvt_mth_sj" value="' + ctvt_mth_sj +'"></input>');
// 	      $(this).append('<textarea type="hidden" name="ctvt_mth_cn"></textarea>' );

	      return true;
	   });
	
	$('#cancelbt').click(function() {
			var ctvt_mth_no = '${ctvt_mth_no}';
			var search_keyword = encodeURIComponent('${search_keyword }');
		    var search_keycode = '${search_keycode }';
		    var currentPage = '${currentPage }';
			$(location).attr('href', '/user/cultivationmethod/cultivationMethodView.do?ctvt_mth_no='+ctvt_mth_no + 'search_keyword='+search_keyword+'&search_keycode='+search_keycode+'&currentPage='+currentPage);
	});
	$('#listbt').click(function() {
		var search_keyword = encodeURIComponent('${search_keyword }');
	    var search_keycode = '${search_keycode }';
	    var currentPage = '${currentPage }';
		$(location).attr('href', '/user/cultivationmethod/cultivationMethodList.do?search_keyword='+search_keyword+'&search_keycode='+search_keycode+'&currentPage='+currentPage);
	});
	
	
});

// function img_pathUrl1(input){
//     $('#img_url1')[0].src = (window.URL ? URL : webkitURL).createObjectURL(input.files[0]);
// }
// function img_pathUrl2(input){
//     $('#img_url2')[0].src = (window.URL ? URL : webkitURL).createObjectURL(input.files[0]);
// }
</script>

</html>