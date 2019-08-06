<%@page import="java.util.ArrayList"%>
<%@page import="kr.or.ddit.vo.LProdVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.prod.service.IProdServiceImpl"%>
<%@page import="kr.or.ddit.prod.service.IProdService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    IProdService service = IProdServiceImpl.getInstance();
    List<LProdVO> lprodList = service.lProdList();
    
    String gu = "";
    String nm = "";
    String guPlusnm = "";
    List<String> listGuPlusMm = new ArrayList<String>();
    	for(int i=0; i<lprodList.size(); i++){
    		gu = lprodList.get(i).getLprod_gu() +" ";
    		nm = lprodList.get(i).getLprod_nm();
    		guPlusnm = gu + nm;
    		listGuPlusMm.add(guPlusnm);
    	}
    
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/validation.js"></script>
<script type="text/javascript">

$(function(){
	$("#search_prod_id").click(function(){
		var url    = '<%=request.getContextPath()%>/10/prodIdSearch.jsp';
	      var options   = 'toolbar=no,location=no,status=no,menubar=no' + 
	                 'scrollbars=no,resizable=no,copyhistory=no,width=380px,height=400px';
	      window.open(url, '상품코드검색', options);
	 });
	
	 $("#search_buyer_id").click(function(){
	      var url    = '<%=request.getContextPath()%>/10/buyerCodeSearch.jsp';
	      var options   = 'toolbar=no,location=no,status=no,menubar=no' + 
	                 'scrollbars=no,resizable=no,copyhistory=no,width=380px,height=400px';
	      window.open(url, '거래처코드검색', options);
	   });
	 
	$( "#btn2").click(function () { //취소버튼
			$( 'form' ).each( function () {
			            this.reset();
	   });
	 });
	 
	 $('#btn3').click(function(){  //목록 버튼
		   location.href = '<%=request.getContextPath()%>/prod/main.jsp?contentPage=prodList.jsp';
		});
	
	
	 

});

function fn_insertProd(){
	 var prod_id          = $('input[name=prod_id]').val();
	 //상품분류코드
	 var prod_lgu         = $('select[name=prod_lgu]').val();
	 
	 var prod_name        = $('input[name=prod_name]').val();
	 var prod_buyer       = $('input[name=prod_buyer]').val();
	 var prod_cost        = $('input[name=prod_cost]').val();
	 var prod_price       = $('input[name=prod_price]').val();
	 var prod_sale        = $('input[name=prod_sale]').val();
	 var prod_outline     = $('input[name=prod_outline]').val();
	 var prod_detail      = $('input[name=prod_detail]').val();
	 var prod_qtyin       = $('input[name=prod_qtyin]').val();
	 var prod_totalstock  = $('input[name=prod_totalstock]').val();
	 var prod_properstock = $('input[name=prod_properstock]').val();
	 var prod_insdate     = $('input[name=prod_insdate]').val();
	  

	 if(prod_id == null || prod_id.trim() == ""){
         alert("상품코드 입력하세요");
         return false;
      }

	 if(prod_lgu == null || prod_lgu.trim() == ""){
         alert("분류코드을 선택하세요");
         return false;
      }

	 if(prod_name == null || prod_name.trim() == ""){
         alert("상품명을 입력하세요");
         return false;
      }

	 if(prod_buyer == null || prod_buyer.trim() == ""){
         alert("거래처명코드 입력하세요");
         return false;
      }

	 if(prod_cost == null || prod_cost.trim() == ""){
         alert("매입가 입력하세요");
         return false;
      }
	 
	 if(prod_price == null || prod_price.trim() == ""){
         alert("소비자가를 입력하세요");
         return false;
      }
	 
	 if(prod_sale == null || prod_sale.trim() == ""){
         alert("판매가를 입력하세요");
         return false;
      }
	 
	 if(prod_outline == null || prod_outline.trim() == ""){
         alert("상품설명을 입력하세요");
         return false;
      }
	 
	 if(prod_totalstock == null || prod_totalstock.trim() == ""){
         alert("재고수량 입력하세요");
         return false;
      }
	 
	 
	 if(prod_properstock == null || prod_properstock.trim() == ""){
         alert("안전재고수량 입력하세요");
         return false;
      }
	 
	 $('#buyerForm').submit();
}

