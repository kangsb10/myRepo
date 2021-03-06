<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<head>
<meta charset="UTF-8">
    <meta name="description" content="Homes Template">
    <meta name="keywords" content="Homes, unica, creative, html">
    <meta name="viewport" content="width=device-width, ">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    
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

    <link rel="stylesheet" href="/css/view/nice-select.css" type="text/css">
    <link rel="stylesheet" href="/css/view/owl.carousel.min.css" type="text/css">
    
    <link rel="stylesheet" href="/css/view/flaticon.css" type="text/css">
    <link rel="stylesheet" href=/css/view/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="/css/view/jquery-ui.min.css" type="text/css">
    

<link
	href="https://fonts.googleapis.com/css?family=Do+Hyeon&display=swap&subset=korean"
	rel="stylesheet">
	
<link href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i"
    rel="stylesheet">
	

<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-slider/10.6.1/css/bootstrap-slider.css"
    rel="stylesheet">
	
<style>
 body 
 { 
 background: url('${pageContext.request.contextPath }/img/background.jpg') no-repeat center center fixed; 
-webkit-background-size: cover;
-moz-background-size: cover;
-o-background-size: cover;
background-size: cover;
width: 400px;
height: 900px;
 } 


h1,p,span,a,div,option,input,td,h3,h4 {
	font-family: 'Do Hyeon', sans-serif;
	color: #585858;
}

h1,h3 {
	font-weight: 600;
	font-size: 35px;
	color: #FFFFFF;
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
	color: #FFFFFF;
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
	left: 25%;
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
	left: 86%;
	 

}

/* button.btnclass{ */
/* font-size: 17px; */
/*  color: #0B3861; */
/* } */
/* button.sns{ */

/*  color: #0B3861; */
/* } */


</style>
</head>
<script type='text/javascript'
	src='http://code.jquery.com/jquery-latest.js'></script>
<script type='text/javascript'
	src='${pageContext.request.contextPath }/js/validation.js'></script>
<script type='text/javascript'
	src='${pageContext.request.contextPath }/js/cookieControl.js'></script>
<script type='text/javascript'
	src='${pageContext.request.contextPath }/js/jsbn.js'></script>
<script type='text/javascript'
	src='${pageContext.request.contextPath }/js/rsa.js'></script>
<script type='text/javascript'
	src='${pageContext.request.contextPath }/js/prng4.js'></script>
<script type='text/javascript'
	src='${pageContext.request.contextPath }/js/rng.js'></script>
