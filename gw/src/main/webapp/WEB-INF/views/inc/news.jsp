<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import = "java.util.List" %>
<%@ include file="../inc/top.jsp"%>


<body>
<h3>네이버 오픈 API를 활용한 뉴스 목록</h3>
		
<table border = "1">
	<c:forEach var="newItem" items="${news }">
	<tr>
        <td>${newItem.title}</td>
        <td>
        <a>${newItem.title}</a></td>
    </tr>
	</c:forEach>
</table>
</body>
<%@ include file="../inc/bottom.jsp"%>