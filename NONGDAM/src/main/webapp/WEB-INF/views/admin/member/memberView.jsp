<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 정보</title>
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

<form name="updateForm" class="form-horizontal" role="form" action="${pageContext.request.contextPath }/admin/member/updateMemberForm.do" method="post">
	<div class="form-group">
		<label class="control-label col-sm-2" for="mber_id">아이디</label>
				<label id="mber_id" name="mber_id" class="mber_id">${memberInfo.mber_id }</label>
				<input type="hidden" value="${memberInfo.mber_id }" name="mber_id">
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="mber_mbtlnum">핸드폰번호:</label>
			<label id="mber_mbtlnum" name="mber_mbtlnum" class="mber_mbtlnum">${memberInfo.mber_mbtlnum }</label>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="mber_nm">이름:</label>
			<label id="mber_nm" name="mber_nm" class="mber_nm">${memberInfo.mber_nm }</label>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="mber_ncnm">닉네임:</label>
			<label id="mber_ncnm" name="mber_ncnm" class="mber_ncnm">${memberInfo.mber_ncnm }</label>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="mber_email">메일:</label>
			<label id="mber_email" name="mber_email" class="mber_email">${memberInfo.mber_email }</label>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="mber_zip">주소:</label>
			<label id="mber_zip" name="mber_zip" class="mber_zip">${memberInfo.mber_zip }</label>
			<label id="mber_bass_adres" name="mber_bass_adres" class="mber_bass_adres">${memberInfo.mber_bass_adres }</label>
			<label id="mber_detail_adres" name="mber_detail_adres" class="mber_detail_adres">${memberInfo.mber_detail_adres }</label>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="mber_farmng_adres">농장주소:</label>
			<label id="mber_farmng_adres" name="mber_farmng_adres" class="mber_farmng_adres">${memberInfo.mber_farmng_adres }</label>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="mber_seed">씨앗:</label>
			<label id="mber_seed" name="mber_seed" class="mber_seed">${memberInfo.mber_seed }</label>
	</div>
	
	<div class="form-group"> 
		<div class="col-sm-offset-2 col-sm-10">
			<button type="button" class="btn btn-info" id="listBt">목록</button>
			<button type="button" class="btn btn-info" id="deleteBt">삭제</button>
			<button type="submit" class="btn btn-info">수정</button>
		</div>
	</div>
</form>
</body>
<script type="text/javascript">
$(function(){
	$("#listBt").click(function(){
		$(location).attr("href", "${pageContext.request.contextPath}/admin/member/memberList.do");		
	});
	
	
});
</script>
</html>