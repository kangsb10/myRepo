<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>재배방식 등록</title>
<!-- 이미지 슬라이드 사이즈 조정 -->
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
  <link href="https://fonts.googleapis.com/css?family=Do+Hyeon&display=swap&subset=korean" rel="stylesheet">
	<style>
      h1,p,span,a,div,option,input,td {
        font-family: 'Do Hyeon', sans-serif;
         color: #585858;
      }
      
      h1 {
        font-weight: 400;
         font-size: 25px;
         color: #FEEACC;
      }
      
      
      span,a {
        font-weight: 300;
         font-size: 20px;
         color: #FBD9A7;
      }
      
      
      
      p {
        font-weight: 200;
        font-size: 15px;
        color: #FFFFFF;
      }
      
     option,input {
        color: #346D4E;
      }
      
      div#a, div#b {
        font-weight: 200;
        font-size: 40px;
        color: #FFFFFF;
      }
      
      th {
      text-align: center;
      }
      
      
    </style>
</head>
<body>
<br/>
<br/>
<br/>
<br/>
<form name="insertForm"  class="form-horizontal" role="form" method="POST" enctype="multipart/form-data" 
		action="${pageContext.request.contextPath}/admin/notice/insertnotice.do">
	<div class="form-group">
		<label class="control-label col-sm-2" for="notice_sj">제목:</label>
		<div class="col-sm-10">
			<input type="text" class="notice_sj" id="notice_sj" name="notice_sj" placeholder="제목 입력...">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="mngr_id">작성자:</label>
		<div class="col-sm-10"> 
			<input type="text" class="form-control" id="mngr_id" name="mngr_id" value="${login_mberInfo.mngr_id}" readonly="readonly">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="notice_cn">내용:</label>
		<div class="col-sm-10"> 
				<textarea rows="20" cols="95" class="notice_cn"  id="notice_cn" name="notice_cn" placeholder="내용입력..." ></textarea>
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
	 CKEDITOR.replace('notice_cn'
		        , {height: 200                                                 
		         });
	$('#cancelbt').click(function(){
		$(location).attr('href', '/admin/notice/noticeList.do');
	});
	$('#listbt').click(function(){
		$(location).attr('href', '/admin/notice/noticeList.do');
	});
	
	$('form[name=insertForm]').submit(function(){
// 		var flag = true;
// 	      $('#files').each(function(index, inputTag){
// 	    	  if(!/\.(jpg|jpeg|gif|png)/.test($(inputTag).val().toLowerCase())){
// 					alert('이미지 파일만 업로드할 수 있어요.');
// 					flag = false;
// 				}
// 	      });
	      var flag = true;
// 	      $('#files').each(function(index, inputTag){
// 	    	  if(!/\.(jpg|jpeg|gif|png)/.test($(inputTag).val().toLowerCase())){
// 					alert('이미지 파일만 업로드할 수 있어요.');
// 					flag = false;
// 				}
// 	      });
	      if($('#notice_sj').val() == null || $('#notice_sj').val().trim() == ""){
		         alert("제목을 입력하세요");
		         return false;
		  }
	      var str = $('#notice_cn').val();
	      str = str.replace(/(?:\r\n|\r|\n)/g, '<br/>');
	      $('#notice_cn').val(str);
	      return flag;
	});
	
});

</script>
</html>