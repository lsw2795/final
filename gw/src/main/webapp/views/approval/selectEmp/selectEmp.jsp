<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>참조자 선택</title>
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
    			if($('#select').find('.selectName').length>0){
			    	$('#select>.selectName').each(function(index,item){
			    		var result=$(item).html();
			    		if(index==0){
			    			$(opener.document).find('#referEmpNameSpan').html(result);
			    		}else{
			    			$(opener.document).find('#referEmpNameSpan').append(", "+result);
			    		}
			    	});
			    	
			    	$('#select>.selectNo').each(function(index,item){
			    		var result=$(item).html();
			    		if(index==0){
				    		$(opener.document).find('#referEmpNo').html(
				    			"<input type='hidden' name='referEmpNo' value='"+result+"'>");
			    		}else{
				    		$(opener.document).find('#referEmpNo').append(
				    			"<input type='hidden' name='referEmpNo' value='"+result+"'>");
			    		}
			    	});
    			}else{
			    	$(opener.document).find('#referEmpNameSpan').html("참조자를 선택하세요");
				    $(opener.document).find('#referEmpNo').html("");
    			}
		    	
		    	self.close();
    		});
    		
    		$('#close').click(function(){
		    	self.close();
    		});
		});
    	
    	function selectEmp() {
    		var isDuplicate = false; 
    		var selNo=$('.active>#empNo').val();
    		var selName=$('.active>#empNameDiv').text();
    		
    		if(selNo==null){
    			alert("참조자를 선택하세요");
    			return;
    		}
    		
    		$('#select>.selectNo').each(function(){
    			if(selNo==$(this).html()){
    				alert("중복된 참조자입니다");
    				isDuplicate = true;
    				return false;
    			}
    		});
    		
    		if(!isDuplicate){
		    	var output="<span class='selectName' style='display: block;'>"+selName+
		    		"</span><span class='selectNo' style='display: none;'>"+selNo+"</span>";
		    	$('#select').append(output);
    		}
    		
		    $('.a-select').removeClass('active');
    	}
    	
    	function deleteEmp() {
    		var lastSelectName = $('#select>.selectName:last');
    		var lastSelectNo = $('#select>.selectNo:last');
    		
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
	 <style type="text/css">
	    sel{
	    	color: #2362b7;
	    }
    </style>
</head>
<body>
	<div class="row gx-2 m-5">
		<div class="col-sm-12 ">
			<div class="row gx-2 mb-3" style="float: right;">
				<div class="col-auto" align="center">
					<button class="btn btn-primary" id="insert">확인</button>
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
				<div class="card-body selectDiv" >
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
			<div class="mt-9 selectDiv">
				<input class="mb-3" type="button" onclick="selectEmp()" value=">>"><br>
				<input class="mt-3" type="button" onclick="deleteEmp()" value="<<">
			</div>
		</div>
		<div class="col-sm-5 ">
			<div class="card h-lg-100 overflow-hidden">
				<div class="card-header bg-light">
					참조자
				</div>
				<div class="card-body selectDiv" id="select">
					<c:if test="${!empty referEmpList }">
						<c:forEach var="vo" items="${referEmpList }"> 
							<span class='selectName' style='display: block;'>${vo.name }</span>
		    				<span class='selectNo' style='display: none;'>${vo.empNo }</span>
						</c:forEach>
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