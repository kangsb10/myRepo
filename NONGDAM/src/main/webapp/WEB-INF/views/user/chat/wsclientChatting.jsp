<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath }/css/cropsDoctor.css" rel="stylesheet" />


<!-- Generic page styles -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/cropsdoctor/style.css">
<!-- blueimp Gallery styles -->
<link rel="stylesheet" href="https://blueimp.github.io/Gallery/css/blueimp-gallery.min.css">
<!-- CSS to style the file input field as button and adjust the Bootstrap progress bars -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/cropsdoctor/jquery.fileupload.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/cropsdoctor/jquery.fileupload-ui.css">
<!-- CSS adjustments for browsers with JavaScript disabled -->
<noscript><link rel="stylesheet" href="${pageContext.request.contextPath }/css/cropsdoctor/jquery.fileupload-noscript.css"></noscript>
<noscript><link rel="stylesheet" href="${pageContext.request.contextPath }/css/cropsdoctor/jquery.fileupload-ui-noscript.css"></noscript>
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon&display=swap&subset=korean" rel="stylesheet">
   <style>
      h1,p,span,a,div {
        font-family: 'Do Hyeon', sans-serif;
      }
      
      h1 {
        font-weight: 400;
         font-size: 25px;
         color: #E16422;
      }
      
      
      span,a {
        font-weight: 600;
         font-size: 18px;
         color: #E16422;
         
      }
      
      
      
      p.a {
        font-weight: 200;
        font-size: 15px;
        color: #346D4E;
      }
      
      p.b {
        font-weight: 200;
        font-size: 18px;
        color: #346D4E;
      }
      
      div#a, div#b {
        font-weight: 200;
        font-size: 20px;
        color: #346D4E;
      }
      input#msg {
        font-size: 20px;
        color: #585858;
      }
      textarea#chatlog {
        font-size: 20px;
        color: #585858;
      }
      
      
    </style>
<script type='text/javascript' src='${pageContext.request.contextPath }/js/validation.js'></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.form.min.js"></script>
<script type="text/javascript">
var ws;
var mber_ncnm = '${login_mberInfo.mber_ncnm}';
$(function(){
   // 웹소켓 서버 엔드포인트 컨넥션 및 스트리밍 관리 
   ws = new WebSocket("ws://192.168.201.30/wschat");
   ws.onopen = function() {
//       alert("채팅에 입장하였습니다.");
      ws.send(mber_ncnm + " 접속했다");
   };
   
   // 웹소켓 서버 엔드포인트로부터 수신 이벤트 리스너 
//    ws.onmessage = function(message) {
      // 메세지 수신(default 인코딩 타입 UTF-8 적용)
//       $("#chatlog").text($("#chatlog").text() + message.data + "\n");
//    };
   ws.onmessage = function(message) {
      // 메세지 수신(default 인코딩 타입 UTF-8 적용)
//      $("#chatlog").text($("#chatlog").text() + message.data + "\n");
         var data = $("#chatlog").text($("#chatlog").text() + message.data + "\n");
         $("#chatlog").append('${data}');
         var top = $("#chatlog").prop('scrollHeight');
         $("#chatlog").scrollTop(top);
//      var data = message.data;
//      $("#chatlog").append(data);
//      ws.close();
//       $("#chatlog").append(data);
//       $('#chatlog').scrollTop($('#chatlog').prop('scrollHeight'));
   };
   
});   
// 메세지 송신
function postToServer() {
   // 일반 문자열 전송(default 인코딩 타입 UTF-8 적용)
   if($('#msg').val() == null || $('#msg').val().trim() == ""){
      alert("내용을 입력해주세요.");
   }else{
      ws.send(mber_ncnm + " : " + $("#msg").val());
      $("#msg").val("");
   }
}
// WebSocket Server 컨넥션 종료
function closeConnect() {
   // // 웹소켓 서버 엔드포인트 대상 접속종료 이벤트 전파 
   ws.send(mber_ncnm + " 나갔다");
   $(location).attr('href',"${pageContext.request.contextPath}/user/main/main_mod.do")
   ws.close();
}

//엔터키처리
function onKeyDown()
{
     if(event.keyCode == 13)
     {
    	 postToServer();
     }
}
</script>
<title>Insert title here</title>
</head>
<body>
   <div class="container">&nbsp;</div>
   <div class="container">&nbsp;</div>
   <div class="container">&nbsp;</div>
   <div class="container">&nbsp;</div>
   <div class="container bootstrap snippet">
      <div class="row">
         <div class="col-xs-12">
            <div class="portlet portlet-default">
               <div class="portlet-heading">
                  <div class="portlet-title">
                     <h4><i class="fa fa-circle text-green"></i>채팅</h4>
                  </div>
                  <div class="clearfix"></div>
               </div>
               <div id="chat" class="panel-collapse collapse in"  >
                  <div>
                        <textarea id="chatlog" class="portlet-body chat-widget" style="overflow-x:hidden; overflow-y:auto; width; height:500px;" readonly="readonly"></textarea><br/>
                  </div>
                  <!-- footer -->
                  <div class="portlet-footer">
                     <div class="row" style="height: 30px;">
                        <div class="form-group col-xs-10">
                           <input id="msg" type="text" class="form-control" onkeyup="onKeyDown();" placeholder="메시지 입력하세요" />
                        </div>
                     </div>
                  </div>
                  <div class="portlet-footer">
                     <div class="row" >
                        <div class="form-group col-xs-3" >
                           <button type="submit" id="sendButton" style="width:80px;" onClick="postToServer();">전송</button>
                        </div> 
                        <div class="form-group col-xs-2">
                           <button type="submit" id="sendButton" style="width:80px;" onClick="closeConnect();">종료</button>
                        </div>   
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
</body>
</html>