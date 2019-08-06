<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
$(function(){
	$("#btn1").on("click", function(){
		$.ajax({
			url : "/user/main/control/sendmessage.do",
			type : "post",
			success : function(result){
				console.log("sendMessage result : " + result.result);
			},
			error : function(error){
				console.log(error.status);
			}
		})
	});
	
	$("#answerBtn").on("click",function(){
		$.ajax({
			url : "/user/main/control/answer.do",
			type : "post",
			success : function(result){
				console.log("result : " + result.result);
			},
			error : function(error) {
				console.log("error : " + error.status);
			}
		})
	})
	
	$("#alarmBtn").on("click",function(){
		$.ajax({
			url : "/user/main/control/alarm.do",
			type : "post",
			success : function(result){
				console.log("result : " + result.result);
			},
			error : function(error){
				console.log("error : " + error.status);
			}
		})
	})
})
</script>
</head>
<body>
<div class="row">&nbsp;</div>
<div class="row">&nbsp;</div>
<div class="row">&nbsp;</div>
<div class="row">&nbsp;</div>
<div class="row">&nbsp;</div>
<div class="row">&nbsp;</div>
<div class="container">
	<div class="row">
		<button id="btn1" class="btn btn-info">알람보내기</button>
	</div>
<div class="row">&nbsp;</div>
<div class="row">&nbsp;</div>
	<div class="row">
		<button id="answerBtn" class="btn btn-success">답변달기</button>
	</div>
<div class="row">&nbsp;</div>
<div class="row">&nbsp;</div>
	<div class="row">
		<button id="alarmBtn" class="btn btn-success">알</button>
	</div>
</div>
</body>
</html>