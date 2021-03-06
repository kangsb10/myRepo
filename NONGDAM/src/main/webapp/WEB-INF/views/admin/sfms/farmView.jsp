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
h1,p,span,a,div,option,input,td,h3,h4 {
	font-family: 'Do Hyeon', sans-serif;
	color: #585858;
}

h1,h3 {
	font-weight: 400;
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


option,input {
	color: #346D4E;
}

div#a,div#b {
	font-weight: 200;
	font-size: 40px;
	color: #FFFFFF;
}

th {
	text-align: center;
}
/* .slidecontainer { */
/*   width: 100%; */
/* } */

.slider {
  -webkit-appearance: none;
  width: 170px;
  height: 13px;
  border-radius: 5px;
  background: #d3d3d3;
  outline: none;
  opacity: 0.7;
  -webkit-transition: .2s;
  transition: opacity .2s;
  z-index: 50;
}

.slider:hover {
  opacity: 1;
}

.slider::-webkit-slider-thumb {
/*   -webkit-appearance: none; */
   appearance: none; 
  width: 22px;
  height: 22px;
  border: 0;
/*   background-image: url( 'hot.png'); */
/*  background: url('/hot.png'); */
  background: #E16422;
  cursor: pointer;
  z-index: 51;
}

.slider::-moz-range-thumb {
  width: 22px;
  height: 22px;
  border: 0;
  background: url('/img/sfms/hot.png');
  cursor: pointer;
}



</style>
</head>

<form name="updateForm" method="post" enctype="multipart/form-data" action="${pageContext.request.contextPath}/admin/sfms/dataExtrac.do">
	<div>
		<ul >
			<li style="position: relative; left: 10px;  top:110px; font-size: 15px; color: #0B3B24; float: left;">${farmInfo.farm_id } | </li>
			<li style="position: relative; left: 20px; top: 105px; font-size: 20px; color: #0B3B24; float: left;">${farmInfo.farm_crops }</li>
		</ul>
	</div>
<div id="" style="position: relative; top: 100px;">
	<div class="">
	<!-- 모니터링 사진이나 영상 -->	
	<div class="single-property" style=" ">
        <div class="container">
            <div class="row spad-p">
                <div class="col-lg-12" >
                    <div class="property-title" >
                        <h3 style="float:left; margin-left: -100px; margin-top: 30px;" id=""></h3>
                    </div>
                </div> 
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="property-img owl-carousel">
                    	<!--  사진 없을때 그냥 img파일에서 가져옴 -->
