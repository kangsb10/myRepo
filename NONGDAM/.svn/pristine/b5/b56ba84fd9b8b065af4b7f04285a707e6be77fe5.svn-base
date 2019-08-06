<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<head>
<meta charset="UTF-8">
    <meta name="description" content="Homes Template">
    <meta name="keywords" content="Homes, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    


<link
	href="https://fonts.googleapis.com/css?family=Do+Hyeon&display=swap&subset=korean"
	rel="stylesheet">

	
<style>


h1,p,span,a,div,option,input,td,h3,h4 {
	font-family: 'Do Hyeon', sans-serif;
	color: #585858;
}

h1,h3 {
	font-weight: 600;
	font-size: 25px;
	color: #F89152;
}
h4 {
	font-weight: 400;
	font-size: 20px;
}

span,a {
	font-weight: 300;
	font-size: 20px;
	color: #F89152;
}

span.sp {
	font-weight: 300;
	font-size: 20px;
	color: #8A2908;
}

p {
	font-weight: 200;
	font-size: 15px;
	color: #585858;
}

label {
    text-align: center;
	font-weight: 400;
	font-size: 17px;
	color: #585858;
}


input.a {
	color: #0B3B24;
	background-color : white;
	border-radius: 10px; 
	width: 220px;  
	height: 35px; 
	border : 0px; 
	border-bottom: 3px solid silver;
	position: absolute;
	left: 30%;
	 
}

input::placeholder {
font-size: 14px;
  color: #0B3B24;
}




th {
	text-align: center;
}

button.btn_conf {
	margin-left:0px;
	font-size: 14px;
	color: white;
	background-color: #6E6E6E;
	border-radius: 20px; 
	padding: 6px 8px 6px 8px; 
	border: 0; 
	position: absolute;
	left: 90%;
	 

}

	.main_popup{width:70%; height:60%; border:3px solid #3E4156;
				background-color: white;
				 z-index:10000; top:150px;
				  
				left:20px; display: none; }
	.popup_bottom{
		    background-color: #3E4156;
		    color: white;
		    height: 5%;
		    padding: 2px 10px 3px 10px;
		    width:100%;
		    position: fixed;
		    top:
		    }
	.pull-right{float:right;}
	.white {font-size: 13px;}		    




</style>
<script type="text/javascript">
function showSearchBuyerCodeWindow(){	             
	$("#searchBuyerCodeWindow").show();
}

function showSearchProdCodeWindow(){	             
	$("#searchProdCodeWindow").show();
}
</script>
</head>

<body >
	<form name='prodinsertForm'
		action='${pageContext.request.contextPath }/admin/shop/insertProd.do'
		method="post" style="position: relative; top: 80px;" enctype="multipart/form-data">

			<div>
				<h3 style="position: relative; left: 120px; top: -20px;" >상품을 등록하세여</h3>
			</div>			
			<div class="container login-container">
				<div class="col-md-6 login-form-1" style="position: relative; top : -15px; left: -15px; width: ">
					<form >
						<div style="float: left;  width: 500px;  ">
							<div style="float: left; margin-top: 5px;" ><label for="" class="col-lg-2 control-label" style="">상품코드</label></div>
							<div class="" style="float: left; margin-left:0px;  height: 35px;">
	                            <input type="text" class="a" id="goods_id" name="goods_id"   placeholder="상품코드를 검색하세요." 
	                            data-parsley-error-message="상품코드를 검색하세요." value="" style=""/>
	                        </div>
	                       	<div style="float: left; width: 150px; ">
	                       		<span class="" style="float: left; ">
										<button id="confirm" type="button" onclick="showSearchProdCodeWindow()" class="btn_conf" 
										style="float:left;  padding-right: 4px;" >검 색</button>
										<input type="hidden" id="check" value="no"/>
								</span>	
							</div>
							
							<!-- 상품코드 검색시 뜨는 모달 -->
							<table id="searchProdCodeWindow" class="main_popup" width="354" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td height="30"><img src="/img/admin/shoppingPopup/open_post.gif" width="136"
										height="22"></td>
								</tr>
								<tr>
									<td><img src="/img/admin/shoppingPopup/open_table01.gif" width="354" height="10"></td>
								</tr>
								<tr>
									<td height="10" background="/img/admin/shoppingPopup/open_table02.gif" align="center">&nbsp;</td>
								</tr>
								<tr>
									<td height="300" align="center" valign="top"
										background="/img/admin/shoppingPopup/open_table02.gif">
										<table width="300" border="0" cellspacing="0" cellpadding="0">
											<tr>
												<td height="25"><div align="center">등록하려는 상품명을
														입력해주십시오.</div></td>
											</tr>
											<tr>
												<td height="38" background="/img/admin/shoppingPopup/open_tt.gif" align="center">
														<input type="text" id="goods_nm">&nbsp;상품명&nbsp;
														<input type="button" id="searchProdBtn" value="검색">
													</td>
											</tr>
											<tr>
												<td>&nbsp;</td>
											</tr>
											<tr>
												<td>
													<div style="overflow: auto; white-space: nowrap; overflow-X: hidden; height: 200px;" id="viewProdTable">
													</div>
												</td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<td><img src="/img/admin/shoppingPopup/open_table03.gif" width="354" height="10"></td>
								</tr>
							</table>
						</div>	
						
						<div style="float: left; top:10px;  width: 500px; margin-top: 10px; ">
							<div style="float: left; margin-top: 5px;" ><label for="" class="col-lg-2 control-label" style="">상품명</label></div>
							<div class="" style="float: left; margin-left:0px;  height: 35px;">
	                            <input type="text" class="a" id="goods_nm" name="goods_nm"   placeholder="상품명을 입력하세요"  
	                            data-rule-required="true"style="" maxlength="30"/>
	                        </div>
						</div>	
						
				
						
						<div style="float: left;  width: 500px;  margin-top: 10px; ">
							<div style="float: left; margin-top: 5px;" ><label for="" class="col-lg-2 control-label" style="float: left;">상품분류코드</label></div>
