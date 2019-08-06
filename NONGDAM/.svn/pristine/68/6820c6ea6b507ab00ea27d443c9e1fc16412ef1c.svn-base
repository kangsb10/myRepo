<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<!--
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=Edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="keywords" content="">
	<meta name="description" content="">



	<!-- Bootstrap CSS
   ================================================== -->
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


<div id="" style="position: relative; top: 100px;">
	<div class="" >
    	<div class="" style="font-size: 30px; color:#0B3B24;" >회원정보</div>
		<table class="" style="position: relative; top: 20px; ">
			<thead>
				<tr style="border-bottom: 1px solid #848484; text-align: center; ">
					<th scope="col" width="15%">아이디</th>
					<th scope="col" width="15%">이름</th>
					<th scope="col" width="25">닉네임</th>
					<th scope="col" width="20%">핸드폰번호</th>
					<th scope="col" width="20%">이메일</th>
				</tr>
			</thead>
			<tbody id="noticeTBL">
			<c:choose>
				<c:when test="${empty memberList }">
					<tr>
						<td colspan="5" align="center"><font color="red">등록된 게시글이 없습니다.</font></td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${memberList }" var="memberInfo">
						<tr>
							<td><input type="hidden" value="${memberInfo.mber_id}">${memberInfo.mber_id}</td>
							<td>${memberInfo.mber_nm}</td>
							<td>${memberInfo.mber_ncnm}</td>
							<td>${memberInfo.mber_mbtlnum}</td>
							<td>${memberInfo.mber_email}</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
			</tbody>
		</table>
		
		<div style="position: relative; top: 30px;">
		${pagingHtmls }
		</div>
	</div>
</div>
<div style="position:absolute; top: 570px;" >
<form action="/admin/member/memberList.do" method="post" class="form-inline">
			<ul style=" height: 100px;">
                    <li style="float: left;  ">
                     <input type="text" id="search_keyword" name="search_keyword" placeholder="검색어 입력" class="form-control search-input" style="width: 150px; border-radius: 0 0 0 0; border-color:#346D4E; ">
                    </li>
         			  <li style="float: left;  border-radius: 0 0 0 0; " >
                      <select class="form-control" name="search_keycode"
                           style="width: 105px; height: 34px; border: 1px solid #c2c2c2; border-radius: 0 0 0 0; border-color: #346D4E; ">
                        <option value="TOTAL">전체</option>
					   <option value="ID">아이디</option>
				   	   <option value="NAME">이름</option>
				   	   <option value="NICKNAME">닉네임</option>
                    	</select>
                    </li>
                    <li style="float: left; width: 52px; background-color: #a9a9f9; ">
                     <span class="input-group-btn">
                     <button type="submit" class="btn search-button" style=" color: #fff; background: #346D4E; height: 34px"><i class="fa fa-search"></i></button>
                     </span>
                    </li>
			</ul>
</form>
</div>	
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
$(function(){
	$("#noticeTBL tr").click(function(){
		var mber_id = $(this).find("td:eq(0) input").val();
		$(location).attr("href", "${pageContext.request.contextPath}/admin/member/memberView.do?mber_id=" + mber_id);		
	});
});
</script>
</html>