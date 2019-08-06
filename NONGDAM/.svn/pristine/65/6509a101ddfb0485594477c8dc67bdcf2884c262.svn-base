<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<script type='text/javascript' src='http://code.jquery.com/jquery-latest.js'></script>
<script type='text/javascript' src='${pageContext.request.contextPath }/js/validation.js'></script>
<script type='text/javascript' src='${pageContext.request.contextPath }/js/cookieControl.js'></script>
<script type='text/javascript' src='${pageContext.request.contextPath}/js/jsbn.js'> </script>
<script type='text/javascript' src='${pageContext.request.contextPath}/js/rsa.js'> </script>
<script type='text/javascript' src='${pageContext.request.contextPath}/js/prng4.js'> </script>
<script type='text/javascript' src='${pageContext.request.contextPath}/js/rng.js'> </script>
<script type='text/javascript'>
// JSDT 설치 : http://code.google.com/a/eclipselabs.org/p/jquerywtp/downloads/list
// 활성화된 윈도우 : 2층 : 이클립스 설치경로\plugins\org.eclipse.wst.jsdt.core_1.3.300.v201410221502.jar
//					1층 : 새로 작성될 라이브러리 위치 경로
//						[generate]
//3. 신규 작성된 라이브러리를 이클립스 설치경로 \plugins에 덮어쓰기
//4. 이클립스 종료
//5. WorkSpace\.metadata\.plugins\org.eclipse.wst.jsdt.core 삭제
//6. 이클립스 실행
//1 login Form.jsp 아이디,패스워드 입력
//					*체크박스 아이디 저장 : 체크
//					[로그인]
//2.loginCheck.jsp	회원이 아닌경우
//3.loginForm.jsp?message = 회원이 아닙니다.
//						아이디 출력
//						*체크박스 체크


//1.loginForm.jsp		아이디,패스워드 입력
//						*체크박스 아이디 저장 : 미체크
//						[로그인]
//2.loginCheck.jsp		회원이 아닌경우
//3.loginForm.jsp?message=회원이 아닙니다.
		//				아이디미출력
		//				*체크박스 미체크

// 자바스크립트 	인코딩		/	디코딩
//				escape()		unescape() : 유니코드 형식으로 값을 인코딩/디코딩
//											 기호를 포함해서.
//				encodeURI()		decodeURI(): 유니코드형식으로 값을 인코딩/디코딩
//											 기호를 비포함.
//		encodeURIComponent()	decodeURIComponent() : 유니코드 형식으로 값을 인코딩/디코딩
//														문자열 대상.
$(function(){
 
	if(eval('${!empty message}')){
		alert('${message}');
	}
	$('form').submit(function(){
// 		if($('input[type=checkbox]').is(':checked')){
// 			Set_Cookie("saveID", $('input[name=mber_id]').val(), 1, '/');
// 		}else{
// 			Delete_Cookie("saveID", '/');
// 		}
		
		if($('input[name=mber_password]').val()!=$('input[name=mber_passwordtmp]').val()){
			alert("비밀번호 확인이 일치하지 않습니다");
			return false;
		}
		var modulus = '${publicKeyMap["publicKeyModulus"]}';
        var exponent = '${publicKeyMap["publicKeyExponent"]}';
        
        var rsaObject = new RSAKey();
        rsaObject.setPublic(modulus, exponent);
        
        var encryptPWD = rsaObject.encrypt($('input[name=mber_password]').val());
        
        $('input[name=mber_password]').val(encryptPWD);
		

		frm.append(mber_id);
		frm.append(mber_password);
		
		$(document.body).append(frm);
		
		frm.submit();
		return true;
	});
// 	$('#findIdbtn').click(function() {
// 		$.ajax({
// 			type : 'POST',
// 			url : '${pageContext.request.contextPath}/join/findId.do',
// 			dataType : 'json',
// 			data : { mber_nm : $('#mber_nm').val(), mber_mbtlnum : $('#mber_mbtlnum').val() },
// 			error : function(result){
// 				alert(result.status + ' | ' + result.responseText);
// 			},
// 			success : function(result){
// 				alert(result.result);
// 				flag=result.result
// 			}
// 		});
// 	});
	
});

</script>
<style type="text/css">
 body 
 { 
 background: url('${pageContext.request.contextPath }/img/background.jpg') no-repeat center center fixed; 
-webkit-background-size: cover;
-moz-background-size: cover;
-o-background-size: cover;
background-size: cover;
 } 

</style>
</head>
<body>
<form  name='loginForm'  action="${pageContext.request.contextPath }/join/pwdchange.do" method="post">
<div class='blurred-container'>
	<br/>
	<br/>
	<br/>
	<br/>
        <div class="container login-container">
        <div class="col-md-6 login-form-1">
                    <h3>응애</h3>
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="비밀번호" value="" name="mber_password" />
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="비밀번호 확인" value="" name="mber_passwordtmp" />
                        </div>
                        	<input type="hidden" name="mber_id" value="${memberInfo.mber_id }" /> 
                        <div class="form-group">
                            <input type="submit" class="btnSubmit" value="비밀번호 변경하기" />
                        </div>
                </div>
			</form>
        <div class="img-src" style="background-image: url('${pageContext.request.contextPath }/img/cover_4.jpg')"></div>
        <div class='img-src blur' style="background-image: url('${pageContext.request.contextPath }/img/cover_4_blur.jpg')"></div>
   </div>
</body>
</html>