<!--                     	<div class="single-img"> -->
<!-- 								<img src="/img/sfms/sfms_view.jpg" alt="" style=" width:380px; height:180px; border-radius: 25px; "> -->
<!--                         </div> -->
                        <!-- 파일아이템에서 모니터 사진이나 동영상 가져오기 -->
                        <c:if test="${!empty sensorInfo.items }">
							<c:forEach items="${sensorInfo.items }" var="fileItem" varStatus="stat">
                        <div class="single-img">
								<img src="/files/${fileItem.sensor_file_save_name }" alt="" style="width:150px;height:150px;">
                        </div>
							</c:forEach>
						</c:if>
						<c:if test="${empty sensorInfo.items }">
							<label style="color: red">사진이 없습니다.</label>
						</c:if>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Single Property End -->
    <!-- Single Property Deatails Section Begin -->
    <section class="property-details">
        <div class="container">
            <div class="row sp-40 spt-40">
                <div class="col-lg-8">
                    <div class="p-ins">
                    <!-- 모니터링 -->
                        <div class="row details-top" style="padding-top: 7px;">
                            <div class="col-lg-12">
                                <div class="t-details" style="">
                                	<div style="border-top : 1px solid #585858; height: 15px;  "  > </div>
                                	<!-- 온도 -->
                                    <div class="register-id" style="float: left; position: relative; left :10px; width: 80px; background-color: ; margin-top: -7px; margin-bottom: 7px;">
                                        <img src="/img/sfms/hot.png" width="30px" height="25px" style="">
                                            <i class="flaticon-bath"></i>
                                            <span id="sensor_tmprt" style="padding-left: 5px;" ></span>
                                    </div>
                                    <!-- 습도 -->
                                    <div class="register-id"  style="float: left; width: 80px;  position: relative; background-color: ; left:30px; margin-top: -7px; margin-bottom: 7px;" >
                                            <img src="/img/sfms/save-water.png" width="30px" height="28px">
                                            <i class="flaticon-bath"></i>
                                            <span  id="sensor_hd" style="padding-left: 5px;" ></span>
                                    </div>
                                    <!-- co2 -->
                                    <div class="register-id"  style="float: left; width: 80px;  position: relative; left:50px; margin-top: -7px; margin-bottom: 7px;" >
                                            <img src="/img/sfms/co2.png" width="30px" height="28px">
                                            <i class="flaticon-bath"></i>
                                            <span  id="sensor_co2" style="padding-left: 5px;"></span>
                                    </div>
                                    <!-- 풍속 -->
                                    <div class="register-id"  style="float: left; width: 80px;  position: relative; left:65px; margin-top: -7px; margin-bottom: 7px;" >
                                            <img src="/img/sfms/pinwheel.png" width="30px" height="26px">
                                            <i class="flaticon-bath"></i>
                                            <span  id="sensor_pblmrl" style="padding-left: 5px;" ></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        
                        <div class="row">
                            <div class="col-lg-12">
                                <div style="border-top : 1px solid #585858 ">
                                    <p id="ctvt_mth_cn" ></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
	
	<!-- 데이터 설정 -->
	<div>
		<p> | 스마트팜 설정을 변경하세요 | </p>
	</div>
	<!-- 온도설정 -->
	<div style="float: left; padding-top: -15px; padding-bottom: 10px;">
		 <div class="" style="float: left; position: relative; left :50px;   ">
                 <img src="/img/sfms/hot.png" width="40px" height="35px" style="">
         </div>
         <div class="" style=" float: left; margin-left: 70px; margin-top: 5px;"  >
			 <input type="range" min="1" max="50" value="${farmInfo.farm_tmprt }" class="slider" id="myRange_thermo" disabled="disabled">
				
		 </div>
		 <div style=" float: left; margin-left: 10px; "><p style="margin-top: -1px;">온도 : <span class="sp" id="demo_thermo" style="margin-left: 5px; "></span></p>
		 </div>
	</div>
	<!-- 습도설정 -->
	<div style="float: left; padding-top: -5px; padding-bottom: 10px;">
		 <div class="" style="float: left; position: relative; left :50px;   ">
                 <img src="/img/sfms/save-water.png" width="37px" height="32px" style="">
         </div>
         <div class="" style=" float: left; margin-left: 70px; margin-top: 5px;"  >
			 <input type="range" min="1" max="100" value="${farmInfo.farm_hd }" class="slider" id="myRange_hum" disabled="disabled">
				
		 </div>
		 <div style=" float: left; margin-left: 10px; "><p style="margin-top: -1px;">습도 : <span class="sp" id="demo_hum" style="margin-left: 5px; "></span></p>
		 </div>
	</div>
	
	<!-- co2설정 -->
	<div style="float: left; padding-top: -5px; padding-bottom: 10px;">
		 <div class="" style="float: left; position: relative; left :50px;   ">
                 <img src="/img/sfms/co2.png" width="36px" height="30px" style="">
         </div>
         <div class="" style=" float: left; margin-left: 70px; margin-top: 5px;"  >
			 <input type="range" min="1" max="100" value="${farmInfo.farm_co2 }" class="slider" id="myRange_co2" disabled="disabled">
				
		 </div>
		 <div style=" float: left; margin-left: 10px; "><p style="margin-top: -1px;">CO2 : <span class="sp"  id="demo_co2" style="margin-left: 5px; "></span></p>
		 </div> 
	</div>
	
	<!--  풍속설정 -->
	<div style="float: left; padding-top: -5px; padding-bottom: 8px;">
		 <div class="" style="float: left; position: relative; left :50px;   ">
                 <img src="/img/sfms/pinwheel.png" width="40px" height="35px" style="">
         </div>
         <div class="" style=" float: left; margin-left: 70px; margin-top: 5px;"  >
			 <input type="range" min="1" max="50" value="${farmInfo.farm_pblmrl }" class="slider" id="myRange_wnd" disabled="disabled">
				
		 </div>
		 <div style=" float: left; margin-left: 10px; "><p style="margin-top: -1px;">풍속 : <span class="sp" id="demo_wnd" style="margin-left: 5px; "></span></p>
		 </div>
	</div>
					<table border="1" style="margin: auto;">
						<tr>
							<td>작기일련번호</td>				
							<td><input type="hidden" value="${item.croppingSerlNo }" name="croppingSerlNo"/> ${item.croppingSerlNo }</td>
								
						</tr>
						<tr>
							<td>작기이름</td>				
							<td><input type="hidden" value="${item.croppingSeasonName }" name="croppingSeasonName"/>${item.croppingSeasonName }</td>				
						</tr>
						<tr>
							<td>정식일</td>				
							<td><input type="hidden" value="${item.croppingDate }" name="croppingDate"/>${item.croppingDate }</td>				
						</tr>
						<tr>
							<td>종료일</td>				
							<td><input type="hidden" value="${item.croppingEndDate }" name="croppingEndDate"/>${item.croppingEndDate }</td>				
						</tr>
						<tr>
							<td>재배방식</td>				
							<td><input type="hidden" value="${item.croppingSystem }" name="croppingSystem"/>${item.croppingSystem }</td>				
						</tr>
						<tr>
							<td>품목코드</td>				
							<td><input type="hidden" value="${item.itemCode }" name="itemCode"/>${item.itemCode }</td>				
						</tr>
						<tr>
							<td>재배면적</td>				
							<td><input type="hidden" value="${item.cultivationArea }" name="cultivationArea"/>${item.cultivationArea }</td>				
						</tr>
						<tr>
							<td>재배면적</td>				
							<td><input type="hidden" value="${item.calCultivationArea }" name="calCultivationArea"/>${item.calCultivationArea }</td>				
						</tr>
						<tr>
							<td>식재된 총 작물의 수</td>				
							<td><input type="hidden" value="${item.plantNum }" name="plantNum"/>${item.plantNum }</td>				
						</tr>
						<tr>
							<td>m2당 식재된 작물의 수</td>				
							<td><input type="hidden" value="${item.calPlantNum }" name="calPlantNum"/>${item.calPlantNum }</td>				
						</tr>
						<tr>
							<td>배지 1개당 작물의 줄기 수</td>				
							<td><input type="hidden" value="${item.stemSlabNum }" name="stemSlabNum"/>${item.stemSlabNum }</td>				
						</tr>
						<tr>
							<td>배지 1개당 작물의 수</td>				
							<td><input type="hidden" value="${item.planSlabNum }" name="planSlabNum"/>${item.planSlabNum }</td>				
						</tr>
						<tr>
							<td>재식밀도</td>				
							<td><input type="hidden" value="${item.plantDensity }" name="plantDensity"/>${item.plantDensity }</td>				
						</tr>
						<tr>
							<td>기준 재식밀도</td>				
							<td><input type="hidden" value="${item.standardPlantDensity }" name="standardPlantDensity"/>${item.standardPlantDensity }</td>				
						</tr>
						<tr>
							<td>투광율</td>				
							<td><input type="hidden" value="${item.floodlightDec }" name="floodlightDec"/>${item.floodlightDec }</td>				
						</tr>
						<tr>
							<td>엽면적기준</td>				
							<td><input type="hidden" value="${item.leafArea }" name="leafArea"/>${item.leafArea }</td>				
						</tr>
						<tr>
							<td>기준온도</td>				
							<td><input type="hidden" value="${item.stndTemp }" name="stndTemp"/>${item.stndTemp }</td>				
						</tr>
						<tr>
							<td>기준과중</td>				
							<td><input type="hidden" value="${item.stndWeight }" name="stndWeight"/>${item.stndWeight }</td>				
						</tr>
						<tr>
							<td>기준광</td>				
							<td><input type="hidden" value="${item.stndSolar }" name="stndSolar"/>${item.stndSolar }</td>				
						</tr>
						<tr>
							<td>기초대사</td>				
							<td><input type="hidden" value="${item.stndMeta }" name="stndMeta"/>${item.stndMeta }</td>				
						</tr>
					</table>
					<input type="hidden" value="${item.statusCode }" name="statusCode">
					<input type="hidden" value="${item.statusMessage }" name="StatusMessage">
					
	<div style="float: left; position: absolute; left: 10px; top: 850px;">
		<button type="button" id="listBt" style=" color: #fff; background: #0B3B24; border-radius: 20px; padding: 5px 12px 5px 12px; border: 0;" >농장리스트</button>
	</div>
	<div style="float: left; position: absolute; left: 160px; top: 850px;">
		<button type="submit" id="updateBt" style=" color: #fff; background: #E16422; border-radius: 20px; padding: 5px 12px 5px 12px; border: 0;" >데이터추출</button>
	</div>
