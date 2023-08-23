<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결재선 생성</title>
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
    		
    		$('.btnSel').click(function(){
    			var selNo=$('.active>#empNo').val();
        		var selName=$('.active>#empNameDiv').html();
        		var span="confirm1_Name";
        		var input="confirm1";
        		var msg="검토자";
        		
        		if($(this).attr('id')=='btConfirm2'){
        			span="confirm2_Name";
        			input="confirm2";
        			msg="확인자";
        		}else if($(this).attr('id')=='btConfirm3'){
        			span="confirm3_Name";
        			input="confirm3";
        			msg="승인자";
        		}
        		
        		if(selNo==null){
        			alert(msg+"를 선택하세요");
        			return;
        		}
        		
        		var str="<span class='"+span+"' style='display: block;'>"+selName+"</span>"+
        		"<input type='hidden' class='"+input+"' name='"+input+"' value=\""+selNo+"\">";
    			$('#'+input+'Sel').html(str);
    			
    			$('.a-select').removeClass('active');
    		});
    		
    		$('.btnDel').click(function(){
    			var className="confirm1_Name";
        		var divId="confirm1";
        		
        		if($(this).attr('id')=='btDelConfirm2'){
        			className="confirm2_Name";
        			divId="confirm2";
        		}else if($(this).attr('id')=='btDelConfirm3'){
        			className="confirm3_Name";
        			divId="confirm3";
        		}
    			var lastSelectName = $('#'+divId+'Sel>.'+className);
        		var lastSelectNo = $('#'+divId+'Sel>.'+divId);
        	    if (lastSelectName.length > 0) {
        	        lastSelectName.remove();
        	        lastSelectNo.remove();
        	    }
    		});
    		  
    		$('#insert').click(function(){
    			if($('#confirm1Sel').find('.confirm1').length<1){
		   			alert("검토자를 선택하세요");
		   			return false;
    			}
    			if($('#confirm2Sel').find('.confirm2').length<1){
		   			alert("확인자를 선택하세요");
		   			return false;
    			}
    			if($('#confirm3Sel').find('.confirm3').length<1){
		   			alert("승인자를 선택하세요");
		   			return false;
    			}
    			var confirm1=$('.confirm1').val();
    			var confirm2=$('.confirm2').val();
    			var confirm3=$('.confirm3').val();
    			
    			if(confirm1==confirm2){
    				alert("검토자와 확인자가 동일합니다");
		   			return false;
    			}
    			if(confirm1==confirm3){
    				alert("검토자와 승인자가 동일합니다");
		   			return false;
    			}
    			if(confirm2==confirm3){
    				alert("확인자와 승인자가 동일합니다");
		   			return false;
    			}
    			
	    		$.ajax({
			    	url:"<c:url value='/confirm/createLineAjax'/>",
			   		type:"post",
			   		dataType:"text",
			   		data:$('form[name=frmConfirmLine]').serializeArray(),
			   		success:function(res){
			   			alert(res);
			   			window.close();
			    	},error:function(xhr, status, error){
			    		alert(status+" : "+error);
			   		}
			   	});
    		});
    		
    		$('#close').click(function(){
		    	window.close();
    		});
		});
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
				<div class="card-header bg-light">
					조직도
				</div>
				<div class="card-body LineSelectDiv scrollbar" >
		        	<ul id="navbarVerticalNav">
		        	<c:forEach var="deptVo" items="${deptList }">
		        		<li class="nav-item">
		        			<a class="nav-link" href="#${deptVo.deptNo }" data-bs-toggle="collapse" >
			                    ${deptVo.name}
		                  	</a>
		                  	<ul class="nav collapse" id="${deptVo.deptNo }">
		                  	<c:forEach var="employeeMap" items="${empList }">
		                  	<c:if test="${deptVo.deptNo == employeeMap['DEPT_NO']}">
			                  	<c:if test="${employeeMap['POSITION_RANK']>=3}">
					            	<li class="nav-item" style="width: 100%"><!-- 사원 -->
						        		<a class="a-select nav-link" href="#">
				                    		<span class="nav-link-icon"><span class="fas fa-user"></span></span>
						                	<div id="empNameDiv" style="display: inline;">${employeeMap['NAME']}</div>
						                	<input type="hidden" id="empNo" value="${employeeMap['EMP_NO'] }">
						                </a>
					                </li>
				                </c:if>
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
					<input class="mb-2 btnSel" type="button" id="btConfirm1" value=">>"><br>
					<input class="mt-2 btnDel" type="button" id="btDelConfirm1" value="<<">
				</div>
				<div class="mb-7 mt-1">
					<input class="mb-2 btnSel" type="button" id="btConfirm2" value=">>"><br>
					<input class="mt-2 btnDel" type="button" id="btDelConfirm2" value="<<">
				</div>
				<div class="mb-7 mt-1">
					<input class="mb-2 btnSel" type="button" id="btConfirm3" value=">>"><br>
					<input class="mt-2 btnDel" type="button" id="btDelConfirm3" value="<<">
				</div>
			</div>
		</div>
		<div class="col-sm-5 ">
		<form name="frmConfirmLine" method="post" action="<c:url value='/confirm/createLine'/>">
			<div class="row gx-2">
				<div class="card h-lg-100 mb-6 overflow-hidden">
					<div class="card-header bg-light">
						검토자
					</div>
					<div class="card-body" id="confirm1Sel">
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
		</form>
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