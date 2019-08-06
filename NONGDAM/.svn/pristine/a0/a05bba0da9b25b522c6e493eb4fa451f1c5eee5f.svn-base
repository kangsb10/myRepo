<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/cropsdoctor/cropsdoctor.css">
<!-- CSS adjustments for browsers with JavaScript disabled -->
<noscript><link rel="stylesheet" href="${pageContext.request.contextPath }/css/cropsdoctor/jquery.fileupload-noscript.css"></noscript>
<noscript><link rel="stylesheet" href="${pageContext.request.contextPath }/css/cropsdoctor/jquery.fileupload-ui-noscript.css"></noscript>
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon&display=swap&subset=korean" rel="stylesheet">

<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.form.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/cropsdoctor/cropsDoctor.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/cropsdoctor/dotdotdot.js"></script>
<script type="text/javascript">
$(function(){
	
	send("인사");
	
	$("#chatContent").keypress(function(e){
		var keyCode = e.keyCode;
		if(keyCode == 13){
			$("#sendBtn").click();
		}
	});
	
	$("#sendBtn").on("click",function(){
		var myWord = $("#chatContent").val().trim();	// 전송할 입력값
		if(myWord == null || myWord == ""){
			alert('메세지를 입력하세요');
			return false;
		}
		send(myWord);
	});
	
	$("input[name=file]").on("change",function(){
		readURL(this);
		// ajax
		printDetail();
	});
	
})

</script>
<title>EungAe</title>
</head>
<body>
	<div class="container bootstrap snippet">
		<div class="row">
			<div class="col-xs-12">
				<div class="portlet portlet-default">
					<div class="portlet-heading">
						<div class="portlet-title">
							<h4><i class="fa fa-circle text-green"></i>Crops Doctor</h4>
						</div>
						<div class="clearfix"></div>
					</div>
					<div id="chat" class="panel-collapse collapse in">
						<div>
							<div id="chatList" class="portlet-body chat-widget" style="overflow-y:auto; width:auto; height:500px;">
							
							</div>
						</div>
						<!-- footer -->
						<div class="portlet-footer">
							<div class="row" style="height: 90px;">
								<div class="form-group col-xs-10">
									<input type="text" id="chatContent" class="form-control" placeholder="메시지 입력하라우">
								</div>
								<div class="form-group col-xs-2">
									<button type="button" id="sendBtn" class="btn btn-default pull-right">전송</button>
									<button type="button" id="notifyBtn">알림</button>
									<span class="btn btn-success fileinput-button">
					                    <span>사진</span>
				                    	<form id="imgForm" enctype="multipart/form-data" method="post">
				                    		<input type="file" name="file" accept="image/*;capture=camera">
				                    		<input type="hidden" name="object" value="">
				                    		<input type="hidden" name="method" value="">
				                    		<input type="hidden" name="entity" value="">
				                    		<input type="hidden" name="purpose" value="">
				                    	</form>
					                </span>
									<div class="clearfix"></div>
								</div>
								<div id="progDiv"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

<!-- PWA -->
<script src="${pageContext.request.contextPath }/js/cropsdoctor/pwa/app.js"></script>

<script defer src="${pageContext.request.contextPath }/js/cropsdoctor/pwa/material.min.js"></script>
<script src="${pageContext.request.contextPath }/js/cropsdoctor/pwa/promise.js"></script>
<script src="${pageContext.request.contextPath }/js/cropsdoctor/pwa/fetch.js"></script>
<script src="${pageContext.request.contextPath }/js/cropsdoctor/pwa/idb.js"></script>
<script src="${pageContext.request.contextPath }/js/cropsdoctor/pwa/utility.js"></script>

<%-- <script src="${pageContext.request.contextPath }/js/cropsdoctor/pwa/feed.js"></script> --%>

</html>
