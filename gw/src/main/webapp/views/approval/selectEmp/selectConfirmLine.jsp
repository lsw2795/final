<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결재선 선택</title>
<!-- ===============================================-->
    <!--    Favicons-->
    <!-- ===============================================-->
    <!-- jquery  -->
    <script type="text/javascript" src="<c:url value='/js/jquery-3.7.0.min.js'/>"></script>
    <link rel="apple-touch-icon" sizes="180x180" href="<c:url value='/assets/img/favicons/apple-touch-icon.png'/>">
    <link rel="icon" type="image/png" sizes="32x32" href="<c:url value='/assets/img/favicons/favicon-32x32.png'/>">
    <link rel="icon" type="image/png" sizes="16x16" href="<c:url value='/assets/img/favicons/favicon-16x16.png'/>">
    <link rel="shortcut icon" type="image/x-icon" href="<c:url value='/assets/img/favicons/favicon.ico'/>">
    <link rel="manifest" href="<c:url value='/assets/img/favicons/manifest.json'/>">
 	<meta name="msapplication-TileImage" content="<c:url value='/assets/img/favicons/mstile-150x150.png'/>">
    <meta name="theme-color" content="#ffffff">
    <script src="<c:url value='/assets/js/config.js'/>"></script>
    <script src="<c:url value='/vendors/simplebar/simplebar.min.js'/>"></script>
	<script type="text/javascript">
	
	</script>
    <!-- ===============================================-->
    <!--    Stylesheets-->
    <!-- ===============================================-->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,500,600,700%7cPoppins:300,400,500,600,700,800,900&amp;display=swap" rel="stylesheet">
    <link href="<c:url value='/vendors/simplebar/simplebar.min.css'/>" rel="stylesheet">
    <link href="<c:url value='/assets/css/theme-rtl.css'/>" rel="stylesheet" id="style-rtl">
    <link href="<c:url value='/assets/css/theme.css'/>" rel="stylesheet" id="style-default">
    <link href="<c:url value='/assets/css/user-rtl.css'/>" rel="stylesheet" id="user-style-rtl">
    <link href="<c:url value='/assets/css/user.css'/>" rel="stylesheet" id="user-style-default">
</head>
<body>
	<div class="row gx-2 m-5">
		<div class="col-sm-12 mb-3">
			<div class="card h-lg-100 overflow-hidden">
			<span style="display: none;"></span>
				<div class="card-header bg-light">
					결재라인선택
				</div>
				<div class="card-body LineSelectDiv" >
		        	<div class="table-responsive scrollbar p-0">
					  <table class="table m-auto" border="1" style="text-align: center; width: 500px;">
					    <thead>
					      <tr>
					        <th style="width: 25%">검토자</th>
					        <th style="width: 25%">확인자</th>
					        <th style="width: 25%">승인자</th>
					        <th style="width: 25%">선택</th>
					      </tr>
					    </thead>
					    <tbody>
					      <tr>
					        <td>최정윤</td>
					        <td>김채영</td>
					        <td>나다미</td>
					        <td>
					          <div id="btDiv">
					            <button class="btn btn-link p-0" type="button" data-bs-toggle="tooltip" data-bs-placement="top" title="Edit"><span class="text-500 fas fa-edit"></span></button>
					            <button class="btn btn-link p-0 ms-2" type="button" data-bs-toggle="tooltip" data-bs-placement="top" title="Delete"><span class="text-500 fas fa-trash-alt"></span></button>
					          </div>
					        </td>
					      </tr>
					    </tbody>
					  </table>
					</div>
				</div>		
			</div>		
		</div>
		<div class="col-sm-12">
			<div class="row gx-2" style="float: right;">
				<div class="col-auto" align="center">
					<button class="btn btn-primary" id="select">선택</button>
				</div>
				<div class="col-auto" align="center">
					<button class="btn btn-primary" id="close">닫기</button>
				</div>
			</div>	
		</div>	
	</div>
    <!-- ===============================================-->
    <!--    JavaScripts-->
    <!-- ===============================================-->
    <script src="<c:url value='/vendors/popper/popper.min.js'/>"></script>
    <script src="<c:url value='/vendors/bootstrap/bootstrap.min.js'/>"></script>
    <script src="<c:url value='/vendors/anchorjs/anchor.min.js'/>"></script>
    <script src="<c:url value='/vendors/is/is.min.js'/>"></script>
    <script src="<c:url value='/vendors/echarts/echarts.min.js'/>"></script>
    <script src="<c:url value='/vendors/fontawesome/all.min.js'/>"></script>
    <script src="<c:url value='/vendors/lodash/lodash.min.js'/>"></script>
    <script src="<c:url value='https://polyfill.io/v3/polyfill.min.js?features=window.scroll'/>"></script>
    <script src="<c:url value='/vendors/list.js/list.min.js'/>"></script>
    <script src="<c:url value='/assets/js/theme.js'/>"></script>
</body>
</html>