<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import = "java.util.List" %>
<%@ include file="../inc/top.jsp"%>
> GET /v1/search/news.xml?query=%EC%A3%BC%EC%8B%9D&display=10&start=1&sort=sim HTTP/1.1
> Host: openapi.naver.com
> User-Agent: curl/7.49.1
> Accept: */*
> X-Naver-Client-Id: VvgfyIV_bSjmsS0Y0nvX
> X-Naver-Client-Secret: oBQSkhP6cz
>

<body>
<c:forEach>
	<label>${news.title }</label>
</c:forEach>
</body>
<%@ include file="../inc/bottom.jsp"%>