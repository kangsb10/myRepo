<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<%@ page contentType="text/html;charset=utf-8" %>
<title>농약정보서비스</title>

<!-- 공통 Script include -->
<%@page import="java.io.InputStream"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="org.w3c.dom.NodeList"%>
<%@page import="org.w3c.dom.Node"%>
<%@page import="org.w3c.dom.Element"%>
<%@page import="javax.xml.parsers.DocumentBuilderFactory"%>
<%@page import="org.w3c.dom.Document"%>
<%@page import="java.net.URL"%>
<!-- 
스타일 및 이미지는 보유하고 있는 것으로 변경하세요. (아래 CSS 및 이미지 파일에 대한 경로를 보유하고 있는 파일로 변경) 
-->
<link type="text/css" rel="stylesheet" href="http://pis.rda.go.kr/css/pop.css">
<link type="text/css" rel="stylesheet" href="http://pis.rda.go.kr/css/reset.css" >
<link type="text/css" rel="stylesheet" href="http://pis.rda.go.kr/css/style.css">

<%

	String apiKey = "2019f0674f70c6980592d0c135c54607dc18"; // 인증키
	String svcCode = "SVC01"; // 서비스코드
	String displayCount = "10";
	String buildTime = null;
	String totalCnt = null;
	NodeList items = null;
	
	// 검색조건
	String sCropName = request.getParameter("cropName");
	String sUseName = request.getParameter("useName");
	String sDiseaseWeedName = request.getParameter("diseaseWeedName");
	String sPestiKorName = request.getParameter("pestiKorName");
	String sPestiBrandName = request.getParameter("pestiBrandName");
	String sCompName = request.getParameter("compName");
	
	// 목록
	int size = 0;
	
	NodeList cropNames = null;
	NodeList diseaseWeedNames = null;
	NodeList useNames = null;
	NodeList pestiKorNames = null;		// 
	NodeList pestiBrandNames = null;
	NodeList compNames = null;
	NodeList pestiCodes = null;
	NodeList diseaseUseSeqs = null;

		
	boolean isRetrieve = false;
		
	if(apiKey==""){
		isRetrieve = false;
	}else{
		isRetrieve = true;
		
		String parameter = "apiKey="+ apiKey;
		parameter += "&serviceCode="+ svcCode;
		if(request.getParameter("useName")!=null){
			parameter += "&useName="+ URLEncoder.encode(request.getParameter("useName"),"utf-8");//검색어는 UTF-8로 인코딩
		}
		if(request.getParameter("cropName")!=null){
			parameter += "&cropName="+ URLEncoder.encode(request.getParameter("cropName"),"utf-8");//검색어는 UTF-8로 인코딩
		}
		if(request.getParameter("diseaseWeedName")!=null){
			parameter += "&diseaseWeedName="+ URLEncoder.encode(request.getParameter("diseaseWeedName"),"utf-8");//검색어는 UTF-8로 인코딩
		}
		if(request.getParameter("pestiKorName")!=null){
			parameter += "&pestiKorName="+ URLEncoder.encode(request.getParameter("pestiKorName"),"utf-8");//검색어는 UTF-8로 인코딩
		}
		if(request.getParameter("pestiBrandName")!=null){
			parameter += "&pestiBrandName="+ URLEncoder.encode(request.getParameter("pestiBrandName"),"utf-8");//검색어는 UTF-8로 인코딩
		}
		if(request.getParameter("compName")!=null){
			parameter += "&compName="+ URLEncoder.encode(request.getParameter("compName"),"utf-8");//검색어는 UTF-8로 인코딩
		}
		parameter += "&displayCount="+ displayCount;
		if(request.getParameter("startPoint")!=null){
			parameter += "&startPoint="+ request.getParameter("startPoint");
		}
		
		URL apiUrl = new URL("http://pis.rda.go.kr/openApi/service.do?"+parameter);
		
		InputStream apiStream = apiUrl.openStream();
		Document doc = null;
		try{
			
			
			doc =	DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(apiStream);
			buildTime = doc.getElementsByTagName("buildTime").item(0).getFirstChild().getNodeValue();
			totalCnt = doc.getElementsByTagName("totalCount").item(0).getFirstChild().getNodeValue();
			items = doc.getElementsByTagName("item");
			
			
			
			size = doc.getElementsByTagName("item").getLength();
			cropNames = doc.getElementsByTagName("cropName");
			diseaseWeedNames = doc.getElementsByTagName("diseaseWeedName");
			useNames = doc.getElementsByTagName("useName");
			pestiKorNames = doc.getElementsByTagName("pestiKorName");
			pestiBrandNames = doc.getElementsByTagName("pestiBrandName");
			compNames = doc.getElementsByTagName("compName");
			pestiCodes = doc.getElementsByTagName("pestiCode");
			diseaseUseSeqs = doc.getElementsByTagName("diseaseUseSeq");
			
		}catch(Exception e){
			isRetrieve = false;
		}finally{
			apiStream.close();
		}
	}
	