<body>
	<form name='loginForm'
		action='${pageContext.request.contextPath }/member/insertMember.do'
		method="post" style="position: relative; top: 80px;">
			<div>
				<h3 style="position: relative; left: 60px; top: -20px;" >P R O F I L E</h3>
			</div>
			<div class="container login-container">
				<div class="col-md-6 login-form-1" style="position: relative; top : -15px; left: -15px; width: ">
					<form>
							<div style="float: left;  width: 500px; ">
							<div style="float: left; margin-top: 5px;" ><label for="inputId" class="col-lg-2 control-label">아이디</label></div>
							<div class="" style="float: left; margin-left:0px;  height: 35px;">
								<input id="mber_id" name="mber_id" class="a" value="${login_mberInfo.mber_id }"
								required="" type="text"  data-parsley-type="text"
								data-parsley-errors-container="div[id='m_id_error']" readonly="readonly"/>
							</div>
							<div style="float: left; top:10px;  width: 500px; margin-top: 10px; ">
								<div style="float: left; margin-top: 5px;" ><label for="inputPassword" class="col-lg-2 control-label">비밀번호</label></div>
								<div class="" style="float: left; margin-left:0px;  height: 35px;">
									<input type="password" class="a" id="mber_password"
										name="mber_password" data-rule-required="true" 
										value="${login_mberInfo.mber_password }" maxlength="30" readonly="readonly">
								</div>
							<div style="float: left;">
								<span class="" style="float: left;">
								<button id="confirm" type="button" class="btn_conf" style="float:left;  ">변경</button>
								</span>	
							</div>
						</div>
							
							
						<div style="float: left;  width: 500px;  margin-top: 10px;">
							<div style="float: left; margin-top: 5px;" ><label for="" class="col-lg-2 control-label" style="">핸드폰</label></div>
							<div class="" style="float: left; margin-left:0px;  height: 35px;">
								<input id="mber_mbtlnum" name="mber_mbtlnum" class="a" value="${login_mberInfo.mber_mbtlnum }"
								required="" type="text"  data-parsley-type="text" 
								data-parsley-errors-container="div[id='m_id_error']" readonly="true"/>
							</div>
							
							<div style="float: left; ">
	                       		<span class="" style="float: left;">
									<button id="mbtlnumUpdatebtn" type="button" class="btn_conf" style="float:left;  " >변경</button>
									<input type="hidden" id="check" value="no"/>
								</span>	
							</div>
						</div>
						
						<div style="float: left;  width: 500px;  margin-top: 10px;">
							<div style="float: left; margin-top: 5px;" ><label for="inputName" class="col-lg-2 control-label">이름</label></div>
							<div class="" style="float: left; margin-left:0px;  height: 35px;">
								<input type="text" class="a" id="mber_nm" name="mber_nm"
									data-rule-required="true" value="${login_mberInfo.mber_nm }"
									maxlength="15" disabled="disabled">
							</div>
						</div>
						
						<div style="float: left;  width: 500px;  margin-top: 10px;">
							<div style="float: left; margin-top: 5px;" ><label for="" class="col-lg-2 control-label" style="">이메일</label></div>
							<div class="" style="float: left; margin-left:0px;  height: 35px;">
	                            <input type="email" class="a" id="mber_email" name="mber_email"  value="${login_mberInfo.mber_email }" 
	                            data-rule-required="true"  
	                            style="" maxlength="40" readonly="true"/>
	                        </div>
	                        <div style="float: left; ">
	                       		<span class="" style="float: left;">
									<button id="mailUpdatebtn" type="button" class="btn_conf" style="float:left;  " >변경</button>
									<input type="hidden" id="check" value="no"/>
								</span>	
							</div>
						</div>
						
						<div style="float: left;  width: 500px;  margin-top: 10px;">
							<div style="float: left; margin-top: 5px;" ><label for="" class="col-lg-2 control-label" style="">닉네임</label></div>
							<div class="" style="float: left; margin-left:0px;  height: 35px;">
	                            <input type="text" class="a" id="mber_ncnm" name="mber_ncnm" value="${login_mberInfo.mber_ncnm }" data-rule-required="true"  
	                            style="" maxlength="15" readonly="true"/>
	                        </div>
	                        <div style="float: left; ">
	                       		<span class="" style="float: left;">
									<button id="ncnmUpdatebtn" type="button" class="btn_conf" style="float:left;  " >변경</button>
									<input type="hidden" id="check" value="no"/>
								</span>	
							</div>
						</div>
						<div class="" id="" style="margin-top: 10px;">
							<div style="float: left;  width: 500px;  margin-top: 15px;">
								<div style="float: left; margin-top: 5px;" ><label for="" class="col-lg-2 control-label" style="">주소</label></div>
								<div class="" style="float: left; margin-left:0px;  height: 35px;">
		                            <input type="text" class="a" id="mber_zip" name="mber_zip"  value="${login_mberInfo.mber_zip }" readonly="true"
		                            style="width: 120px; background-color : #ECC3A8; color: #6E6E6E;" />
		                        </div>
		                        <div style="float: left; ">
		                       		<span class="" style="float: left;">
											<button id="addrUpdatebtn" type="button" onclick="addr_Search()" class="btn_conf" style="float:left; left: 70%; background-color: #8E2704; color:#FFFFFF; " >검 색</button>
									</span>	
								</div>
							</div>
							
							<div style="float: left;  width: 500px;  margin-top: 4px;">
								<div style="float: left; margin-top: 5px;" ></div>
								<div class="" style="float: left; margin-left:0px;  height: 35px;">
		                            <input type="text" class="a" id="mber_bass_adres" name="mber_bass_adres"   value="${login_mberInfo.mber_bass_adres }" readonly="true"  data-rule-required="true"  
		                            style="" maxlength="15"/>
		                        </div>
							</div>
						
							<div style="float: left;  width: 500px;  margin-top: 4px;">
								<div style="float: left; margin-top: 5px;" ></div>
								<div class="" style="float: left; margin-left:0px;  height: 35px;">
		                            <input type="text" class="a" id="mber_detail_adres" name="mber_detail_adres"   value="${login_mberInfo.mber_detail_adres }" readonly="true"  data-rule-required="true"  
		                            style="" maxlength="15"/>
		                        </div>
							</div>
								<div id="layer1" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
									<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
								</div>
						</div>

						
						<div style="float: left;  width: 500px;  margin-top: 4px;">
								<div style="float: left; margin-top: 5px;" ><label for="" class="col-lg-2 control-label" style="">농장주소</label></div>
						<div class="" style="float: left; margin-left:0px;  height: 35px;">
							<input type="text" class="a" id="mber_farmng_adres" name="mber_farmng_adres" value="${login_mberInfo.mber_farmng_adres }" data-rule-required="true"  
	                            style="" maxlength="15" readonly="readonly"/>
	                        </div>
	                        <div style="float: left; ">
	                       		<span class="" style="float: left;">
									<button  type="button" class="btn_conf" style="float:left;  " onclick="sample2_execDaumPostcode()" value="주소변경">변경</button>
									<input type="hidden" id="check" value="no"/>
								</span>	
							</div>
	                        <div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
								<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute; right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
							</div>
					</form>
				</div>
				<div class="img-src"
					style="background-image: url('${pageContext.request.contextPath }/img/cover_4.jpg')"></div>
				<div class='img-src blur'
					style="background-image: url('${pageContext.request.contextPath }/img/cover_4_blur.jpg')"></div>
			</div>
	</form>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.4.js"></script>
