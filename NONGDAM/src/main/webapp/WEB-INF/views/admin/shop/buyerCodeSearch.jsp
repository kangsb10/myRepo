<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">

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

td {
	font-size: 9pt;
	line-height: 16px;
	color: #818181;
	letter-spacing: 0px;
}

td a {
	font-size: 9pt;
	line-height: 16px;
	color: #818181;
	letter-spacing: 0px;
	text-decoration: none;
}

td a:hover {
	font-size: 9pt;
	line-height: 16px;
	color: #818181;
	letter-spacing: 0px;
	text-decoration: underline;
}
</style>
<script type='text/javascript' src='http://code.jquery.com/jquery-latest.js'> </script>
<script type="text/javascript" >
$(function(){
	$('#searchBtn').click(function(){
		if($('#buyerNm').val() == ''){
			alert('거래처명을 입력하세요!');
			return;
		}
		$.ajax({
	         type       : 'POST',
	         dataType   : 'JSON',
	         url         : '/user/shop/buyerCodeDataPush.do',
	         data      : { buyer_nm : $("#buyerNm").val() },
	         error      : function(result){
	            alert('code : ' + result.status + 
	                  ' | message : ' + result.responseText);
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
	            for(var i = 0; i < result.length; i++){
	               htmls += '<tr>' + 
	                        '<td>' + result[i].buyer_id + '</td>' + 
	                        '<td>' + result[i].buyer_nm + '</td>' + 
	                      '</tr>';
	           
	            }
	            htmls += '</tbody></table>';
	            
	            $("#viewTable").empty().append(htmls);
	               
	               $("#buyercodeTBL tr:gt(0)").click(function(){
	                  var buyercode = $(this).find('td:eq(0)').text();
	                  // opener:팝업시킨 부모창
	                  $(opener.document).find('#buyer_id').val(buyercode);
	                 
//	                   $('#mem_zip1', opener.document).val(buyercode.split('-'[0]));
//	                   $('#mem_zip2', opener.document).val(buyercode.split('-'[1]));
//	                   $('#mem_add1', opener.document).val(buyerName);
	                  
	                  //지혼자 닫겟다
	                  self.close();
	               });
	               
	               
	               
	            },
	         });
	   });   
	});





</script>
</head>
<body>
	<table width="354" border="0" cellspacing="0" cellpadding="0" >
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
							<input type="image" src="/img/shop/images/bt_search.gif" border='0'
							align="middle" id="searchBtn">
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
	</table>
</body>
</html>