%>
<!--===================================================================================
                                 ## JavaScript Function 정의##
====================================================================================-->
<script type="text/javascript">
<!--

//페이지 이동
function fncGoPage(start){
	with(document.listForm){
		startPoint.value = start;
		method="get";
		action = "http://yourDomain.co.kr/sample01.jsp";
		target = "_self";
		submit();
	}
}

//조회 버튼 클릭 시
function fncRetrieve(){
	with(document.listForm){
		startPoint.value = 1;
		method="get";
		action = "http://yourDomain.co.kr/sample01.jsp";
		target = "_self";
		submit();
	}
}

//상세조회 버튼 클릭 시
function fncDtl(code, seq){
	with(document.listForm){
		pestiCode.value = code;
		diseaseUseSeq.value = seq;
		method="get";
		action = "http://yourDomain.co.kr/sample02.jsp";
		target = "_self";
		submit();
	}
}

//-->
</script>
</head>
<body >
	
	<div id="pop">

<form name="listForm" method="post">
		<!-- Header str -->
		<div id="popHeader">
			<h1>농약등록정보 검색 서비스</h1>
		</div>
		<!-- //Header end -->

		<!-- Container str -->
		<div id="popContainer">
			<div class="popContent">
				<fieldset class="sch">
					<legend>검색</legend>
					<div class="contentsSch">
						<span class="round lt"></span><span class="round rt"></span><span class="round lb"></span><span class="round rb"></span>
						<p class="w90 maAuto">
							<label for="useName" class="labelDot">용도　</label>
							&nbsp;<input type="text" id="useName" name="useName" class="inputData w20" value="<%=sUseName%>">
							<label for="cropName" class="ml10 labelDot">작물명</label>
							&nbsp;<input type="text" id="cropName" name="cropName" class="inputData w20" value="<%=sCropName%>">
							<label for="diseaseWeedName" class="ml10 labelDot">적용병해충</label>
							&nbsp;<input type="text" id="diseaseWeedName" name="diseaseWeedName" class="inputData w20" value="<%=sDiseaseWeedName%>">
                            &nbsp;<input type="submit" name="btn" value="검색" class="imgSchBtn rt" onClick="fncRetrieve(); return false;"/>
						</p>
						<p class="w90 maAuto">
							<label for="pestiKorName" class="labelDot">품목명</label>
							&nbsp;<input type="text" id="pestiKorName" name="pestiKorName" class="inputData w20" value="<%=sPestiKorName%>">
							<label for="pestiBrandName" class="ml10 labelDot">상표명</label>
							&nbsp;<input type="text" id="pestiBrandName" name="pestiBrandName" class="inputData w20" value="<%=sPestiBrandName%>">
							<label for="compName" class="ml10 labelDot">회사명　　</label>
							&nbsp;<input type="text" id="compName" name="compName" class="inputData w20" value="<%=sCompName%>">
						</p>
					</div>
				</fieldset>
				
				
				<div class="tabelRound mt20">
					<span class="round lt"></span><span class="round rt"></span><!-- 라운딩효과 -->

					<table cellspacing="0" cellpadding="0" border="1" summary="" class="grid w100"><!-- border=1  스타일 지웠을 경우를 데이터 정렬 -->
						<colgroup>
							<col width="15%"/>
							<col width="20%"/>
							<col width="12%"/>
							<col width="*"/>
							<col width="20%"/>
							<col width="20%"/>
						</colgroup>
						<thead>
							<tr>
								<th scope="row">작물명</th>
								<th scope="row">적용병해충</th>
	                            <th scope="row">용도</th>
	                            <th scope="row">품목명</th>
	                            <th scope="row">상표명</th>
	                            <th scope="row">회사명</th>
							</tr>
						</thead>
						<tbody>
							<%
								String cropName, diseaseWeedName, useName, pestiKorName, pestiBrandName, compName,pestiCode,diseaseUseSeq ;
								
								for(int i=0; i<size; i++){
									cropName = cropNames.item(i).getFirstChild() == null ? "" : cropNames.item(i).getFirstChild().getNodeValue();
									diseaseWeedName = diseaseWeedNames.item(i).getFirstChild() == null ? "" : diseaseWeedNames.item(i).getFirstChild().getNodeValue();
									useName = useNames.item(i).getFirstChild() == null ? "" : useNames.item(i).getFirstChild().getNodeValue();
									pestiKorName = pestiKorNames.item(i).getFirstChild() == null ? "" : pestiKorNames.item(i).getFirstChild().getNodeValue();
									pestiBrandName = pestiBrandNames.item(i).getFirstChild() == null ? "" : pestiBrandNames.item(i).getFirstChild().getNodeValue();
									compName = compNames.item(i).getFirstChild() == null ? "" : compNames.item(i).getFirstChild().getNodeValue();
									
									pestiCode = pestiCodes.item(i).getFirstChild() == null ? "" : pestiCodes.item(i).getFirstChild().getNodeValue();
									diseaseUseSeq = diseaseUseSeqs.item(i).getFirstChild() == null ? "" : diseaseUseSeqs.item(i).getFirstChild().getNodeValue();
									
							%>
								<tr>
									<td class="ce"><%=cropName%></td>
									<td class="ce"><%=diseaseWeedName%></td>
									<td class="ce"><%=useName%></td>
									<td class="ce"><a href="#" onclick="fncDtl('<%=pestiCode%>', '<%=diseaseUseSeq%>'); return false;"><%=pestiKorName%></a></td>
									<td class="ce"><%=pestiBrandName%></td>
									<td class="ce"><%=compName%></td>
								</tr>
							<%} %>
							<%if(size==0){ %>
						      <tr>
						          <td colspan="6" class="ce">검색된 결과가 없습니다.</td>
						      </tr>
							<%} %>
						</tbody>
					</table>
				</div>
				<div class="pagination">
				<%