</body>
<script>
    // 우편번호 찾기 찾기 화면을 넣을 element
   var flag;
	var element_layer = document.getElementById('layer');
    var element_layer1 = document.getElementById('layer1');

    function closeDaumPostcode() {
        // iframe을 넣은 element를 안보이게 한다.
        element_layer.style.display = 'none';
        element_layer1.style.display = 'none';
    }
	function idCheck(){
// 		if(!$('input[name=m_id]').val().validationID()){
// 			alert('아이디를 바르게 입력해주세요.');
// 			return false
// 		}
		$.ajax({
			type : 'POST',
			url : '${pageContext.request.contextPath}/user/member/idCheck.do',
			dataType : 'json',
			data : { mber_id : $('input[name=mber_id]').val() },
			error : function(result){
				alert(result.status + ' | ' + result.responseText);
			},
			success : function(result){
				alert(result.result);
				flag=result.result
			}
		});
	}
	function addr_Search() {
		
		 if ( $('input[name=mber_zip]').is('[readonly="true"]') ) { 
			   $('input[name=mber_zip]').attr("readonly",false)
			   $('input[name=mber_bass_adres]').attr("readonly",false)
			   $('input[name=mber_detail_adres]').attr("readonly",false)
		    	new daum.Postcode({
		            oncomplete: function(data) {
		                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
		
		                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
		                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
		                var addr = ''; // 주소 변수
		                var extraAddr = ''; // 참고항목 변수
		
		                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
		                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
		                    addr = data.roadAddress;
		                } else { // 사용자가 지번 주소를 선택했을 경우(J)
		                    addr = data.jibunAddress;
		                }
		
		                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
		                if(data.userSelectedType === 'R'){
		                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
		                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
		                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
		                        extraAddr += data.bname;
		                    }
		                    // 건물명이 있고, 공동주택일 경우 추가한다.
		                    if(data.buildingName !== '' && data.apartment === 'Y'){
		                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		                    }
		                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
		                    if(extraAddr !== ''){
		                        extraAddr = ' (' + extraAddr + ')';
		                    }
		                    // 조합된 참고항목을 해당 필드에 넣는다.
		                }
		
		                // 우편번호와 주소 정보를 해당 필드에 넣는다.
		//                 document.getElementById("mber_farmng_adres").value = addr;
		                // 커서를 상세주소 필드로 이동한다.
		                 $('input[name=mber_detail_adres]').attr("readonly",false);
		                document.getElementById('mber_zip').value = data.zonecode;
		                document.getElementById("mber_bass_adres").value = addr;
		                // 커서를 상세주소 필드로 이동한다.
		                document.getElementById("mber_detail_adres").focus()
		
		                // iframe을 넣은 element를 안보이게 한다.
		                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
		                element_layer1.style.display = 'none';
		            },
		            width : '100%',
		            height : '100%',
		            maxSuggestItems : 5
		        }).embed(element_layer1);
		
		        // iframe을 넣은 element를 보이게 한다.
		        element_layer1.style.display = 'block';
		
		        // iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
		        initLayerPosition1();
		  }else{
			   	$.ajax({
				type : 'POST',
				url : '${pageContext.request.contextPath}/user/member/update.do',
				dataType : 'json',
				data : { mber_id : $('input[name=mber_id]').val(),
						mber_zip : $('input[name=mber_zip]').val(),
						mber_bass_adres : $('input[name=mber_bass_adres]').val(),
						mber_detail_adres : $('input[name=mber_detail_adres]').val()},
				error : function(result){
					alert(result.status + ' | ' + result.responseText);
				},
				success : function(result){
					alert(result.result);
					flag=result.result
				}
				});
			   $('input[name=mber_zip]').attr("readonly",true)
			   $('input[name=mber_bass_adres]').attr("readonly",true)
			   $('input[name=mber_detail_adres]').attr("readonly",true)
		   	}
    }
	
	
    function initLayerPosition1(){
        var width = 300; //우편번호서비스가 들어갈 element의 width
        var height = 400; //우편번호서비스가 들어갈 element의 height
        var borderWidth = 5; //샘플에서 사용하는 border의 두께

        // 위에서 선언한 값들을 실제 element에 넣는다.
        element_layer1.style.width = width + 'px';
        element_layer1.style.height = height + 'px';
        element_layer1.style.border = borderWidth + 'px solid';
        // 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
        element_layer1.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
        element_layer1.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
    }
	
    
    
    
    
    
    
    function sample2_execDaumPostcode() {
    	
    	if ( $('input[name=mber_farmng_adres]').is('[readonly="true"]') ) { 
 		   $('input[name=mber_farmng_adres]').attr("readonly",false)
		        new daum.Postcode({
		            oncomplete: function(data) {
		                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
		
		                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
		                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
		                var addr = ''; // 주소 변수
		                var extraAddr = ''; // 참고항목 변수
		
		                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
		                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
		                    addr = data.roadAddress;
		                } else { // 사용자가 지번 주소를 선택했을 경우(J)
		                    addr = data.jibunAddress;
		                }
		
		                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
		                if(data.userSelectedType === 'R'){
		                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
		                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
		                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
		                        extraAddr += data.bname;
		                    }
		                    // 건물명이 있고, 공동주택일 경우 추가한다.
		                    if(data.buildingName !== '' && data.apartment === 'Y'){
		                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		                    }
		                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
		                    if(extraAddr !== ''){
		                        extraAddr = ' (' + extraAddr + ')';
		                    }
		                    // 조합된 참고항목을 해당 필드에 넣는다.
		                }
		
		                // 우편번호와 주소 정보를 해당 필드에 넣는다.
		                document.getElementById("mber_farmng_adres").value = addr;
		                // 커서를 상세주소 필드로 이동한다.
		
		                // iframe을 넣은 element를 안보이게 한다.
		                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
		                element_layer.style.display = 'none';
		            },
		            width : '100%',
		            height : '100%',
		            maxSuggestItems : 5
		        }).embed(element_layer);
		
		        // iframe을 넣은 element를 보이게 한다.
		        element_layer.style.display = 'block';
		
		        // iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
		        initLayerPosition();
		    }else{
				   	$.ajax({
					type : 'POST',
					url : '${pageContext.request.contextPath}/user/member/update.do',
					dataType : 'json',
					data : { mber_id : $('input[name=mber_id]').val(),mber_farmng_adres : $('input[name=mber_farmng_adres]').val() },
					error : function(result){
						alert(result.status + ' | ' + result.responseText);
					},
					success : function(result){
						alert(result.result);
						flag=result.result
					}
					});
				   $('input[name=mber_farmng_adres]').attr("readonly",true)
			  }
		    }
    // 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
    // resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
    // 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
    
    
    
    
    function initLayerPosition(){
        var width = 300; //우편번호서비스가 들어갈 element의 width
        var height = 400; //우편번호서비스가 들어갈 element의 height
        var borderWidth = 5; //샘플에서 사용하는 border의 두께

        // 위에서 선언한 값들을 실제 element에 넣는다.
        element_layer.style.width = width + 'px';
        element_layer.style.height = height + 'px';
        element_layer.style.border = borderWidth + 'px solid';
        // 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
        element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
        element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
    }
    
