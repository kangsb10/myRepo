<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><tiles:getAsString name="title"/></title>
</head>
<body>
<%-- <tiles:insertAttribute name="header"></tiles:insertAttribute> --%>
<!-- <div id="wrapper"> -->
		
<%-- 			<tiles:insertAttribute name="left"></tiles:insertAttribute> --%>
<!-- 	<div id="page-wrapper"> -->
		
<!-- 		<div class="page-content"> -->
<%-- 			<tiles:insertAttribute name="content"></tiles:insertAttribute> --%>
<!-- 		</div> -->
	
 <%-- 		<tiles:insertAttribute name="footer"></tiles:insertAttribute> --%> 
<!-- 	</div> -->

<!-- <div id="wrapper"> -->
<div id="">
		<div id="header" style="background-color: pink;">
			<tiles:insertAttribute name="header"></tiles:insertAttribute>
		</div>
		
<!-- 		<div style="float: left; background-color: silver; height: 1500px; width: "> -->
<%-- 			<tiles:insertAttribute name="left"></tiles:insertAttribute> --%>
<!-- 		</div> -->
<!-- 		<div class="content" style="float: left; margin-left:100px; height: 650px; width: 200px; overflow: auto;"> -->
		
		<div class="content" style=" height: 900px; width: 105%; background-color: white; ">
			<tiles:insertAttribute name="content"></tiles:insertAttribute>
		</div> 
 </div> 

<!-- 	<div id="wrap"> -->
<!-- 		<div id="header"> -->
<%-- 			<jsp:include page="/11/layout/header.jsp" /> --%>
<!-- 		</div> -->
<!-- 		<p style="clear: both;"></p> -->
<!-- 		<div> -->
<!-- 			<div class="left"> -->
<%-- 				<jsp:include page="./layout/left.jsp" /> --%>
<!-- 			</div> -->
<!-- 			<div id="content" style="margin-left:100px; height: 650px; width: 100%; overflow: auto;"> -->
<%-- 				<jsp:include page="<%=contentPage %>" /> --%>
<!-- 			</div> -->
<!-- 		</div> -->
		
<!-- 	</div> -->

</body>
</html>