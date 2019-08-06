<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시글 등록</title>
	<!-- Google web font 
   ================================================== -->	
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
      }
      
      th {
      text-align: center;
      }
      
      
    </style>
</head>
<body style="">
<!-- <body style="overflow-x: hidden; "> -->
<!-- 카패 메인 사진 -->
<div class='' style=" height: 200px">
        <div class="" style="width: 100px; margin: 0 auto; ">
            <div class="border no-right-border" id="a" style="color:white; font-size: 20px; width: 200px; top: 100px; position: relative; width: 100%;" >${communityInfo.cmmnty_cafe_nm }</div>
        </div>
        <!-- 이미지 클릭하면 카페 메인 들어오게 onclick에 경로 넣기 -->
        <div class="img-src" style=" height: 200px; " onclick="#"><img style=" height: 200px; " src="/files/${communityInfo.itemss[0].cmmnty_file_save_name}"/></div> 
   </div>


<!-- 아래 글 콘텐츠 -->
<div class="" style="font-size: 30px;" ></div>
	<div class="" style="">
	 <c:choose>
	 	<c:when test="${boardInfo.bbs_creat_sj eq null}">
    		<div class="" style=" left:20px; font-size: 20px; width: 100%; color:#0B3B24; position: relative; top: 30px; text-align: left;" >새글</div>
	 	</c:when>
	 	<c:when test="${boardInfo.bbs_creat_sj ne null}">
    		<div class="" style=" left:20px; font-size: 20px; width: 100%; color:#0B3B24; position: relative; top: 30px; text-align: left;" >${boardInfo.bbs_creat_sj }게시판</div>
	 	</c:when>
	 </c:choose>
		<table class="" style="position: relative; top: 30px; left: 20px; width: 80%;">
			<thead >
				<tr style="border-bottom: 1px solid #848484; text-align: center; ">
					
<!-- 					<th style="display:none;"></th> -->
<!-- 					<th scope="col" width="50%">제목</th> -->
<!-- 					<th scope="col" width="15%">작성자</th> -->
<!-- 					<th scope="col" width="10%">작성일</th> -->
<!-- 					<th scope="col" width="15%">조회수</th> -->
					<th style="display:none;"></th>
					<th scope="col" width="50%" >제목</th>
					<th scope="col" width="15%" >작성자</th>
					<th scope="col" >작성일</th>
					<th scope="col" >조회수</th>
				</tr>
			</thead>
			<tbody id="boardTBL" >
			<c:choose>
				<c:when test="${empty cafeSelList}">
					<tr>
                     	<td colspan="5" align="center"><font color="red">등록된 게시글이 없습니다.</font></td>
                  	</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${cafeSelList }" var="cafeSelList">
						<tr>
							<td style="display:none;"><input type="hidden" value="${cafeSelList.bbs_no }"></td>
							<td>${cafeSelList.bbs_sj }</td>
							<td>${cafeSelList.cafe_mber_ncnm }</td>
							<td>${cafeSelList.bbs_input_de }</td>
							<td>${cafeSelList.bbs_rdcnt }</td>
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
	<div style="position: relative; top: 30px; left: -30px;">
				<form action="/user/cm/cmaddr/${communityInfo.cmmnty_cafe_adres }.do?cmmnty_no=${communityInfo.cmmnty_no }&cafe_mber_id=${login_mberInfo.mber_id}" method="post"
					class="form-inline">
					
					<ul style="height: 70px;">
						<c:if test="${cafeName.cafe_mber_id ne login_mberInfo.mber_id }">
						<li style="float: left; padding-right: 10px;">
							<button type="button" id="joinBtn" style=" color: #fff; background: #E16422; border-radius: 20px; padding: 5px 12px 5px 12px; border: 0;" >가입</button>
						</li>
						</c:if>
						<li style="float: left; padding-right: 10px;">
							<input type="button" id="insBtn" style=" color: #fff; background: #E16422; border-radius: 20px; padding: 5px 12px 5px 12px; border: 0;" value="글 등록" >
						</li>
						<li style="float: left;">
						<input type="text"
							id="search_keyword" name="search_keyword" placeholder="검색어 입력"
							class="form-control search-input"
							style="height: 32px; width: 150px; border-radius: 0 0 0 0; border-color: #346D4E;">
						</li>
						<li style="float: left; border-radius: 0 0 0 0;"><select
							class="form-control" name="search_keycode"
							style="height: 32px; width: 100%; border: 1px solid #c2c2c2; border-radius: 0 0 0 0; border-color: #346D4E;">
								<option selected="selected">검색조건</option>
								<option value="TOTAL">전체</option>
								<option value="TITLE">제목</option>
								<option value="WRITER">작성자</option>
						</select></li>
						<li style="float: left; width: 24px; background-color: #a9a9f9;">
							<span class="input-group-btn">
								<button type="submit" class=""
									style="color: #fff; background: #346D4E; height: 32px; width: 100%;">
									<i class="fa fa-search" style="height: 24px; width: 24px;"></i>
								</button>
							</span>
						</li>
					</ul>
				</form>
				<c:if test="${communityInfo.mber_id eq login_mberInfo.mber_id }">
						<input type="button" id="cafeUpdBtn" style=" color: #fff; background: #E16422; border-radius: 20px; padding: 5px 12px 5px 12px; border: 0; position: relative; left:-20px; top:-40px;" value="카페 수정" >
						<input type="button" id="cafeDelBtn" style=" color: #fff; background: #E16422; border-radius: 20px; padding: 5px 12px 5px 12px; border: 0; position: relative; left:-10px; top:-40px;" value="카페 삭제" >
						<c:if test="${not empty cafeBoList }">
							<input type="button" id="boardUpdBtn" style=" color: #fff; background: #E16422; border-radius: 20px; padding: 5px 12px 5px 12px; border: 0; position: relative; left: 0px; top:-40px;" value="게시판 수정" >
							<input type="button" id="boardDelBtn" style=" color: #fff; background: #E16422; border-radius: 20px; padding: 5px 12px 5px 12px; border: 0; position: relative; left: 10px; top:-40px;" value="게시판 삭제" >
						</c:if>
				</c:if>
			</div>
