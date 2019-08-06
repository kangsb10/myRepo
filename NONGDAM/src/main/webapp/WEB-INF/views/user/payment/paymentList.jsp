<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<head>
<!--




	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=Edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="keywords" content="">
	<meta name="description" content="">



	 Bootstrap CSS
   ================================================== -->
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
  <link href="https://fonts.googleapis.com/css?family=Do+Hyeon&display=swap&subset=korean" rel="stylesheet">
	<style>
      h1,p,span,a,div,option,input,td {
        font-family: 'Do Hyeon', sans-serif;
         color: #585858;
      }
      
      h1 {
        font-weight: 400;
         font-size: 25px;
         color: #FEEACC;
      }
      
      
      span,a {
        font-weight: 300;
         font-size: 20px;
         color: #FBD9A7;
      }
      
      
      
      p {
        font-weight: 200;
        font-size: 15px;
        color: #FFFFFF;
      }
      
     option,input {
        color: #346D4E;
      }
      
      div#a, div#b {
        font-weight: 200;
        font-size: 40px;
        color: #FFFFFF;
      }
      
      th {
      text-align: center;
      }
      
      
    </style>
</head>


<div id="" style="position: relative; top: 100px;" >
<button type="button" id="insertBt" style=" color: #fff; background: #E16422; border-radius: 20px; padding: 5px 12px 5px 12px; border: 0; position: relative; left: 170px; top: 0px;" >+</button>
	<div class="" >
    	<div class="" style="font-size: 30px; color:#0B3B24;" >구매내역</div>
		<table class="" style="position: relative; top: 20px; ">
			<thead>
				<tr style="border-bottom: 1px solid #848484; text-align: center; ">
					<th scope="col" width="10%">번호</th>
					<th scope="col" width="40%">상품이름</th>
					<th scope="col" width="15%">구매수량</th>
					<th scope="col" width="20%">총구매가</th>
					<th scope="col" width="15%">구매일시</th>
				</tr>
			</thead>
			<tbody id="cultlvationMethodTBL" >
			<c:choose>
				<c:when test="${empty paymentList }">
					<tr>
						<td colspan="5" align="center"><font color="red">구매내역이 없습니다.</font></td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${paymentList }" var="paymentInfo">
						<tr>
							<td>${paymentInfo.rnum}</td>
							<td>${paymentInfo.goods_id}</td>
							<td>${paymentInfo.goods_qty}</td>
							<td style="font-size: 5px;">${paymentInfo.total_price}</td>
							<td>${paymentInfo.payment_day}</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
			</tbody>
		</table>
		
		<div style="position: relative; top: 30px;">
		${pagingHtmls }
		</div>
		
	</div>
</div>

<!-- <div style="position:relative; top: -500px;"> -->
<!-- 	<button type="button" id="insertBt" style=" color: #fff; background: #E16422; border-radius: 20px; padding: 5px 12px 5px 12px; border: 0; position: relative; left: 170px; top: 0px;" >+</button> -->
<!-- </div> -->

<div style="position:relative; top: 150px;" >
</div>


<!-- Javascript 
================================================== -->
<script src="/js/main/jquery.js"></script>
<script src="/js/main/wow.min.js"></script>
<script src="/js/main/custom.js"></script>
<script type="text/javascript">
$(function(){

	
});
</script>

</html>