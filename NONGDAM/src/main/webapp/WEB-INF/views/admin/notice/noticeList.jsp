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
    	<div class="" style="font-size: 30px; color:#0B3B24;" >공지사항</div>
		<table class="" style="position: relative; top: 20px; ">
			<thead>
				<tr style="border-bottom: 1px solid #848484; text-align: center; ">
					<th scope="col" width="10%">번호</th>
					<th scope="col" width="50%">제목</th>
					<th scope="col" width="15%">작성자</th>
					<th scope="col" width="10%">작성일</th>
					<th scope="col" width="15%">조회수</th>
				</tr>
			</thead>
			<tbody id="noticeTBL">
				<c:choose>
					<c:when test="${empty noticeList }">
						<tr>
							<td colspan="5" align="center"><font color="red">등록된 게시글이 없습니다.</font></td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${noticeList }" var="noticeInfo">
							<tr>
								<td><input type="hidden" value="${noticeInfo.notice_no}">${noticeInfo.rnum}</td>
								<td>${noticeInfo.notice_sj}</td>
								<td>${noticeInfo.mngr_id}</td>
								<td style="font-size: 5px;">${noticeInfo.notice_input_de}</td>
								<td>${noticeInfo.notice_hit}</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
		<div style="position:relative; top: 20px;" >
		${pagingHtmls }
		</div>
</div>
<div style="position:absolute; top: 750px;" >
<form action="/admin/notice/noticeList.do" method="post" class="form-inline">
			<ul style=" height: 100px;">
                    <li style="float: left;  ">
                     <input type="text" id="search_keyword" name="search_keyword" placeholder="검색어 입력" class="form-control search-input" style="width: 150px; border-radius: 0 0 0 0; border-color:#346D4E; ">
                    </li>
         			  <li style="float: left;  border-radius: 0 0 0 0; " >
                      <select class="form-control" name="search_keycode"
                           style="width: 105px; height: 34px; border: 1px solid #c2c2c2; border-radius: 0 0 0 0; border-color: #346D4E; ">
                        <option>검색조건</option>
                        <option value="TOTAL">전체</option>
					   <option value="TITLE">제목</option>
				   	   <option value="CONTENT">내용</option>
                    	</select>
                    </li>
                    <li style="float: left; width: 52px; background-color: #a9a9f9; ">
                     <span class="input-group-btn">
                     <button type="submit" class="btn search-button" style=" color: #fff; background: #346D4E; height: 34px"><i class="fa fa-search"></i></button>
                     </span>
                    </li>
                    <button type="button" id="insertBt" class="btn search-button" style=" color: #fff; background: #346D4E; height: 34px">등록</button>
			</ul>
</form>
</div>	
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
$(function(){
	
	
	$("#noticeTBL tr").click(function(){
		var notice_no = $(this).find("td:eq(0) input").val();
		var rnum = $(this).find("td:eq(0)").text();
		var search_keyword = encodeURIComponent('${search_keyword}');
		var search_keycode = '${search_keycode}';
		var currentPage = '${currentPage}';
		$(location).attr("href", "${pageContext.request.contextPath}/admin/notice/noticeView.do?notice_no=" + notice_no+"&rnum="+ rnum + '&search_keyword=' + search_keyword + '&search_keycode=' +search_keycode+ '&currentPage=' + currentPage);		
		
	});
	$("#insertBt").click(function(){
		$(location).attr("href", "${pageContext.request.contextPath}/admin/notice/noticeForm.do");		
	});
	
	
});
</script>
</html>