</div>
</form>

<!-- Javascript 
================================================== -->
<script src="/js/main/jquery.js"></script>
<script src="/js/main/wow.min.js"></script>
<script src="/js/main/custom.js"></script>

 <script src="/js/view/jquery.nice-select.min.js"></script>
    <script src="/js/view/owl.carousel.min.js"></script>
    <script src="/js/view/jquery-ui.min.js"></script>
    <script src="/js/view/jquery.slicknav.js"></script>
    <script src="/js/view/main.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-slider/10.6.1/bootstrap-slider.js"></script>
	


<script type="text/javascript">


 $(function(){
	 

	
	$('#sensor_tmprt').text(${sensorInfo.sensor_tmprt });
	$('#sensor_hd').text(${sensorInfo.sensor_hd });
	$('#sensor_co2').text(${sensorInfo.sensor_co2 });
	$('#sensor_pblmrl').text(${sensorInfo.sensor_pblmrl  });
	
	 
	/* 농장 목록가기 */
	$('#listBt').click(function() {
			$(location).attr('href', '/admin/sfms/farmList.do');
	});
	// 데이터테스트
	
	/* 온도, 습도, co2, 풍속 설정*/
	
	   var slider_thermo = document.getElementById("myRange_thermo");
	   var slider_hum = document.getElementById("myRange_hum");
	   var slider_co2 = document.getElementById("myRange_co2");
	   var slider_wnd = document.getElementById("myRange_wnd");
	   
	   var output_thermo = document.getElementById("demo_thermo"); 
	   var output_hum = document.getElementById("demo_hum"); 
	   var output_co2 = document.getElementById("demo_co2"); 
	   var output_wnd = document.getElementById("demo_wnd"); 
	   
	   output_thermo.innerHTML = slider_thermo.value;
	   output_hum.innerHTML = slider_hum.value;
	   output_co2.innerHTML = slider_co2.value;
	   output_wnd.innerHTML = slider_wnd.value;
		
	   //아작스로 변경
// 	   slider_thermo.oninput
// 	slider_thermo.oninput = function() {
// 		if(${farmInfo.farm_tmprt }==this.value){
		 
// 		}else{
// 				output_thermo.innerHTML = this.value;
// 				var farm_tmprt = this.value;
// 				var farm_id ='${farmInfo.farm_id}';
// 			 // farm의 기준온도 변경시 farm_id 테이블의 기준 온도
// 				$.ajax({
// 					type : 'POST',
// 					url : '${pageContext.request.contextPath}/user/sfms/updateFarm.do',
// 					dataType : 'json',
// 					data : { farm_tmprt : this.value , farm_id :farm_id},
// 					error : function(result){
// 						alert(result.status + ' | ' + result.responseText);
// 					},
// 					success : function(result){
// 					}
// 				});
			      
			
// 			   var sensor_tmprt = $('#sensor_tmprt').text();
// 			   var sensor_no = '${sensorInfo.sensor_no}';
// 			   if(sensor_tmprt<farm_tmprt){
// // 				   alert(sensor_tmprt);
// // 				   alert(farm_tmprt);
// 				   for(var i = $('#sensor_tmprt').text(); i<=farm_tmprt; i++){
// 						// timer로 설정한 시간마다 온도를 변경하여 설정과 센서 온도를 같게 만들어줌
// 						tmprtloop(i,sensor_tmprt);
// 				   }
// 			   }else if(sensor_tmprt>farm_tmprt){
				   
// 				   for(var i = $('#sensor_tmprt').text(); i>=farm_tmprt; i--){
// 					   tmprtloops(i,sensor_tmprt);
// 				   }
// 			   }
			   
// 		}
		
// 	}
	   
// 	//온도 올랐을때
// 	function tmprtloop(i,temp){
// 		setTimeout(function(){
// 			var value = i;
// 			$('#sensor_tmprt').text(value);
// 				//센서의 온도변경
// 				$.ajax({
// 					type : 'POST',
// 					url : '${pageContext.request.contextPath}/user/sfms/updateSensor.do',
// 					dataType : 'json',
// 					data : { sensor_tmprt : value , sensor_no : '${sensorInfo.sensor_no}' },
// 					error : function(result){
// 						alert(result.status + ' | ' + result.responseText);
// 					},
// 					success : function(result){
// 					}
// 				});
			
// 		},1000*(i-temp));
// 	}
// 	// 온도 떨어졌을때
// 	function tmprtloops(i,temp){
// 		setTimeout(function(){
// 			var value = i;
// 			$('#sensor_tmprt').text(value);
// 				//센서의 온도변경
// 				$.ajax({
// 					type : 'POST',
// 					url : '${pageContext.request.contextPath}/user/sfms/updateSensor.do',
// 					dataType : 'json',
// 					data : { sensor_tmprt : value , sensor_no : '${sensorInfo.sensor_no}' },
// 					error : function(result){
// 						alert(result.status + ' | ' + result.responseText);
// 					},
// 					success : function(result){
// 					}
// 				});
// 		},1000*(temp-i))
// 	}
	   
	
	
// 	  slider_hum.oninput = function() {
// 	     if(${farmInfo.farm_hd }==this.value){
	    	 
// 	     }else{
// 			 output_hum.innerHTML = this.value;
// 			 var farm_hd = this.value;
// 			 var farm_id = '${farmInfo.farm_id}';
// 			// farm의 기준습도 변경시 업데이트
// 		     $.ajax({
// 					type : 'POST',
// 					url : '${pageContext.request.contextPath}/user/sfms/updateFarm.do',
// 					dataType : 'json',
// 					data : { farm_hd : farm_hd , farm_id : farm_id},
// 					error : function(result){
// 						alert(result.status + ' | ' + result.responseText);
// 					},
// 					success : function(result){
// 					}
// 				});
// 		     var sensor_hd = $('#sensor_hd').text();
// 			 var sensor_no = '${sensorInfo.sensor_no}';
			 
			 
// 			 if(sensor_hd<farm_hd){
				 
// 				   for(var i = $('#sensor_hd').text(); i<=farm_hd; i++){
// 						hdloop(i,sensor_hd);
// 				   }
				   
// 			   }else if(sensor_hd>farm_hd){
				   
				   
// 				   for(var i = $('#sensor_hd').text(); i>=farm_hd; i--){
// 					   hdloops(i,sensor_hd);
// 				   }
				   
// 			}
			
// 	     }
// 	   }
	  
// 	  // 습도 올라갔을때
// 	  function hdloop(i,temp){
// 		  var value = i;
// 		  setTimeout(function(){
// 			  $('#sensor_hd').text(value);
// 				$.ajax({
// 					type : 'POST',
// 					url : '${pageContext.request.contextPath}/user/sfms/updateSensor.do',
// 					dataType : 'json',
// 					data : { sensor_hd : value , sensor_no : '${sensorInfo.sensor_no}' },
// 					error : function(result){
// 						alert(result.status + ' | ' + result.responseText);
// 					},
// 					success : function(result){
// 					}
// 				});
			
// 		},1000*(i-temp));
		  
// 	  }
// 	  // 습도 내려갔을때
// 	  function hdloops(i,temp){
// 		  var value = i;
// 		  setTimeout(function(){
// 			  $('#sensor_hd').text(value);
// 				//센서의 온도변경
// 				$.ajax({
// 					type : 'POST',
// 					url : '${pageContext.request.contextPath}/user/sfms/updateSensor.do',
// 					dataType : 'json',
// 					data : { sensor_hd : value , sensor_no : '${sensorInfo.sensor_no}' },
// 					error : function(result){
// 						alert(result.status + ' | ' + result.responseText);
// 					},
// 					success : function(result){
// 					}
// 				});
			
// 		},1000*(temp-i));
		  
// 	  }
	  
	  
	  
// 	   slider_co2.oninput = function() {
// 		   if(${farmInfo.farm_co2 }==this.value){
			   
// 		   }else{
// 		     output_co2.innerHTML = this.value;
// 		     var farm_co2 = this.value;
// 		     var farm_id = '${farmInfo.farm_id}';
// 		  // farm의 기준co2 변경시 업데이트
// 		     $.ajax({
// 					type : 'POST',
// 					url : '${pageContext.request.contextPath}/user/sfms/updateFarm.do',
// 					dataType : 'json',
// 					data : { farm_co2 : farm_co2 , farm_id : farm_id},
// 					error : function(result){
// 						alert(result.status + ' | ' + result.responseText);
// 					},
// 					success : function(result){
// 					}
// 				});
		  
		  
		  	
// 		     var sensor_co2 = $('#sensor_co2').text();
// 			 var sensor_no = '${sensorInfo.sensor_no}';
			 
// 			 if(sensor_co2<farm_co2){
				 
// 				   for(var i = $('#sensor_co2').text(); i<=farm_co2; i++){
// 						co2loop(i,sensor_co2);
// 				   }
				   
// 			 }else if(sensor_co2>farm_co2){
				   
				   
// 				   for(var i = $('#sensor_co2').text(); i>=farm_co2; i--){
// 					   co2loops(i,sensor_co2);
// 				   }
				   
// 			}
// 		   }
// 	   }
// 	   // co2 올라갔을때
// 		  function co2loop(i,temp){
// 			  var value = i;
// 			  setTimeout(function(){
// 				  $('#sensor_co2').text(value);
// 					$.ajax({
// 						type : 'POST',
// 						url : '${pageContext.request.contextPath}/user/sfms/updateSensor.do',
// 						dataType : 'json',
// 						data : { sensor_co2 : value , sensor_no : '${sensorInfo.sensor_no}' },
// 						error : function(result){
// 							alert(result.status + ' | ' + result.responseText);
// 						},
// 						success : function(result){
// 						}
// 					});
				
// 			},1000*(i-temp));
			  
// 		  }
// 		  // co2 내려갔을때
// 		  function co2loops(i,temp){
// 			  var value = i;
// 			  setTimeout(function(){
// 				  $('#sensor_co2').text(value);
// 					//센서의 온도변경
// 					$.ajax({
// 						type : 'POST',
// 						url : '${pageContext.request.contextPath}/user/sfms/updateSensor.do',
// 						dataType : 'json',
// 						data : { sensor_co2 : value , sensor_no : '${sensorInfo.sensor_no}' },
// 						error : function(result){
// 							alert(result.status + ' | ' + result.responseText);
// 						},
// 						success : function(result){
// 						}
// 					});
				
// 			},1000*(temp-i));
			  
// 		  }
	   
	   
	   
	   
// 	   slider_wnd.oninput = function() {
// 			if(${farmInfo.farm_pblmrl }==this.value){
			   
// 		    }else{
// 		  		 output_wnd.innerHTML = this.value;
// 		  		 var farm_pblmrl = this.value;
// 		  		 var farm_id = '${farmInfo.farm_id}';
// 		  	// farm의 기준풍속 변경시 업데이트
// 		  		$.ajax({
// 					type : 'POST',
// 					url : '${pageContext.request.contextPath}/user/sfms/updateFarm.do',
// 					dataType : 'json',
// 					data : { farm_pblmrl : this.value , farm_id : farm_id},
// 					error : function(result){
// 						alert(result.status + ' | ' + result.responseText);
// 					},
// 					success : function(result){
// 					}
// 				});
		  	
// 		  		var sensor_pblmrl = $('#sensor_pblmrl').text();
// 				var sensor_no = '${sensorInfo.sensor_no}';
				 
// 				if(sensor_pblmrl<farm_pblmrl){
					 
// 				   for(var i = $('#sensor_pblmrl').text(); i<=farm_pblmrl; i++){
// 					   pblmrlloop(i,sensor_pblmrl);
// 				   }
					   
// 				}else if(sensor_pblmrl>farm_pblmrl){
					   
					   
// 				   for(var i = $('#sensor_pblmrl').text(); i>=farm_pblmrl; i--){
// 					   pblmrlloops(i,sensor_pblmrl);
// 				   }
					   
// 				}
		  	
// 		  	}
			
		
// 			 // 풍속 올라갔을때
// 			  function pblmrlloop(i,temp){
// 				  var value = i;
// 				  setTimeout(function(){
// 					  $('#sensor_pblmrl').text(value);
// 						$.ajax({
// 							type : 'POST',
// 							url : '${pageContext.request.contextPath}/user/sfms/updateSensor.do',
// 							dataType : 'json',
// 							data : { sensor_pblmrl : value , sensor_no : '${sensorInfo.sensor_no}' },
// 							error : function(result){
// 								alert(result.status + ' | ' + result.responseText);
// 							},
// 							success : function(result){
// 							}
// 						});
					
// 				},1000*(i-temp));
				  
// 			  }
// 			  // 풍속 내려갔을때
// 			  function pblmrlloops(i,temp){
// 				  var value = i;
// 				  setTimeout(function(){
// 					  $('#sensor_pblmrl').text(value);
// 						//센서의 온도변경
// 						$.ajax({
// 							type : 'POST',
// 							url : '${pageContext.request.contextPath}/user/sfms/updateSensor.do',
// 							dataType : 'json',
// 							data : { sensor_pblmrl : value , sensor_no : '${sensorInfo.sensor_no}' },
// 							error : function(result){
// 								alert(result.status + ' | ' + result.responseText);
// 							},
// 							success : function(result){
// 							}
// 						});
					
// 				},1000*(temp-i));
				  
// 			  }
			  
// 	   }
 });

</script>
</html>