</div>

</body>
<!-- Javascript 
================================================== -->
<script src="/js/main/jquery.js"></script>
<script src="/js/main/wow.min.js"></script>
<script src="/js/main/custom.js"></script>
<script type="text/javascript">
$(function(){
	
	// 카페 가입
	$('#joinBtn').click(function(){
		$(location).attr('href', '/user/cm/cafeMberForm.do?cmmnty_no=${communityInfo.cmmnty_no}&bbs_creat_no=${boardInfo.bbs_creat_no }');
	});
	// 게시판 삭제
	$('#boardDelBtn').click(function(){
		$(location).attr('href', '/user/cm/deleteCafebo.do?cmmnty_no=${communityInfo.cmmnty_no}&bbs_creat_no=${boardInfo.bbs_creat_no }&cmmnty_cafe_adres=${communityInfo.cmmnty_cafe_adres }&cafe_mber_id=${login_mberInfo.mber_id}');
	});
	// 게시판 수정
	$('#boardUpdBtn').click(function(){
		$(location).attr('href', '/user/cm/updateCafeboForm.do?cmmnty_no=${communityInfo.cmmnty_no}&bbs_creat_no=${boardInfo.bbs_creat_no }&cmmnty_cafe_adres=${communityInfo.cmmnty_cafe_adres }&cafe_mber_id=${login_mberInfo.mber_id}');
	});
	// 카페 삭제
	$('#cafeDelBtn').click(function(){
		$(location).attr('href', '/user/cm/deleteCafe.do?cmmnty_no=${communityInfo.cmmnty_no}');
	});
	// 카페 수정
	$('#cafeUpdBtn').click(function(){
		$(location).attr('href', '/user/cm/updateCafeForm.do?cmmnty_no=${communityInfo.cmmnty_no}');
	});
	// 글 쓰기
	$('#insBtn').click(function(){
		$(location).attr('href', '/user/cm/cafeNewboardForm.do?bbs_creat_no=${boardInfo.bbs_creat_no }&cmmnty_no=${communityInfo.cmmnty_no}&cafe_mber_id=${login_mberInfo.mber_id}');
	});
	
	$('#boardTBL tr').click(function(){
		var bbs_no = $(this).find('td:eq(0) input').val();
		$(location).attr('href','/user/cm/cafeListView.do?cafe_mber_id=${login_mberInfo.mber_id}&bbs_creat_no=${boardInfo.bbs_creat_no }&cmmnty_no=${communityInfo.cmmnty_no}&bbs_no=' + bbs_no);
	});
	
	
});
</script>

</html>