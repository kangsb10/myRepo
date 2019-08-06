<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE html>
<html lang="zxx" class="no-js">
<body onload="document.commnunity.cmmnty_cafe_nm.focus();>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/community/themify-icons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/community/owl.carousel.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/community/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/community/responsive.css">
    

    
    <!-- Start blog-lists section -->
    <section class="blog-lists-section section-gap-full">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
<!-- 					<div class="single-widget search-widget"> -->
<!-- 						<div class="sidebar-form"> -->
<!-- 							<form action="#" class="relative"> -->
<!-- 								<input type="text" placeholder="Search" -->
<!-- 									onfocus="this.placeholder=''" -->
<!-- 									onblur="this.placeholder='Search'"> -->
<!-- 								<button type="submit"> -->
<!-- 									<i class="ti-search"></i> -->
<!-- 								</button> -->
<!-- 							</form> -->
<!-- 						</div> -->
<!-- 					</div> -->
					<div class="comment-form">
                        <h3>카페 만들기</h3>
                        <form name="commnunity" action="${pageContext.request.contextPath}/user/cm/cmInsert.do" method="post" enctype="multipart/form-data">
                        	<div class="row form-col-wrap">
                             	 <label>카페이름</label><input type="text" id="cmmnty_cafe_nm" name="cmmnty_cafe_nm" class="form-control" placeholder="카페이름"  onfocus="this.placeholder=''" onblur="this.placeholder='카페이름'">
                                	<label>카페주소</label><input type="text" id="cmmnty_cafe_adres" name="cmmnty_cafe_adres" class="form-control" placeholder="카페주소"  onfocus="this.placeholder=''" onblur="this.placeholder='카페주소'">
                        	</div>
                        	<div class="row">
								 <ul style="margin-top: 10px;">
						      		<li style="float:left; padding-left: -10px;"> <label class="control-label col-sm-2" for="file01" style="" >첨부파일 </label></li>
						      		<li style="float:left;  padding-left: -10px;"> <input type="file" class="filestyle" id="files" name="files" data-buttonName="btn-primary" style=" position: relative; top: 4px;"></li>
							     </ul>
							</div>
                        	<div class="col-lg-2 form-cols">
                        	<label>중분류</label>
								<select id="gu1" onchange="itemChange()">
									<c:forEach items="${guMN }" var="guMN">
										<option value="${guMN.ctgry_mn }">${guMN.ctgry_mn }</option>
									</c:forEach>
								</select>
							</div>
                        	<div class="col-lg-2 form-cols">
                        	<label>소분류</label>
								<select id="ctgry_gu" name="ctgry_gu">
								<option label="선택"/>
								</select>
							</div>
                       	 	<div class="row">
                       	 	<div class="container">&nbsp;</div>
                        		<label>카페설명</label><textarea name="cmmnty_cafeinfo" id="cmmnty_cafeinfo" placeholder="카페설명" ></textarea>
                                <input type="submit" class="btn btn-primary" value="개설하기"></input>
                        	</div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- End blog-lists section -->

    

    <div class="scroll-top">
        <i class="ti-angle-up"></i>
    </div>

</body>
<script type="text/javascript">
CKEDITOR.replace('cmmnty_cafeinfo'
        , {height: 200                                                 
         });
// 분류
function itemChange(){
	
	$.ajax({
		type : 'POST',
		url : '${pageContext.request.contextPath}/user/cm/guList.do',
		dataType : 'json',
		data : { ctgry_mn : $('select[id=gu1]').val() },
		success : function(data){
			 console.log(data.data);
			 if (data.data.length > 0) {
                 $ ('#ctgry_gu').find ('option').remove ();
                 for (var _idx = 0; _idx < data.data.length; _idx++) {
                   $ ('#ctgry_gu').append ( "<option value='"+data.data[_idx].ctgry_nm+"'>" + data.data[_idx].ctgry_nm + '</option>' );
                 }
             } else {
				$('#ctgry_gu').find('option').remove();
				$('#ctgry_gu').append("<option value=''>선택하세요</option>");
			}
		}
	});

}

$(function(){

	$('form').submit(function(){
	//	$(this).append('<input type="hidden" name="mber_id" value="${memberInfo.getMem_id()}"/>');
		$(this).append('<input type="hidden" name="mber_id" value="${login_mberInfo.mber_id}"/>');
		$(this).append('<input type="hidden" name="cafe_mber_id" value="${login_mberInfo.mber_id}"/>');
		$(this).append('<input type="hidden" name="cafe_mber_ncnm" value="관리자"/>');
		
		if($('#cmmnty_cafe_nm').val() == null || $('#cmmnty_cafe_nm').val().trim() == ""){
	         alert("제목을 입력하세요");
	         return false;
	      }
     	if($('#cmmnty_cafe_adres').val() == null || $('#cmmnty_cafe_adres').val().trim() == ""){
	         alert("주소를 입력하세요");
	         return false;
	      }
		
		
// 		$('input[id=ctgry_gu]').val()
// 		$('input[id=cmmnty_cafe_nm]').val()
// 		$('input[id=cmmnty_cafe_adres]').val()
// 		$('input[id=cmmnty_cafeinfo]').val()
		
	
	});
});
</script>

</html>
