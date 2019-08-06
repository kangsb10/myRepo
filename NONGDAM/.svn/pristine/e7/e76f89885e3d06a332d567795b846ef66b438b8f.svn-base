<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>
<!-- 
	1. 서버(비대칭키 방식 :공개키, 비밀키 작성)가 클라이언트에게 공개키 제공
		* 공개키와 비밀키 페어로 생성되고 1회 사용 후 폐기 및 신규 생성
	2. 클라이언트 취득한 공개키를 활용해서 평문을 암호문으로 변환
	3. 클라이언트 서버로 전송한 암호문을 서버 내 저장된 비밀키를 활용해서 암호문을 평문으로 변환
	
	환경 설정
	1. 클라이언트단 RSA 암호화 알고리즘을 활용한 암호화가 필요
		1.1js 라이브러리 다운로드
			http://www-cs-students.stanford.edu/~tjw/jsbn
			jsbn.js , rsa.js ,  prng4.js ,rng.js  다운  /js/import
			-> 순서로 임포트
 -->
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
	<form name='loginForm'
		action='${pageContext.request.contextPath }/user/member/insertMember.do'
		method="post">
		<div class='blurred-container'>

			<div class="container login-container" style="position: relative; top: 50px;">
				<div class="col-md-6 login-form-1">
					<form>
							<label for="inputId" class="col-lg-2 control-label">아이디</label>
						<div class="input-group col-md-8" style="padding-right:10px;" >
								<input id="mber_id" name="mber_id" class="form-control" placeholder="아이디"
								required="" type="text"  data-parsley-type="text" data-parsley-error-message="아이디를 입력하세요."
								data-parsley-errors-container="div[id='m_id_error']"/>
								<span class="input-group-btn">
									<button id="confirm" type="button" onclick="idCheck()" class="btn btn-success" style="background-color: white; border-color: skyblue; color: skyblue;">중복검사</button>
									<input type="hidden" id="check" value="no"/>
								</span>	
							</div>
							<br />
						<div class="form-group" id="divPassword">
							<label for="inputPassword" class="col-lg-2 control-label">비밀번호</label>
							<div class="col-lg-10">
								<input type="password" class="form-control" id="mber_password"
									name="mber_password" data-rule-required="true" 
									placeholder="비밀번호" maxlength="30">
							</div>
						</div>
						<div class="form-group" id="divPasswordCheck">
							<label for="inputPasswordCheck" class="col-lg-2 control-label">비밀번호
								확인</label>
							<div class="col-lg-10">
								<input type="password" class="form-control" id="mber_passwordtmp" name="mber_passwordtmp"
									data-rule-required="true" placeholder="비밀번호 확인" maxlength="30">
							</div>
						</div>
						
						
						<div class="form-group" id="divPhoneNumber">
								<label for="inputId" class="col-lg-2 control-label">핸드폰</label>
						<div class="input-group col-md-8" style="padding-right:10px;">
								<input id="mber_mbtlnum" name="mber_mbtlnum" class="form-control" placeholder="핸드폰번호를 입력하세요"
								required="" type="text"  data-parsley-type="text" data-parsley-error-message="핸드폰번호를 입력하세요."
								data-parsley-errors-container="div[id='m_id_error']"/>
								<span class="input-group-btn">
									<button id="confirm" type="button" onclick="danal()" class="btn btn-success" style="background-color: white; border-color: skyblue; color: skyblue;">본인인증</button>
									<input type="hidden" id="check" value="no"/>
								</span>	
							</div>
						</div>
						
						<div class="form-group" id="divName">
							<label for="inputName" class="col-lg-2 control-label">이름</label>
							<div class="col-lg-10">
								<input type="text" class="form-control onlyHangul" id="mber_nm" name="mber_nm"
									data-rule-required="true" placeholder="이름"
									maxlength="15">
							</div>
						</div>
						
						<div class="form-group" id="divEmail">
							<label for="inputEmail" class="col-lg-2 control-label">이메일</label>
							<div class="col-lg-10">
								<input type="email" class="form-control" id="mber_email" name="mber_email"
									data-rule-required="true" placeholder="이메일" maxlength="40">
							</div>
						</div>

						<div class="form-group" id="divNickname">
							<label for="inputNickname" class="col-lg-2 control-label">닉네임</label>
							<div class="col-lg-10">
								<input type="text" class="form-control" id="mber_ncnm" name="mber_ncnm"
									data-rule-required="true" placeholder="닉네임" maxlength="15">
							</div>
						</div>
						
						<div class="form-group" id="divAddress">
							<label for="inputNickname" class="col-lg-2 control-label">주소</label>
							<div class="col-lg-10">
<!-- 								<input type="text" class="form-control" id="zipCode" -->
<!-- 									data-rule-required="true" placeholder="우편번호" maxlength="15" style="width:150px; float: left; "> -->
<!-- 								<input type="button" value="우편번호 찾기" style="background-color: white; border-color: skyblue; color: skyblue;"> -->
									
									<br/>
									<input type="text" id="mber_zip" name="mber_zip" placeholder="우편번호">
									<input type="button" onclick="addr_Search()" value="우편번호 찾기"><br>
									<input type="text" id="mber_bass_adres" name="mber_bass_adres" placeholder="주소"><br>
									<input type="text" id="mber_detail_adres" name="mber_detail_adres" placeholder="상세주소">
						<div id="layer1" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
							<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
						</div>
							</div>
						</div >
						<label for="inputNickname" class="col-lg-2 control-label">농장주소</label>
						<br/>
						<input type="text" id="mber_farmng_adres" name="mber_farmng_adres" placeholder="농장주소">
						<input type="button" onclick="Farm_Search()" value="농장주소 찾기"><br>
						
						<input type="button" onclick="sample2_execDaumPostcode()" value="우편번호 찾기"><br>
						<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
							<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
						</div>