<!-- 	                        <div style="float: left; margin-left:0px;  height: 35px; width: 120px; "> -->
<!-- 		                        <select class="" name="lprod_gu" id="lprod_gu" style="width: 100px; float: left;  border-radius: 35px; margin-top: 5px;"> -->
<%-- 												    <%for(String lprodStr : listGuPlusMm){ %> --%>
<%-- 													<option value="<%=lprodStr.substring(0,4)%>" ><%=lprodStr%></option> --%>
<%-- 													<%} %> --%>
<!-- 								</select> -->
<!-- 							</div> -->
							<div class="" style="float: left; height: 35px; width: 100px; ">
	                            <input type="text" class="a" id="lprod_gu" name="lprod_gu"   placeholder="상품분류코드" 
	                                     value="" style="width: 100px; float: left;  height: 35px;  "/>
	                        </div>
						</div>	
						
							
						<div style="float: left;  width: 500px;  margin-top: 10px;">
							<div style="float: left; margin-top: 5px;" ><label for="" class="col-lg-2 control-label" style="">거래처코드</label></div>
							<div class="" style="float: left; margin-left:0px;  height: 35px;">
	                            <input type="text" class="a" id="buyer_id" name="buyer_id"   placeholder="거래처코드를 입력하세요"  data-rule-required="true"  
	                            style="" maxlength="15"/>
	                        </div>
	                        <div style="float: left;">
	                       		<span class="" style="float: left; ">
										<button id="search_buyer_id" type="button" onclick="showSearchBuyerCodeWindow()" class="btn_conf" 
										style="float:left;  padding-right: 4px;" >검 색</button>
										<input type="hidden" id="" value="no"/>
								</span>	
							</div>
							
							
							
							
							<!-- 거래처검색 클릭하면 뜨는 모달 -->
							 <div id="searchBuyerCodeWindow" class="main_popup" style="" >
								<table width="250px;" border="0" cellspacing="0" cellpadding="0" >
									<tr>
										<td height="30"><img src="/img/shop/images/open_post.gif" width="136"
											height="22"></td>
									</tr>
									<tr>
										<td><img src="/img/shop/imges/open_table01.gif" width="354" height="10"></td>
									</tr>
									<tr>
										<td height="10" background="/img/shop/images/open_table02.gif" align="center">&nbsp;</td>
									</tr>
									<tr>
										<td height="300" align="center" valign="top"
											background="/img/shop/images/open_table02.gif">
											<table width="300" border="0" cellspacing="0" cellpadding="0">
												<tr>
													<td height="25"><div align="center">찾고자 하는 거래처명을
															입력해주십시오.</div></td>
												</tr>
												<tr>
													<td height="38" background="/img/shop/images/open_tt.gif" align="center">
														<input type="text" id="buyerNm">&nbsp;거래처명&nbsp;
														<input type="button" id="searchBuyerBtn" value="검색">
													</td>
												</tr>
												<tr>
													<td>&nbsp;</td>
												</tr>
												<tr>
													<td>
														<div style="overflow: auto; white-space: nowrap; overflow-X: hidden; height: 200px;" id="viewTable">
														</div>
													</td>
												</tr>
											</table>
										</td>
									</tr>
									<tr>
										<td><img src="/img/shop/images/open_table03.gif" width="354" height="10"></td>
									</tr>
									<div class="popup_bottom">
										<a class="pull-right white" href="javascript:closeMainPopup();">닫기</a>
									</div>
								</table>
							</div>
							<!--  -->
						</div>
							
						<div style="float: left;  width: 500px;  margin-top: 10px;">
							<div style="float: left; margin-top: 5px;" ><label for="" class="col-lg-2 control-label" style="">상품가격</label></div>
							<div class="" style="float: left; margin-left:0px;  height: 35px;">
	                            <input type="text" class="a" id="goods_pc" name="goods_pc"   placeholder="상품가격을 입력하세요"  
	                            data-rule-required="true"  
	                            style="" maxlength="40"/>
	                        </div>
						</div>
						
						<div style="float: left;  width: 500px;  margin-top: 10px;">
							<div style="float: left; margin-top: 5px;" ><label for="" class="col-lg-2 control-label" style="">재고량</label></div>
							<div class="" style="float: left; margin-left:0px;  height: 35px;">
	                            <input type="text" class="a" id="goods_invntry" name="goods_invntry"   placeholder="재고량을 입력하세요"  data-rule-required="true"  
	                            style="" maxlength="15"/>
	                        </div>
						</div>
						<div style="float: left;  width: 500px;  margin-top: 10px;">
							<div style="float: left; margin-top: 5px;" ><label for="" class="col-lg-2 control-label" style="">상품 설명</label></div>
							<div class="" style="float: left; margin-left:0px;  height: 35px;">
	                            <input type="text" class="a" id="goods_dc" name="goods_dc"   placeholder="상품 설명을 입력하세요"  data-rule-required="true"  
	                            style="" maxlength="15"/>
	                        </div>
						</div>
						
						<!-- 첨부파일 -->
						<div class="" id="" style="margin-top: 10px;">
							<div style="float: left; margin-top: 5px;" ><label for="" class="col-lg-2 control-label" style="">첨부이미지</label></div>
							<div class="">
									 <input type="file" class="filestyle" id="files" name="files" data-buttonName="btn-primary">
								</div>
						</div>

						
						<div style="float: left;  width: 500px; margin-top: 20px;">
							<div style="float: left; position: absolute; left: 10px; top: 550px;">
								<button type="button" id="listBt" style=" color: #fff; background: #0B3B24; border-radius: 20px; padding: 5px 12px 5px 12px; border: 0;" >목록</button>
							</div>
							<div style="float: left; position: absolute; left: 60px; top: 550px;">
								<button type="button" id="cancleBt" style=" color: #fff; background: #E16422; border-radius: 20px; padding: 5px 12px 5px 12px; border: 0;" >취소</button>
							</div>
							<div style="float: left; position: absolute; left: 110px; top: 550px;">
								<button type="submit" id="" style=" color: #fff; background: #E16422; border-radius: 20px; padding: 5px 12px 5px 12px; border: 0;" >등록</button>
							</div>

						</div>	
						

					</form>
				</div>
				<div class="img-src"
					style="background-image: url('${pageContext.request.contextPath }/img/cover_4.jpg')"></div>
				<div class='img-src blur'
					style="background-image: url('${pageContext.request.contextPath }/img/cover_4_blur.jpg')"></div>
			</div>
	</form>