$(function(){
	$('form[name=buyerForm]').submit(function(){
		  
		var flag = true;
		$('input[name=prodfiles]').each(function(index, inputTag){
			 /*  if(!/\.(jpg|jpeg|gif|png)/.test($(inputTag).val().toLowerCase())){ 
		             BootstrapDialog.show({
		                 title: '알럿창',
		                 message: '이미지 파일만 업로드 가능합니다.'
		             });
		            flag = false;
		         } */

		});
		return flag;
	});
});

</script>
</head>
<style>
.fieldName {text-align: center; background-color: #f4f4f4;}
.tLine {background-color: #d2d2d2; height: 1px;}
.btnGroup { text-align: right; }
td {text-align: left; }
</style>
<body>
<form id="buyerForm" name="buyerForm" action="<%=request.getContextPath()%>/10/insertProd.jsp" 
		enctype="multipart/form-data" method="post">
<table width="600" border="0" cellpadding="0" cellspacing="0">
	<%-- <tr><td class="tLine" colspan="2"></td></tr>
   <tr><td rowspan="13" class="pic" colspan="2" style="vertical-align: bottom; width: 150px; text-align: center;">
         <div id="viewProdPic"></div>
         <img src="${pageContext.request.contextPath }/image/btn_pic.gif" alt="사진올리기" class="btn" title="업로드할 상품이미지를 검색합니다." 
            style="cursor: pointer;" onclick="prodPicOpenPopup();"/><br/>
         <div style="width: 100%" align="center">
            size : 235x315 이하
         </div>
      </td>
   </tr> --%>
	
	<tr>
		<td class="fieldName" width="100px" height="25">상품코드</td>
		<td>
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input class="mdl-textfield__input" type="text" id="prod_id" name="prod_id">
				<label class="mdl-textfield__label" for="prod_id">상품코드</label>
			</div>
			<!-- 
				상품코드 신규 등록시 기존의 상품코드와의 중복검사 로직을 ajax로 구현.
			 -->
			<button class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" id="search_prod_id" type="button" >상품코드검색</button>
		</td>
	</tr>
	<tr>
		<td class="fieldName" width="100px" height="25">상품명</td>
		<td>
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input class="mdl-textfield__input" type="text" id="prod_name" name="prod_name">
				<label class="mdl-textfield__label" for="prod_name">상품명</label>
			</div>
		</td>
	</tr>
	<tr>
		<td class="fieldName" width="100px" height="25">상품분류코드</td>
		<td>
			<div class="mdl-selectfield">
				<!-- 해당 셀렉트에 출력될 option의 구성은 LProd 테이블의 lprod_gu와 lprod_nm으로 UI출력시 먼저 
				     구성되도록 함.
				 -->
				<select class="browser-default" name="prod_lgu" id="prod_lgu">
				    <%for(String lprodStr : listGuPlusMm){ %>
					<option value="<%=lprodStr.substring(0,4)%>" ><%=lprodStr%></option>
					<%} %>
				</select>
			</div>
		</td>
	</tr>
	<tr>
		<td class="fieldName" width="100px" height="25">거래처코드</td>
		<td>
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input class="mdl-textfield__input" type="text" id="prod_buyer" name="prod_buyer">
				<label class="mdl-textfield__label" for="prod_buyer">거래처코드</label>
			</div>
			<!-- 
				거래처 등록시 모달리스 팝업을 활용하여 기존의 거래처명으로 거래처 코드 검색을 ajax로 구현.
			 -->
			<button class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" id="search_buyer_id" type="button">거래처검색</button>	
		</td>
	</tr>
	
	<tr>
		<td class="fieldName" width="100px" height="25">매입가</td>
		<td>
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input class="mdl-textfield__input" type="text" id="prod_cost" name="prod_cost">
				<label class="mdl-textfield__label" for="prod_cost">매입가</label>
			</div>			
		</td>
	</tr>
	
	<tr>
		<td class="fieldName" width="100px" height="25">소비자가</td>
		<td>
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input class="mdl-textfield__input" type="text" id="prod_price" name="prod_price">
				<label class="mdl-textfield__label" for="prod_price">소비자가</label>
			</div>
		</td>
	</tr>
</table>
<table width="600" border="0" cellpadding="0" cellspacing="0" style="margin-top: 10px;">
	<tr>
		<td class="fieldName" width="100px" height="25">판매가</td>
		<td>
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input class="mdl-textfield__input" type="text" id="prod_sale" name="prod_sale">
				<label class="mdl-textfield__label" for="prod_sale">판매가</label>
			</div>		
		</td>
	</tr>
	<tr>
		<td class="fieldName" width="100px" height="25">상품설명</td>
		<td>
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input class="mdl-textfield__input" type="text" id="prod_outline" name="prod_outline">
				<label class="mdl-textfield__label" for="prod_outline">상품설명</label>
			</div>
		</td>
	</tr>
	<tr>
		<td class="fieldName" width="300px" height="25">상품상세설명</td>
		<td>
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input class="mdl-textfield__input" type="text" id="prod_detail" name="prod_detail">
				<label class="mdl-textfield__label" for="prod_detail">상품상세설명</label>
			</div>
		</td>
	</tr>
	<tr>
		<td class="fieldName" width="300px" height="25">총입고수량</td>
		<td>
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input class="mdl-textfield__input" type="text" id="prod_qtyin" name="prod_qtyin">
				<label class="mdl-textfield__label" for="prod_qtyin">총입고수량</label>
			</div>
		</td>
	</tr>
	<tr>
		<td class="fieldName" width="300px" height="25">재고수량</td>
		<td>
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input class="mdl-textfield__input" type="text" id="prod_totalstock" name="prod_totalstock">
				<label class="mdl-textfield__label" for="prod_totalstock">재고수량</label>
			</div>
		</td>
	</tr>
	<tr>
		<td class="fieldName" width="300px" height="25">안전재고수량</td>
		<td>
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input class="mdl-textfield__input" type="text" id="prod_properstock" name="prod_properstock">
				<label class="mdl-textfield__label" for="prod_properstock">안전재고수량</label>
			</div>
		</td>
	</tr>
	<tr>
		<td class="fieldName" width="300px" height="25">입고일자</td>
		<td>
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input class="mdl-textfield__input" type="text" id="prod_insdate" name="prod_insdate">
				<label class="mdl-textfield__label" for="prod_insdate">입고일자</label>
			</div>
		</td>
	</tr>
	<tr>
      <td class="fieldName" width="100px" height="25">상품이미지</td>
      <td>
         <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
            <input class="mdl-textfield__input" type="file" id="prod_img1" name="prodfiles">
            <label class="mdl-textfield__label" for="file01">상품이미지1</label>
         </div>
         <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
            <input class="mdl-textfield__input" type="file" id="prod_img2" name="prodfiles">
            <label class="mdl-textfield__label" for="file02">상품이미지2</label>
         </div>
         <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
            <input class="mdl-textfield__input" type="file" id="prod_img3" name="prodfiles">
            <label class="mdl-textfield__label" for="file03">상품이미지3</label>
         </div>
         <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
            <input class="mdl-textfield__input" type="file" id="prod_img4" name="prodfiles">
            <label class="mdl-textfield__label" for="file04">상품이미지4</label>
         </div>
      </td>
   </tr>
	<tr>
		<td class="btnGroup" colspan="2" >
			<button class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" id="btn1" type="button" onclick="fn_insertProd()">상품등록</button>
			<button class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" id="btn2" type="button">취소</button>
			<button class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" id="btn3" type="button">목록</button>
		</td>
	</tr>
</table>
</form>
</body>
</html>








