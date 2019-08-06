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
<form name="insertForm"  class="form-horizontal"  method="post" enctype="multipart/form-data" >
<div id="" style="position: relative; top: 70px;">
	<div class="">
		<ul >
			<li style="position: relative; left: 0px;  font-size: 15px; color: #0B3B24; float: left;">영농일지 ></li>
			<li style="position: relative; left: 10px; top: -5px; font-size: 20px; color: #0B3B24; float: left;"> 영농일지 글쓰기</li>
		</ul>
	
    <section class="property-details">
        <div class="container">
            <div class="row sp-40 spt-40">
                <div class="col-lg-8">
                    <div class="p-ins">
                        <div class="row">
                        <ul style="margin-top: 50px;">
	                                        	<li style="float:left; padding-left: -10px;"> <img src="/img/view/view_reg.png" width="25px" height="20px" style=" "></li>
	                                        	<li style="float:left;  padding-left: 10px;"> <label class="" for="farm_diary_sj" style="">제 목</label></li>
	                                       		<li style="float:left; padding-left: 18px;"> <input type="text" class="form-control" id="farm_diary_sj"  placeholder="제목 입력" style="position: relative; top:-5px; width: 100px;  height: 30px;"></li>
	                    </ul>
	                     </div>
                        <div class="row">
                        <ul style="margin-top: 10px;">
	                                        	<li style="float:left; padding-left: -10px;"> <img src="/img/view/view_reg.png" width="25px" height="20px"></li>
	                                        	<li style="float:left;  padding-left: 10px;"> <label class="" for="mber_ncnm" style="">작성자</label></li>
	                                       		<li style="float:left; padding-left: 10px;"> <input type="text" class="form-control" id="mber_ncnm"  value="${login_mberInfo.mber_ncnm}" readonly="readonly" style=" position:relative; top: -5px; height: 30px;"></li>
	                    </ul>
	                     </div>
                        <div class="row">
                            <div class="col-lg-12">
                                <div style="border-top : 1px solid #585858; "></div>
                                <div style=" position: relative; float: left; top: 5px;">
                                	<li style="float:left;  padding-left: 10px;"><label class="" for="farm_diary_wethr" style="margin-right: 10px;">날씨</label></li>
                                    <input type="text" class="form-control" id="farm_diary_wethr"  placeholder="날자 입력" style="position: relative; top:-5px; width: 100px;  height: 30px;">
                                </div>
                                <div style=" position: relative; float: left; top: 5px;">
                                	<li style="float:left;  padding-left: 10px;"><label class="" for="farm_diary_make_co" style="margin-right: 10px;">조성주수</label></li>
                                    <input type="text" class="form-control" id="farm_diary_make_co"  placeholder="수 입력" style="position: relative; top:-5px; width: 100px;  height: 30px;">
                                </div>
                                <div style=" position: relative; top: 5px;">
                                	<li style="float:left;  padding-left: 10px;"><label class="" for="farm_diary_crops_knd" style="margin-right: 10px;">작물종류</label></li>
                                    <input type="text" class="form-control" id="farm_diary_crops_knd"  placeholder="작물종류 입력" style="position: relative; top:-5px; width: 100px;  height: 30px;">
                                </div>
                            </div>
                        </div>
                        <div class="row" >
                            <div class="col-lg-12">
                                <div style="border-top : 1px solid #585858; "></div>
                                <div style=" position: relative; top: 5px;">
                                    <textarea rows="15" cols="95" class="farm_diary_opert_cn"  id="farm_diary_opert_cn" name="farm_diary_opert_cn" placeholder="내용을 입력하세요" ></textarea>
                                </div>
                            </div>
                        </div>
                         <div class="row">
                         	<div class="col-lg-12">
                        	<ul >
								<li style="position: relative; left: -30px; top: 0px; font-size: 20px; color: #0B3B24; float: left;"> 내일 일정</li>
							</ul>
							</div>
                        </div>
                        <div class="row" >
                            <div class="col-lg-12">
                                <div style="border-top : 1px solid #585858; "></div>
                                <div style=" position: relative; top: 5px;">
                                    <textarea rows="15" cols="95" class="farm_diary_tomo_fx"  id="farm_diary_tomo_fx" name="farm_diary_tomo_fx" placeholder="내용을 입력하세요" ></textarea>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                         	<div class="col-lg-12">
                        	<ul >
								<li style="position: relative; left: -30px; top: 0px; font-size: 20px; color: #0B3B24; float: left;"> SFMS내용</li>
							</ul>
                       	 	</div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12">
                                <div style="border-top : 1px solid #585858; "></div>
                                <div style=" position: relative; top: 5px;">
                                    <textarea rows="15" cols="95" class="farm_diary_sfms_emrgncy_cn"  id="farm_diary_sfms_emrgncy_cn" name="farm_diary_sfms_emrgncy_cn" placeholder="내용을 입력하세요" ></textarea>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                         	<div class="col-lg-12">
                        	<ul >
								<li style="position: relative; left: -30px; top: 0px; font-size: 20px; color: #0B3B24; float: left;"> 진단내용</li>
							</ul>
                        	</div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12">
                                <div style="border-top : 1px solid #585858; "></div>
                                <div style=" position: relative; top: 5px;">
                                    <textarea rows="15" cols="95" class="farm_diary_dgnss"  id="farm_diary_dgnss" name="farm_diary_dgnss" placeholder="내용을 입력하세요" ></textarea>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
	</div>
	
	<div class="row">
		 <ul style="margin-top: 10px;">
	                   <li style="float:left; padding-left: -10px;"> <label class="control-label col-sm-2" for="file01" style="" >첨부파일1 </label></li>
	                   <li style="float:left;  padding-left: -10px;"> <input type="file" class="filestyle" id="files" name="files" data-buttonName="btn-primary" style=" position: relative; top: 4px;"></li>
	      </ul>

	</div>
	<div class="row">
		 <ul style="margin-top: 10px;">
	                  <li style="float:left; padding-left: -10px;"> <label class="control-label col-sm-2" for="file01" style="" >첨부파일2 </label></li>
	                  <li style="float:left;  padding-left: 10px;"> <input type="file" class="filestyle" id="files" name="files" data-buttonName="btn-primary"></li>
	      </ul>

	</div>
	
	<div style="float: left; position: relative; left: 5px; top: 200px;">
		<button type="button" id="listbt" style=" color: #fff; background: #0B3B24; border-radius: 20px; padding: 5px 12px 5px 12px; border: 0;" >목록</button>
	</div>
	<div style="float: left; position: relative; left: 5px; top: 200px;">
		<button type="button" id="cancelbt" style=" color: #fff; background: #E16422; border-radius: 20px; padding: 5px 12px 5px 12px; border: 0;" >취소</button>
	</div>
	<div style="float: left; position: relative; left: 5px; top: 200px;">
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
CKEDITOR.replace('farm_diary_opert_cn'
        , {height: 200                                                 
         });
