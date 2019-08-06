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

<form name="updateForm" class="form-horizontal" role="form" action="${pageContext.request.contextPath }/admin/notice/updateNoticeForm.do" method="post">
	<div class="form-group">
		<label class="control-label col-sm-2" for="notice_no">번호:</label>
<!-- 		<div class="col-sm-10"> -->
<%-- 			<input type="text" class="form-control" id="ctvt_mth_no" name="ctvt_mth_no" value='${cultivationMethodInfo.ctvt_mth_no}' > --%>
				<label id="rnum" name="rnum" class="rnum">${noticeInfo.rnum}</label>
				<input type="hidden" value="${noticeInfo.notice_no}" id="notice_no" name="notice_no">
<!-- 		</div> -->
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="notice_sj">제목:</label>
<!-- 		<div class="col-sm-10"> -->
<%-- 			<input type="text" class="form-control" id="ctvt_mth_sj" name="ctvt_mth_sj" value='${cultivationMethodInfo.ctvt_mth_sj}'> --%>
				<label id="notice_sj" name="notice_sj" class="notice_sj">${noticeInfo.notice_sj}</label>
<!-- 		</div> -->
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="mngr_id">작성자:</label>
			<label id="mngr_id" name="mngr_id" class="mngr_id">${noticeInfo.mngr_id}</label>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="notice_cn" >내용</label>
		<div class="col-sm-10"> 
<%-- 			<input type="text" class="form-control" id="ctvt_mth_cn" name="ctvt_mth_cn" value='${cultivationMethodInfo.ctvt_mth_cn}'> --%>
				<label id="notice_cn" name="notice_cn" class="notice_cn" >${noticeInfo.notice_cn}</label>
		</div>
	</div>
	
	<div class="form-group">
			<div id="myCarousel">
				<label class="control-label col-sm-2" for="ctvt_mth_cn">첨부파일:</label>
			</div>
				<c:if test="${!empty noticeInfo.items }">
							<c:forEach items="${noticeInfo.items }" var="fileItem" varStatus="stat">
								<img src="/files/${fileItem.cmmnty_file_save_name }" alt="pic1" style="width:150px;height:150px;">
							</c:forEach>
				</c:if>
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
<script type='text/javascript' src='http://code.jquery.com/jquery-latest.js'> </script>
<script type="text/javascript">
 $(function(){
 	
	
	$('#listBt').click(function() {
			$(location).attr('href', '/admin/notice/noticeList.do');
	});
	$('#deleteBt').click(function() {
			$(location).attr('href', '/admin/notice/deletenotice.do?notice_no=${noticeInfo.notice_no}');
	});
 });

</script>
</html>