$(function(){
    $('form').submit(function(){
    	if(flag=="중복된 아이디 입니다."){
    		alert('부적절한 아이디입니다, 중복검사를 다시해주세요');
			return false;
		}
		if(!$('input[name=mber_password]').val().validationPWD()){
			return submitFail('패스워드');
		}
		if($('input[name=mber_password]').val()!=$('input[name=mber_passwordtmp]').val()){
			alert("비밀번호 확인이 일치하지 않습니다");
			return false;
		}
        
		if(!$('input[name=mber_nm]').val().validationNM()){
			return submitFail('성명');
		}
		return flag;
	});
   $('#mbtlnumUpdatebtn').click(function(){
	   if ( $('input[name=mber_mbtlnum]').is('[readonly="true"]') ) { 
		   $('input[name=mber_mbtlnum]').attr("readonly",false)
	   }else{
		   	$.ajax({
			type : 'POST',
			url : '${pageContext.request.contextPath}/user/member/update.do',
			dataType : 'json',
			data : { mber_id : $('input[name=mber_id]').val(),mber_mbtlnum : $('input[name=mber_mbtlnum]').val() },
			error : function(result){
				alert(result.status + ' | ' + result.responseText);
			},
			success : function(result){
				alert(result.result);
				flag=result.result
			}
			});
		   $('input[name=mber_mbtlnum]').attr("readonly",true)
	   }
	   
   });
   
   $('#mailUpdatebtn').click(function(){
	   if ( $('input[name=mber_email]').is('[readonly="true"]') ) { 
		   $('input[name=mber_email]').attr("readonly",false);
	   }else{
		   	$.ajax({
			type : 'POST',
			url : '${pageContext.request.contextPath}/user/member/update.do',
			dataType : 'json',
			data : { mber_id : $('input[name=mber_id]').val(),mber_email : $('input[name=mber_email]').val() },
			error : function(result){
				alert(result.status + ' | ' + result.responseText);
			},
			success : function(result){
				alert(result.result);
				flag=result.result
			}
			});
		   $('input[name=mber_email]').attr("readonly",true)
	   }
	   
   });
   
   $('#ncnmUpdatebtn').click(function(){
	   if ( $('input[name=mber_ncnm]').is('[readonly="true"]') ) { 
		   $('input[name=mber_ncnm]').attr("readonly",false)
	   }else{
		   	$.ajax({
			type : 'POST',
			url : '${pageContext.request.contextPath}/user/member/update.do',
			dataType : 'json',
			data : { mber_id : $('input[name=mber_id]').val(),mber_ncnm : $('input[name=mber_ncnm]').val() },
			error : function(result){
				alert(result.status + ' | ' + result.responseText);
			},
			success : function(result){
				alert(result.result);
				flag=result.result
			}
			});
		   $('input[name=mber_ncnm]').attr("readonly",true)
	   }
   });
});
function submitFail(tagNM){
	alert(tagNM + '가 부적절합니다. 바르게 입력해주세요.');
	return false;
}

</script>
</html>