<!-- 						<div id="wrap1" style="display:none;border:1px solid;width:300px;height:300px;margin:5px 0;position:relative"> -->
<!-- 								<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼"> -->
<!-- 						</div> -->
						<br/>
						<br/>
						<input type="submit" id="joinMember"  value="회원가입" >
						

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
<script>
    // 우편번호 찾기 찾기 화면을 넣을 element
    var flag;
//     var element_wrap = document.getElementById('wrap');
//     var element_wrap1 = document.getElementById('wrap1');

    var element_layer = document.getElementById('layer');
    var element_layer1 = document.getElementById('layer1');

    function closeDaumPostcode() {
        // iframe을 넣은 element를 안보이게 한다.
        element_layer.style.display = 'none';
        element_layer1.style.display = 'none';
    }
    function foldDaumPostcode() {
        // iframe을 넣은 element를 안보이게 한다.
        element_wrap.style.display = 'none';
//         element_wrap1.style.display = 'none';
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
				if(result.result=="사용할 수 있는 아이디 입니다."){
					flag=true;
				}else{
				flag=false;
				}
			}
		});
	}
    function addr_Search() {
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
                document.getElementById('mber_zip').value = data.zonecode;
                document.getElementById("mber_farmng_adres").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("mber_farmng_adres").focus()

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
    

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
//                 document.getElementById('mber_zip').value = data.zonecode;
//                 document.getElementById("mber_farmng_adres").value = addr;
//                 // 커서를 상세주소 필드로 이동한다.
//                 document.getElementById("mber_detail_adres").focus();

               
//     function addr_Search() {
//         // 현재 scroll 위치를 저장해놓는다.
//         var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
//         new daum.Postcode({
//             oncomplete: function(data) {
//                 // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

//                 // 각 주소의 노출 규칙에 따라 주소를 조합한다.
//                 // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
//                 var addr = ''; // 주소 변수
//                 var extraAddr = ''; // 참고항목 변수

//                 //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
//                 if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
//                     addr = data.roadAddress;
//                 } else { // 사용자가 지번 주소를 선택했을 경우(J)
//                     addr = data.jibunAddress;
//                 }

//                 // 우편번호와 주소 정보를 해당 필드에 넣는다.
//                 document.getElementById('mber_zip').value = data.zonecode;
//                 document.getElementById("mber_farmng_adres").value = addr;
//                 // 커서를 상세주소 필드로 이동한다.
//                 document.getElementById("mber_detail_adres").focus();

//                 // iframe을 넣은 element를 안보이게 한다.
//                 // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
//                 element_wrap.style.display = 'none';

//                 // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
//                 document.body.scrollTop = currentScroll;
//             },
//             // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
//             onresize : function(size) {
//                 element_wrap.style.height = size.height+'px';
//             },
//             width : '100%',
//             height : '100%'
//         }).embed(element_wrap);

//         // iframe을 넣은 element를 보이게 한다.
//         element_wrap.style.display = 'block';
//     }
    
    
    function sample2_execDaumPostcode() {
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
    
    
    
    
    
    
    
    
    
    
    
//     function Farm_Search() {
//         // 현재 scroll 위치를 저장해놓는다.
//         var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
//         new daum.Postcode({
//             oncomplete: function(data) {
//                 // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

//                 // 각 주소의 노출 규칙에 따라 주소를 조합한다.
//                 // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
//                 var addr = ''; // 주소 변수
//                 var extraAddr = ''; // 참고항목 변수

//                 //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
//                 if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
//                     addr = data.roadAddress;
//                 } else { // 사용자가 지번 주소를 선택했을 경우(J)
//                     addr = data.jibunAddress;
//                 }

//                 // 우편번호와 주소 정보를 해당 필드에 넣는다.
//                 document.getElementById("mber_farmng_adres").value = addr;
//                 // 커서를 상세주소 필드로 이동한다.

                
//                 // iframe을 넣은 element를 안보이게 한다.
//                 // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
//                 element_wrap.style.display = 'none';

//                 // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
//                 document.body.scrollTop = currentScroll;
                
//             },
//             // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
//             onresize : function(size) {
//                 element_wrap.style.height = size.height+'px';
//             },
//             width : '100%',
//             height : '100%'
//         }).embed(element_wrap);

//         // iframe을 넣은 element를 보이게 한다.
//         element_wrap.style.display = 'block';
//     }
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
// 		if(!$('input[name=mber_zip]').val().validationZIP()){
// 			return submitFail('우편번호');
// 		}
// 		if(!$('input[name=mem_hp]').val().validationHP()){
// 			return submitFail('휴대폰');
// 		}
// 		if(!$('input[name=mem_mail]').val().validationMAIL()){
// 			return submitFail('메일');
// 		}
		return flag;
	});
});
function submitFail(tagNM){
	alert(tagNM + '가 부적절합니다. 바르게 입력해주세요.');
	return false;
}

</script>
</body>
</html>