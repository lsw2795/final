<!-- 익명게시판 신고글 상세보기 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>익명게시판 신고글 상세보기</title>
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
	<script src="<c:url value='/js/adminAnonymous.js'/>"></script>
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
		<div class="col-sm-12 ">
			<div class="row gx-2 mb-3" style="float: right;">
				<c:if test="${reportMap['REPORT_STATUS']==0}">
					<div class="col-auto" align="center">
						<button class="btn btn-primary" id="statusUpdate">신고처리</button>
					</div>
					<div class="col-auto" align="center">
						<button class="btn btn-primary" id="statusPostpone">신고보류</button>
					</div>
				</c:if>
				<c:if test="${reportMap['REPORT_STATUS']==2}">
					<div class="col-auto" align="center">
						<button class="btn btn-primary" id="statusUpdate">신고처리</button>
					</div>
				</c:if>
				<div class="col-auto" align="center">
					<button class="btn btn-primary" id="close">닫기</button>
				</div>
			</div>	
		</div>	
		<div class="col-sm-12">
			<div class="card h-lg-100 overflow-hidden">
				<div class="card-header bg-light">
					<input type="hidden" id="reportNo" name="reportNo" value="${reportMap['REPORT_NO'] }">
					<c:if test="${!empty commentMap }">
			        	댓글에 대한 신고 
			        </c:if>
			        <c:if test="${empty commentMap }">
				    	게시글에 대한 신고
			        </c:if>
				</div>
				<div class="card-body scrollbar row" >
					<div class="col-6 mb-3">
						<label class="form-label mb-2">
			            	신고자
			            </label><br>
			            ${reportMap['NAME']}
					</div>
					<div class="col-6 mb-3">
						<label class="form-label mb-2">
			            	신고일
			            </label><br>
			            <fmt:formatDate value="${reportMap['REPORT_DATE'] }" pattern="yy-MM-dd HH:mm"/>
					</div>
					<div class="col-12 mb-3">
						<label class="form-label mb-2">
			            	게시글 작성자
			            </label><br>
			            <c:if test="${!empty commentMap }">
			            	익명의 작성자
			            </c:if>
			            <c:if test="${empty commentMap }">
				            ${boardMap['NAME'] }
			            </c:if>
					</div>
					<div class="col-12 mb-3">
						<label class="form-label mb-2">
			            	제목
			            </label><br>
			            ${boardMap['TITLE'] }
					</div>
					<div class="col-12 mb-3">
						<label class="form-label mb-2">
			            	내용
			            </label><br>
			            ${reportMap['CONTENT'] }
					</div>
			        <c:if test="${!empty commentMap }">
						<div class="col-12 mb-3">
							<label class="form-label mb-2">
				            	댓글 작성자
				            </label><br>
				            ${commentMap['NAME'] }
						</div>
						<div class="col-12 mb-3">
							<label class="form-label mb-2">
				            	댓글 내용
				            </label><br>
				  	  	    	${reportMap['COMMENT_CONTENT'] }
						</div>
			        </c:if>
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