<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
    <!-- Required meta tags -->
    <!-- animate CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/community/animate.css">
    <!-- owl carousel CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/community/owl.carousel.min.css">
    <!-- themify CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/community/themify-icons.css">
    <!-- style CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/community/style.css">
    
       <style>
      h2,h3,p,span,a,div {
        font-family: 'Do Hyeon', sans-serif;
      }
      
      h2#title {
        font-weight: 400;
         font-size: 30px;
         color: #0B3B24;
      }
      
      h3{
        font-weight: 300;
         font-size: 20px;
         color: #E16422;
      }
      
      
      span,a {
        font-weight: 300;
         font-size: 10px;
         color: #FBD9A7;
      }
      
      
      
      p {
        font-weight: 200;
        font-size: 15px;
        color: #FFFFFF;
      }
      
      div#a, div#b {
        font-weight: 200;
        font-size: 40px;
        color: #FFFFFF;
      }
      
    </style>
    <!--::breadcrumb part start::-->
    <section class="breadcrumb breadcrumb_bg" style="position: relative; top:70px;">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb_iner">
                        <div class="breadcrumb_iner_item">
                            <h2 id="title">NONGDAM CAFE</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--::breadcrumb part start::-->

    <!-- feature_post start-->
    <section class="" style="position: relative; top: 30px; background-color: ; ">
        <div class="container">
            <div class="row">
               
               <div class="form-group" style="position: relative; top: 20px; left:150px;"> 
                  <div style="float: left;  position:relative;  left: 10%; font-size: 20px"></div>
               <c:if test="${not empty login_mberInfo }">
               <div class="" style="float: left; position:relative; top: -5px; left: 100px; ">
                  <button type="button" id="cmIns" class="" style=" padding: 5px 12px 5px 12px; border: 0px;  color: #fff; border-radius: 20px; background-color: #E16422;">개설</button>
               </div>
               </c:if>
            </div>
                <div class="">
                    <div class="row">
                    <c:forEach items="${communityList }" var="communityList" >
                        <div class="" style="position: relative; top: 15px; ">
                            <div class="" style="height:100px; float: left;  padding-bottom: 15px; border-bottom: 1px solid #6E6E6E; padding-top: 10px;" >
                                <div class="" style="background-color: ; float: left; margin-left: 20px;  ">
                                    <img src="/files/${communityList.itemss[0].cmmnty_file_save_name }" alt="" style="height: 50px; width:80px; border-radius: 25px; ">
                                </div>
                                <div class="" style="float: left; margin-left: 20px; margin-top: -10px;">
                                    <a href="/user/cm/cmaddr/${communityList.cmmnty_cafe_adres }.do?cmmnty_no=${communityList.cmmnty_no }&cafe_mber_id=${login_mberInfo.mber_id}">
                                 <div style="background-color: silver; margin-left: -25px;">
                                            <ul >
                                               <li style="float: left; margin-left: 10px; margin-top: 10px; " class="a"> ${communityList.ctgry_gu }</li>
                                               <li style=" width: 100%; float: left; margin-left: 10px; margin-top: -20px;"> <h3>${communityList.cmmnty_cafe_nm } </h3></li>
                                            </ul>
                                        </div>
                                    </a>
                                    <div class="" style="position:relative; top: 35px;   width: 320px; height: 300px;" align="left" >
                                        <ul style="line-height: 1em; position: relative;">
                                            <li style="  position: relative; left:;"> 주인장 : ${communityList.mber_id }</li>
                                            <li style="  position: relative;left: 0px;"> cafe주소 : localhost/user/cm/cmaddr/${communityList.cmmnty_cafe_adres }</li>
                                            <li style="  position: relative;left: 0px;"> cafe설명 : ${communityList.cmmnty_cafeinfo }</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        </c:forEach>
                    </div>
					<div style="position: relative; top: 20px;">
						${pagingHtmls }
					</div>
                </div>
                
			<div style="position: relative; top: 30px; left: 100px">
				<form action="/user/cm/communityList.do" method="post"
					class="form-inline">
					<ul style="height: 70px;">
						<li style="float: left;"><input type="text"
							id="search_keyword" name="search_keyword" placeholder="검색어 입력"
							class="form-control search-input"
							style="height: 32px; width: 100%; border-radius: 0 0 0 0; border-color: #346D4E;">
						</li>
						<li style="float: left; border-radius: 0 0 0 0;"><select
							class="form-control" name="search_keycode"
							style="height: 32px; width: 100%; border: 1px solid #c2c2c2; border-radius: 0 0 0 0; border-color: #346D4E;">
								<option selected="selected">검색조건</option>
								<option value="TOTAL">전체</option>
								<option value="TITLE">카페이름</option>
								<option value="GU">분류명</option>
								<option value="WRITER">카페장</option>
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
			</div>
		</div>
        </div>
    </section>

<script type="text/javascript">
$('#cmIns').click(function(){
      $(location).attr('href', '${pageContext.request.contextPath}/user/cm/communityForm.do');         

});
</script>
</html>