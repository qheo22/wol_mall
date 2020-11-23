<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<style>
#container {width:100%; margin:20px auto; }
#header {height:280px; background-color:#FFFFFF; color:#000000;}
#content {width:70%; float:left; background-color:#303033; color:white }
#sidebar {width:20%; background-color:#FFBB00; float:left;}
</style>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>

</style>
<body>
	<div id="container">
		<div align="center" id="header">
		<tiles:insertAttribute name="header"/>
		</div>	
		<div class="laft_menu" id="sidebar">
		<tiles:insertAttribute name="left_menu"/>
		</div>
		<div class="content11" id="content">
		<tiles:insertAttribute name="content"/>
		</div>
</div>

</body>
</html>