//페이징 처리 시작
	int pageGroupSize = 10;
	int pageSize = 0;
	try{
		pageSize = Integer.parseInt(request.getParameter("displayCount"));
	}catch(Exception e){
		pageSize = 10;
	}
	int start = 0; 
	try{
		start = Integer.parseInt(request.getParameter("startPoint"));
	}catch(Exception e){
		start = 1;
	}
	
	int currentPage = (int)(Math.ceil((double)start / (double)pageSize));

	int startRow = (currentPage - 1) * pageSize + 1;//한 페이지의 시작글 번호 
	int endRow = currentPage * pageSize;//한 페이지의 마지막 글번호           
	int count = Integer.parseInt( totalCnt);                                                            
	int number=0;                                                             

		
	number=count-(currentPage-1)*pageSize;//글목록에 표시할 글번호                                                                  
    
	//페이지그룹의 갯수                                                                                                             
	//ex) pageGroupSize가 3일 경우 '[1][2][3]'가 pageGroupCount 개 만큼 있다.                                                       
	int pageGroupCount = count/(pageSize*pageGroupSize)+( count % (pageSize*pageGroupSize) == 0 ? 0 : 1);                           
	//페이지 그룹 번호                                                                                                              
	//ex) pageGroupSize가 3일 경우  '[1][2][3]'의 페이지그룹번호는 1 이고  '[2][3][4]'의 페이지그룹번호는 2 이다.                   
	int numPageGroup = (int) Math.ceil((double)currentPage/pageGroupSize);                                                          


	if(count > 0){
		int pageCount = count / pageSize + ( count % pageSize == 0 ? 0 : 1);
		int startPage = pageGroupSize*(numPageGroup-1)+1;
		int endPage = startPage + pageGroupSize-1;
		int pageNo = 0; int startPoint = 0;
		
		if(endPage > pageCount){
			endPage = pageCount;
		}
		
		if(numPageGroup > 1){
			pageNo = (numPageGroup-2)*pageGroupSize+1;
			startPoint = ((pageNo-1)*pageSize)+1;
			out.println("<a href='javascript:fncGoPage("+startPoint+");'><img align=\"absmiddle\" alt=\"prev\" src=\"http://pis.rda.go.kr/images/basic/btn_page_pre1.gif\" border=\"0\"/></a>");
		}
		
		for(int i=startPage; i<=endPage; i++){
			pageNo = i;
			startPoint = ((pageNo-1)*pageSize)+1;
			out.print("<a href='javascript:fncGoPage("+startPoint+");'>");
			if(currentPage == i){
				out.print("<strong>"+i+"</strong>");
			}else{
				out.print(""+i+"");
			}
			out.println("</a>");
		}
		
		if(numPageGroup < pageGroupCount){
			pageNo = (numPageGroup*pageGroupSize+1);
			startPoint = ((pageNo-1)*pageSize)+1;
			out.println("<a href='javascript:fncGoPage("+startPoint+");'><img align=\"absmiddle\" alt=\"next\" src=\"http://pis.rda.go.kr/images/basic/btn_page_next1.gif\" border=\"0\"/></a>");
		}
%>
<%
	}
	//페이징 처리 끝
%>
</div>

			</div>
		</div>
		<!-- //Container end -->
		<input type="hidden" name="diseaseUseSeq" id="diseaseUseSeq" value="<%=request.getParameter("diseaseUseSeq")%>"/>
		<input type="hidden" name="pestiCode" id="pestiCode" value="<%=request.getParameter("pestiCode")%>"/>
		<input type="hidden" name="startPoint" id="startPoint" value="<%=request.getParameter("startPoint")%>"/><!-- 검색 시작 위치 -->
</form>
		<!-- Footer str -->
		<div id="popFooter">
			<p class="copyright">Copyright 2016 NAAS. All rights reserved</p>
		</div>
		<!-- Footer end -->

		<p class="close"><a href="javascript:self.close();"><img src="http://pis.rda.go.kr/images/close_btn.png" alt="" title="이 창을 닫습니다." /></a></p>
	</div>
	<!-- //전체를 감싸는 DIVISION -->
</body>
</html>