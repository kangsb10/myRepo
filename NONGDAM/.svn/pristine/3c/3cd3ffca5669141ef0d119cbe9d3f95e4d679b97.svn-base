<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 목록</title>
<style type="text/css">
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
<div id="cultlvationMethodList_content">
	<div class="panel panel-blue">
    	<div class="panel-heading">공지사항</div>
		<table class="table table-bordered table-hover">
			<thead>
				<tr>
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
							<td>${noticeInfo.notice_input_de}</td>
							<td>${noticeInfo.notice_hit}</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
			</tbody>
		</table>
		${pagingHtmls }
	</div>
</div>
<div >
<form action="/user/notice/noticeList.do" method="post" class="form-inline">
		<input name="search_keyword" type="text" placeholder="검색어 입력..." class="form-control" />
		<select class="form-control" name="search_keycode" >
			<option value="TOTAL">전체</option>
			<option value="TITLE">제목</option>
			<option value="CONTENT">내용</option>
		</select>
		<div col-sm-10>
	    <button type="submit" class="btn btn-primary form-control">검색</button>
	    </div>
</form>
</div>	
</body>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
$(function(){
	
	$("#noticeTBL tr").click(function(){
		var notice_no = $(this).find("td:eq(0) input").val();
		$(location).attr("href", "${pageContext.request.contextPath}/user/notice/noticeView.do?notice_no=" + notice_no);		
	});
});
</script>
</html>