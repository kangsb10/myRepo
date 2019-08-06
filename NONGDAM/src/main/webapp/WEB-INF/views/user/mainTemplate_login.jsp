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

<div id="">
		<div id="header" style="">
			<tiles:insertAttribute name="header"></tiles:insertAttribute>
		</div>
		

		<div class="content" style=" height: 650px; width: 105%;  ">
			<tiles:insertAttribute name="content"></tiles:insertAttribute>
		</div> 
 </div> 



</body>
</html>