CKEDITOR.replace('farm_diary_sfms_emrgncy_cn'
        , {height: 200                                                 
         });
CKEDITOR.replace('farm_diary_dgnss'
        , {height: 200                                                 
         });
CKEDITOR.replace('farm_diary_tomo_fx'
        , {height: 200                                                 
         });
$(function(){
    
// 	BootstrapDialog.show({
// 	    title: '알럿창',
// 	    message: '알럿창으로 활용하세요!'
// 	});

	 $('#cancelbt').click(function() {
		$(location).attr('href', '/user/farmingdiary/farmingDiaryList.do?mber_id=${login_mberInfo.mber_id}');
	});
	 
	 $('#listbt').click(function() {
		$(location).attr('href', '/user/farmingdiary/farmingDiaryList.do?mber_id=${login_mberInfo.mber_id}');
	});
	 
	
	 $('form[name=insertForm]').submit(function(){
	      
	      if($('#farm_diary_sj').val() == null || $('#farm_diary_sj').val().trim() == ""){
		         alert("제목을 입력하세요");
		         return false;
		      }
	      if($('#mber_ncnm').val() == null || $('#mber_ncnm').val().trim() == ""){
		         alert("작성자을 입력하세요");
		         return false;
		      }
	      if($('#farm_diary_wethr').val() == null || $('#farm_diary_wethr').val().trim() == ""){
		         alert("날씨을 입력하세요");
		         return false;
		      }
	      
	      $(this).attr('action', '${pageContext.request.contextPath}/user/farmingdiary/insertFarmingDiary.do'); 
	      
	      
// 	      DB로 엔터값 처리해서 저장
	      var str = $('#farm_diary_opert_cn').val();
	      str = str.replace(/(?:\r\n|\r|\n)/g, '<br/>');
	      
	      var atr = $('#farm_diary_sfms_emrgncy_cn').val();
	      atr = atr.replace(/(?:\r\n|\r|\n)/g, '<br/>');
	      
	      var btr = $('#farm_diary_dgnss').val();
	      btr = btr.replace(/(?:\r\n|\r|\n)/g, '<br/>');
	      
	      var ctr = $('#farm_diary_tomo_fx').val();
	      ctr = ctr.replace(/(?:\r\n|\r|\n)/g, '<br/>');
	     
          var farm_diary_sj = $('#farm_diary_sj').val();
	      var mber_id = $('#mber_id').val();
	      var mber_ncnm = $('#mber_ncnm').val();
	      var farm_diary_opert_cn = $('#farm_diary_opert_cn').val(str);
	      var farm_diary_sfms_emrgncy_cn = $('#farm_diary_sfms_emrgncy_cn').val(atr);
	      var farm_diary_dgnss = $('#farm_diary_dgnss').val(btr);
	      var farm_diary_tomo_fx = $('#farm_diary_tomo_fx').val(ctr);
	      var farm_diary_wethr = $('#farm_diary_wethr').val();
	      var farm_diary_make_co = $('#farm_diary_make_co').val();
	      var farm_diary_crops_knd = $('#farm_diary_crops_knd').val();
	      
	      $(this).append('<input type ="hidden" name="mber_id" value="${login_mberInfo.mber_id}"></input>');
	      $(this).append('<input type="hidden" name="mber_ncnm" value="${login_mberInfo.mber_ncnm}"></input>'); //<==form 셀렉팅하기
          $(this).append('<input type ="hidden" name="farm_diary_sj" value="' + farm_diary_sj +'"></input>');
          $(this).append('<input type ="hidden" name="farm_diary_wethr" value="' + farm_diary_wethr +'"></input>');
          $(this).append('<input type ="hidden" name="farm_diary_make_co" value="' + farm_diary_make_co +'"></input>');
          $(this).append('<input type ="hidden" name="farm_diary_crops_knd" value="' + farm_diary_crops_knd +'"></input>');
//           $(this).append('<input type ="hidden" name="farm_diary_tomo_fx" value="' + farm_diary_tomo_fx +'"></input>');
// 	      $(this).append('<textarea type="hidden" name="ctvt_mth_cn" value="'+ ctvt_mth_cn +'" ></textarea>' );

	      return true;
	   });
	
});
</script>

</html>