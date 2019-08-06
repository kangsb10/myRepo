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
<form name="insertForm"  class="form-horizontal"  method="post">
<div id="" style="position: relative; top: 70px;">
	<div class="">
    <section class="property-details">
        <div class="container">
            <div class="row sp-40 spt-40">
                <div class="col-lg-8">
                    <div class="p-ins">
                        <div class="row">
                        <ul style="margin-top: 50px;">
                        	<li style="float:left; padding-left: -10px;"> <img src="/img/view/view_reg.png" width="25px" height="20px" style=" "></li>
                        	<li style="float:left;  padding-left: 10px;"> <label class="" for="farm_in_sj" style="">제 목</label></li>
                       		<li style="float:left; padding-left: 18px;"> <input type="text" class="form-control" name="farm_in_sj" id="farm_in_sj"  placeholder="제목 입력" style="position: relative; top:-5px; width: 100px;  height: 30px;"></li>
                        </ul>
	                     </div>
                        <div class="row">
                        <ul style="margin-top: 10px;">
	                       	<li style="float:left; padding-left: -10px;"> <img src="/img/view/view_reg.png" width="25px" height="20px"></li>
	                       	<li style="float:left;  padding-left: 10px;"> <label class="" for="mber_ncnm" style="">작성자</label></li>
                   			<li style="float:left; padding-left: 12px;"> <input type="text" class="form-control" name="mber_ncnm" id="mber_ncnm"  value="${login_mberInfo.mber_ncnm}" disabled="disabled" style=" position:relative; top: -5px; height: 30px;"></li>
	                    </ul>
	                     </div>
                        <div class="row">
                        <ul style="margin-top: 10px;">
	                       	<li style="float:left; padding-left: -10px;"> <img src="/img/view/view_reg.png" width="25px" height="20px"></li>
	                       	<li style="float:left;  padding-left: 10px;"> <label class="" for="farm_in_gu" style="">구분</label></li>
                   			<li style="float:left; padding-left: 10px;"> 
                   				<select style="float:left; padding-left: 20px;" id="farm_in_gu" name="farm_in_gu"> 
                   					<c:forEach items="${guNM }" var="guNM">
										<option value="${guNM.farm_in_nm }">${guNM.farm_in_nm }</option>
									</c:forEach>
								</select>
                   			</li>
	                    </ul>
						</div>
						<div class="row">
							<ul style="margin-top: 10px;">
								<li style="float:left; padding-left: -10px;"> <img src="/img/view/view_reg.png" width="25px" height="20px" style=" "></li>
								<li style="float:left;  padding-left: 10px;"> <label class="" for="farm_in_seed" style="">씨 앗</label></li>
								<li style="float:left; padding-left: 18px;"> <input type="text" class="form-control" name="farm_in_seed" id="farm_in_seed"  placeholder="씨앗을 입력하세요" style="position: relative; top:-5px; width: 130px;  height: 30px;">
									<label>씨앗개수 : ${login_mberInfo.mber_seed }</label>
								</li>
							</ul>
						</div>
                        <div class="row">
                            <div class="col-lg-12">
                                <div style="border-top : 1px solid #585858; "></div>
                                <div style=" position: relative; top: 5px;">
                                    <textarea id="farm_in_cn" name="farm_in_cn"></textarea>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12">
                                <div style="border-top : 1px solid #585858; "></div>
                                <div style=" position: relative; top: 5px;">
                                    <input type="text" class="farm_in_tag"  id="farm_in_tag" name="farm_in_tag" placeholder="해시태그를 입력하세요">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
	</div>
	<div style="float: left; position: absolute; left: 10px; top: 600px;">
		<button type="button" id="listbt" style=" color: #fff; background: #0B3B24; border-radius: 20px; padding: 5px 12px 5px 12px; border: 0;" >목록</button>
	</div>
	<div style="float: left; position: absolute; left: 60px; top: 600px;">
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
<script type="text/javascript">

CKEDITOR.replace('farm_in_cn'
        , {height: 200                                                 
         });

$(function(){
	
	$('#farm_in_seed').val('${nongupinInfo.farm_in_seed }');
	$('#farm_in_sj').val('${nongupinInfo.farm_in_sj }');
	$('#farm_in_tag').val('${nongupinInfo.farm_in_tag }');
	$('#farm_in_cn').val('${nongupinInfo.farm_in_cn }');
	
	
	$(document).ready(function() {

	    $('#farm_in_cn').on('keyup', function() {
	        if($(this).val().length > 2000) {
	        	alert("글자수는 영문2000, 한글1000자로 제한됩니다.!"); 
	            $(this).val($(this).val().substring(0, 2000));
	        }
	    });

	});
	
	// 보유 씨앗만큼 입력, 숫자만입력
	$('#farm_in_seed').on('keyup', function() { 
	    if (/\D/.test(this.value)) { 
	        this.value = this.value.replace(/\D/g, '') 
	        alert('숫자만 입력가능합니다.'); 
	    } 
	  if (this.value > ${login_mberInfo.mber_seed }) { 
	      this.value = ${login_mberInfo.mber_seed }; 
	      alert('보유씨앗까지만 가능합니다.'); 
	  } 
	});
	
	
	
// 	BootstrapDialog.show({
// 	    title: '알럿창',
// 	    message: '알럿창으로 활용하세요!'
// 	});

	 $('#listbt').click(function() {
		$(location).attr('href', 'javascript:history.back()');
	});
	
	 $('form[name=insertForm]').submit(function(){
	      var flag = true;
	      
	      if($('#farm_in_sj').val() == null || $('#farm_in_sj').val().trim() == ""){
		         alert("제목을 입력하세요");
		         return false;
		      }
	      
	      $(this).attr('action', '/user/nongupin/updateNongupin.do?farm_in_no=${nongupinInfo.farm_in_no}'); 
	      
	      
// 	      DB로 엔터값 처리해서 저장
// 	      var str = $('#farm_in_cn').val();
// 	      str = str.replace(/(?:\r\n|\r|\n)/g, '<br/>');
	     
	      
//           var bbs_sj = $('#bbs_sj').val();
	      var mber_ncnm = $('#mber_ncnm').val();
// 	      var farm_in_cn = $('#farm_in_cn').val(str);
	      
// 	      $(this).append('<input type="hidden" name="bbs_creat_no" value="${cafeInfo.bbs_creat_no}"></input>'); //<==form 셀렉팅하기
          $(this).append('<input type ="hidden" name="mber_ncnm" value="${login_mberInfo.mber_ncnm}"></input>');
// 	      $(this).append('<textarea type="hidden" name="ctvt_mth_cn" value="'+ ctvt_mth_cn +'" ></textarea>' );

	      return flag;
	   });
	
});
</script>

</html>