<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import = "java.util.List" %>
<%@ include file="../inc/top.jsp"%>
<script defer src="<c:url value='/js/index.js'/>"></script>
<script defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCaWtOJ2c9pcjC4J-t_RDSpIWRbPo6HaKs&callback=initMap">
</script>
<style type="text/css">
	#galaxy{
		height:400px;
	}
</style>
<div id = "introduce">
	
</div>
<div>
	<img id = "galaxy" src = "<c:url value='/images/galaxy.jpg'/>">
</div>
<div id="map" style="height: 500px;"></div>
</body>
<%@ include file="../inc/bottom.jsp"%>