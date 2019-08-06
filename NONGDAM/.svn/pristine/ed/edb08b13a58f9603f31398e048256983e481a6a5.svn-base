<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>농약비료이런거농기구 팦ㄹ거 등록</title>
<!-- 이미지 슬라이드 사이즈 조정 -->
<style type="text/css">
.carousel{
	width:200px;
    height:150px;
    margin-left: 200px;
}
.carousel-inner > .item > img{
    width:200px;
    height:150px;
}

body {
   background:
      url('${pageContext.request.contextPath }/img/background.jpg')
      no-repeat center center fixed;
   -webkit-background-size: cover;
   -moz-background-size: cover;
   -o-background-size: cover;
   background-size: cover;
}
</style>
</head>
<body>
<br/>
<br/>
<br/>
<br/>
<!--goods_id
lprod_gu
buyer_id
goods_nm
goods_pc
goods_invntry
goods_dc
goods_delete  -->
<form name="insertForm"  class="form-horizontal" role="form" method="POST" enctype="multipart/form-data">
	<div class="form-group">
		<label class="control-label col-sm-2" for="goods_id">상품코드</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="goods_id"  placeholder="상품코드">
		</div>
		<button class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" id="search_goods_id" type="button" >상품코드검색</button>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="mber_ncnm">작성자:</label>
		<div class="col-sm-10"> 
			<input type="text" class="form-control" id="mber_ncnm"  placeholder="대화명 입력...">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="ctvt_mth_cn">내용:</label>
		<div class="col-sm-10"> 
				<textarea rows="20" cols="95" class="ctvt_mth_cn"  id="ctvt_mth_cn" placeholder="내용입력..."></textarea>
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="file01">첨부파일1:</label>
		<div class="col-sm-10">
			 <input type="file" class="filestyle" id="files" name="files" data-buttonName="btn-primary">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="file02">첨부파일2:</label>
		<div class="col-sm-10">
			 <input type="file" class="filestyle" id="files" name="files" data-buttonName="btn-primary">
		</div>
	</div>
	<div class="form-group"> 
		<div class="col-sm-offset-2 col-sm-10">
			<button type="submit" class="btn btn-info" style="float: right">등록</button>
			<button type="button" class="btn btn-danger" style="float: right" id="cancelbt">취소</button>
			<button type="button" class="btn btn-primary" style="float: right" id="listbt">목록</button>
		</div>
	</div>
</form>
</body>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type='text/javascript' src='${pageContext.request.contextPath }/js/validation.js'></script>
<script>
$(function(){
    
// 	BootstrapDialog.show({
// 	    title: '알럿창',
// 	    message: '알럿창으로 활용하세요!'
// 	});

	 $('#cancelbt').click(function() {
		$(location).attr('href', '/user/cultivationmethod/cultivationMethodList.do');
	});
	 
	 $('#listbt').click(function() {
		$(location).attr('href', '/user/cultivationmethod/cultivationMethodList.do');
	});
	 
	
	 $('form[name=insertForm]').submit(function(){
	      var flag = true;
	      $('#files').each(function(index, inputTag){
	    	  if(!/\.(jpg|jpeg|gif|png)/.test($(inputTag).val().toLowerCase())){
					alert('이미지 파일만 업로드할 수 있어요.');
					flag = false;
				}
	      });
	      
	      
	      if($('#ctvt_mth_sj').val() == null || $('#ctvt_mth_sj').val().trim() == ""){
		         alert("제목을 입력하세요");
		         return false;
		      }
	      if($('#mber_ncnm').val() == null || $('#mber_ncnm').val().trim() == ""){
		         alert("작성자을 입력하세요");
		         return false;
		      }
	      if($('#ctvt_mth_cn').val() == null || $('#ctvt_mth_cn').val().trim() == ""){
		         alert("내용을 입력하세요");
		         return false;
		      }
	      
	      $(this).attr('action', '${pageContext.request.contextPath}/user/cultivationmethod/insertCultivationMethod.do'); 
	      
          var ctvt_mth_sj = $('#ctvt_mth_sj').val();
	      var mber_ncnm = $('#mber_ncnm').val();
	      var ctvt_mth_cn = $('#ctvt_mth_cn').val();
	      
// 	      $(this).append('<input type="hidden" name="mber_ncnm" value="${LOGIN_MEMBERINFO.mem_id}"></input>'); //<==form 셀렉팅하기
          $(this).append('<input type ="hidden" name="ctvt_mth_sj" value="' + ctvt_mth_sj +'"></input>');
	      $(this).append('<input type="hidden" name="mber_ncnm" value="'+ mber_ncnm +'"></input>'); //<==form 셀렉팅하기
	      $(this).append('<input type="hidden" name="ctvt_mth_cn" value="'+ ctvt_mth_cn +'" ></input>' );

	      return flag;
	   });
	
});
</script>
</html>