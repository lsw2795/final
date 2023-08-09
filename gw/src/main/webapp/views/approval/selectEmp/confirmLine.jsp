<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
    	$(function() {
    		$('.a-select').click(function() {
    		    // 해당 a 태그에 active 클래스 추가
    		    $(this).addClass('active');
    		    
    		    // 클릭한 a 태그를 제외한 다른 a 태그들의 active 클래스 제거
    		    $('.a-select').not(this).removeClass('active');
    		});
    		  
    		$('#insert').click(function(){
		    	self.close();
    		});
    		
    		$('#close').click(function(){
		    	self.close();
    		});
		});
    	
    	function selectConfirm1(){
    		var selNo=$('.active>#empNo').val();
    		var selName=$('.active>#empNameDiv').html();
    		
    		if(selNo==null){
    			alert("검토자를 선택하세요");
    			return;
    		}
    		
    		var str="<span class='confirm1_Name' style='display: block;'>"+selName+"</span>"+
    		"<input type='hidden' class='confirm1' name='confirm1' value=\""+selNo+"\">";
			$('#confirm1Sel').html(str);
			
			$('.a-select').removeClass('active');
    	}
    	
    	function deleteConfirm1() {
    		var lastSelectName = $('#confirm1Sel>.confirm1_Name');
    		var lastSelectNo = $('#confirm1Sel>.confirm1');
    	    if (lastSelectName.length > 0) {
    	        lastSelectName.remove();
    	        lastSelectNo.remove();
    	    }
    	}
    	
    	function selectConfirm2(){
    		var selNo=$('.active>#empNo').val();
    		var selName=$('.active>#empNameDiv').html();
    		
    		if(selNo==null){
    			alert("확인자를 선택하세요");
    			return;
    		}
    		
    		var str="<span class='confirm2_Name' style='display: block;'>"+selName+"</span>"+
    		"<input type='hidden' class='confirm2' name='confirm2' value=\""+selNo+"\">";
			$('#confirm2Sel').html(str);
			
			$('.a-select').removeClass('active');
    	}
    	
    	function deleteConfirm2() {
    		var lastSelectName = $('#confirm2Sel>.confirm2_Name');
    		var lastSelectNo = $('#confirm2Sel>.confirm2');
    	    if (lastSelectName.length > 0) {
    	        lastSelectName.remove();
    	        lastSelectNo.remove();
    	    }
    	}
    	
    	function selectConfirm3(){
    		var selNo=$('.active>#empNo').val();
    		var selName=$('.active>#empNameDiv').html();
    		
    		if(selNo==null){
    			alert("검토자를 선택하세요");
    			return;
    		}
    		
    		var str="<span class='confirm3_Name' style='display: block;'>"+selName+"</span>"+
    		"<input type='hidden' class='confirm3' name='confirm3' value=\""+selNo+"\">";
			$('#confirm3Sel').html(str);
			
			$('.a-select').removeClass('active');
    	}
    	
    	function deleteConfirm3() {
    		var lastSelectName = $('#confirm3Sel>.confirm3_Name');
    		var lastSelectNo = $('#confirm3Sel>.confirm3');
    	    if (lastSelectName.length > 0) {
    	        lastSelectName.remove();
    	        lastSelectNo.remove();
    	    }
    	}
    	
    	
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
		<div class="col-sm-12 ">
			<div class="row gx-2 mb-3" style="float: right;">
				<div class="col-auto" align="center">
					<button class="btn btn-primary" id="insert">생성</button>
				</div>
				<div class="col-auto" align="center">
					<button class="btn btn-primary" id="close">닫기</button>
				</div>
			</div>	
		</div>	
		<div class="col-sm-5">
			<div class="card h-lg-100 overflow-hidden">
			<span style="display: none;"></span>
				<div class="card-header bg-light">
					조직도
				</div>
				<div class="card-body LineSelectDiv" >
		        	<ul id="navbarVerticalNav">
		        	<c:forEach var="deptVo" items="${deptList }">
		        		<li class="nav-item">
		        			<a class="nav-link" href="#${deptVo.deptNo }" data-bs-toggle="collapse" >
			                    ${deptVo.name}
		                  	</a>
		                  	<ul class="nav collapse" id="${deptVo.deptNo }">
		                  	<c:forEach var="employeeVo" items="${empList }">
		                  	<c:if test="${deptVo.deptNo == employeeVo.deptNo }">
				            	<li class="nav-item" style="width: 100%"><!-- 사원 -->
					        		<a class="a-select nav-link" href="#">
			                    		<span class="nav-link-icon"><span class="fas fa-user"></span></span>
					                	<div id="empNameDiv" style="display: inline;">${employeeVo.name }</div>
					                	<input type="hidden" id="empNo" value="${employeeVo.empNo }">
					                </a>
				                </li>
			                </c:if>
			                </c:forEach>
							</ul>
		        		</li>
		        	</c:forEach>
					</ul> 
				</div>		
			</div>		
		</div>
		<div class="col-sm-2" align="center">
			<div class="row gx-2">
				<div class="mb-7 mt-3">
					<input class="mb-2" type="button" onclick="selectConfirm1()" value=">>"><br>
					<input class="mt-2" type="button" onclick="deleteConfirm1()" value="<<">
				</div>
				<div class="mb-7 mt-1">
					<input class="mb-2" type="button" onclick="selectConfirm2()" value=">>"><br>
					<input class="mt-2" type="button" onclick="deleteConfirm2()" value="<<">
				</div>
				<div class="mb-7 mt-1">
					<input class="mb-2" type="button" onclick="selectConfirm3()" value=">>"><br>
					<input class="mt-2" type="button" onclick="deleteConfirm3()" value="<<">
				</div>
			</div>
		</div>
		<div class="col-sm-5 ">
			<div class="row gx-2">
				<div class="card h-lg-100 mb-6 overflow-hidden">
					<div class="card-header bg-light">
						검토자
					</div>
					<div class="card-body " id="confirm1Sel">
					</div>
				</div>
				<div class="card h-lg-100 mb-6 overflow-hidden">
					<div class="card-header bg-light">
						확인자
					</div>
					<div class="card-body " id="confirm2Sel">
					</div>
				</div>
				<div class="card h-lg-100 mb-6 overflow-hidden">
					<div class="card-header bg-light">
						승인자
					</div>
					<div class="card-body " id="confirm3Sel">
					</div>
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