</body>


<!-- Javascript 
================================================== -->
<!-- <script src="/js/main/jquery.js"></script> -->
<script src="/js/main/wow.min.js"></script>
<script src="/js/main/custom.js"></script>

 <script src="/js/view/jquery.nice-select.min.js"></script>
    <script src="/js/view/owl.carousel.min.js"></script>
    <script src="/js/view/jquery-ui.min.js"></script>
    <script src="/js/view/jquery.slicknav.js"></script>
    <script src="/js/view/main.js"></script>
	
<!-- <script type='text/javascript' src='http://code.jquery.com/jquery-latest.js'></script> -->
<script type='text/javascript' src='${pageContext.request.contextPath }/js/validation.js'></script>
<script type='text/javascript' src='${pageContext.request.contextPath }/js/cookieControl.js'></script>
<script type='text/javascript' src='${pageContext.request.contextPath}/js/jsbn.js'> </script>
<script type='text/javascript' src='${pageContext.request.contextPath}/js/rsa.js'> </script>
<script type='text/javascript' src='${pageContext.request.contextPath}/js/prng4.js'> </script>
<script type='text/javascript' src='${pageContext.request.contextPath}/js/rng.js'> </script>



<script>
//검색버튼을 누르면


//팝업에서 검색하면 
$(function() {
// 	$("#search_buyer_id").click(function(){
// 	      var url    = '/shop/popup/buyerCodeSearchWindow.do';
// 	      var options   = 'toolbar=no,location=no,status=no,menubar=no' + 
// 	                 'scrollbars=yes,resizable=no,copyhistory=no,width=1000px,height=400px';
// 	      window.open(url, '거래처 검색', options);
	      
// 	   });
	
// 	$('#searchBuyerCodeWindow').draggable();
	
	$('#searchBuyerBtn').click(function(){
		if($('#buyerNm').val() == ''){
			alert('거래처명을 입력하세요!');
			return;
		}
		$.ajax({
	         type       : 'POST',
	         dataType   : 'JSON',
	         url         : '/admin/shop/buyerCodeSearch.do',
	         data      : { buyer_nm : $("#buyerNm").val() },
	         error      : function(result){
	            alert('code : ' + result.result.status + 
	                  ' | message : ' + result.result.responseText);
	         },
	         success      : function(result){
	            var htmls = '<table width="100%" height="100%" border=0 cellspacing="0" cellpadding="0" ' + 
	                     'style="overflow:scroll;" id="buyercodeTBL">' +
	                        '<thead>' + 
	                           '<tr>' + 
	                              '<th>거래처코드</th>' +
	                              '<th>거래처명</th>' +
	                           '</tr>' + 
	                        '</thead>' + 
	                        '<tbody>';
	            for(var i = 0; i < result.result.length; i++){
	               htmls += '<tr>' + 
	                        '<td>' + result.result[i].buyer_id + '</td>' + 
	                        '<td>' + result.result[i].buyer_nm + '</td>' + 
	                      '</tr>';
	           
	            }
	            htmls += '</tbody></table>';
	            
	            $("#viewTable").empty().append(htmls);
	               
	               $("#buyercodeTBL tr:gt(0)").click(function(){
	                  var buyercode = $(this).find('td:eq(0)').text();
	                  // opener:팝업시킨 부모창
	                  $('#buyer_id').val(buyercode);
	                 
	                  
	                  //지혼자 닫겟다
// 	                  self.close();
	                  $('#searchBuyerCodeWindow').hide('fade');
	                  
	                  
	               });
	               
	               
	               
	            },
	         });
	   });  
	$('#searchProdBtn').click(function(){
		if($('#goods_nm').val() == ''){
			alert('상품명을 입력하세요!');
			return;
		}
		$.ajax({
	         type       : 'POST',
	         dataType   : 'JSON',
	         url         : '/admin/shop/prodCodeSearch.do',
	         data      : { goods_nm : $("#goods_nm").val() },
	         error      : function(result){
	            alert('code : ' + result.result.status + 
	                  ' | message : ' + result.result.responseText);
	         },
	         success      : function(result){
	            var htmls = '<table width="100%" height="100%" border=0 cellspacing="0" cellpadding="0" ' + 
	                     'style="overflow:scroll;" id="prodcodeTBL">' +
	                        '<thead>' + 
	                           '<tr>' + 
	                              '<th>상품코드</th>' +
	                              '<th>상품명</th>' +
	                           '</tr>' + 
	                        '</thead>' + 
	                        '<tbody>';
	            for(var i = 0; i < result.result.length; i++){
	               htmls += '<tr>' + 
	                        '<td>' + result.result[i].goods_id + '</td>' + 
	                        '<td>' + result.result[i].goods_nm + '</td>' + 
	                      '</tr>';
	           
	            }
	            htmls += '</tbody></table>';
	            
	            $("#viewProdTable").empty().append(htmls);
	               
	               $("#prodcodeTBL tr:gt(0)").click(function(){
	                  var prodcode = $(this).find('td:eq(0)').text();
	                  // 저걸 +1해서 넘기기
	                  // opener:팝업시킨 부모창
	                  var prodcode_int = parseInt(prodcode.substr(1,9));
	                  var plusProdCode = prodcode_int+ 1;
	                  var resultProdCode = "P" + plusProdCode;
	                  $('#goods_id').val(resultProdCode);
	                  $('#lprod_gu').val(resultProdCode.substr(0,4));
	                  
	                 
//	                   $('#mem_zip1', opener.document).val(buyercode.split('-'[0]));
//	                   $('#mem_zip2', opener.document).val(buyercode.split('-'[1]));
//	                   $('#mem_add1', opener.document).val(buyerName);
	                  
	                  //지혼자 닫겟다
	                  $('#searchProdCodeWindow').hide('fade');
	               });
	               
	               
	               
	            },
	         });
	   });   
	
	});



</script>

</html>