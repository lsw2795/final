<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:import url="/approval/viewPDF?confirmDocumentNo=${param.confirmDocumentNo }"></c:import>
		<div class="col-sm-5 m-auto mb-3" align="center">
			<button class="form-control btn btn-primary" onclick="downloadPDF()" style="width: 100px">PDF다운</button>
			<button class="form-control btn btn-primary" onclick="back()"style="width: 100px">뒤로가기</button>
		</div>
</body>
</html>