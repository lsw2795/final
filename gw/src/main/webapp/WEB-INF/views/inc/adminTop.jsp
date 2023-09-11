<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html data-bs-theme="dark" lang="en-US" dir="ltr">

  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- ===============================================-->
    <!--    Document Title-->
    <!-- ===============================================-->
    <title>C O S M O S 관리자 페이지</title>

    <!-- ===============================================-->
    <!--    Favicons-->
    <!-- ===============================================-->
    <script type="text/javascript" src="<c:url value='/js/jquery-3.7.0.min.js'/>"></script>
    <link rel="apple-touch-icon" sizes="180x180" href="<c:url value='/assets/img/favicons/apple-touch-icon.png'/>">
    <link rel="icon" type="image/png" sizes="32x32" href="<c:url value='/assets/img/favicons/favicon-32x32.png'/>">
    <link rel="icon" type="image/png" sizes="16x16" href="<c:url value='/assets/img/favicons/favicon-16x16.png'/>">
    <link rel="shortcut icon" type="image/x-icon" href="<c:url value='/planet_icon.ico'/>">
    <link rel="manifest" href="<c:url value='/assets/img/favicons/manifest.json'/>">
 	<meta name="msapplication-TileImage" content="<c:url value='/assets/img/favicons/mstile-150x150.png'/>">
    <meta name="theme-color" content="#ffffff">
    <script src="<c:url value='/assets/js/config.js'/>"></script>
    <script src="<c:url value='/vendors/simplebar/simplebar.min.js'/>"></script>

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
    <script>
		var isRTL = JSON.parse(localStorage.getItem('isRTL'));
		if (isRTL) {
		  var linkDefault = document.getElementById('style-default');
		  var userLinkDefault = document.getElementById('user-style-default');
		  linkDefault.setAttribute('disabled', true);
		  userLinkDefault.setAttribute('disabled', true);
		  document.querySelector('html').setAttribute('dir', 'rtl');
		} else {
		  var linkRTL = document.getElementById('style-rtl');
		  var userLinkRTL = document.getElementById('user-style-rtl');
		  linkRTL.setAttribute('disabled', true);
		  userLinkRTL.setAttribute('disabled', true);
		}
      
    </script>
    <script type="text/javascript">
    	$(function(){
    		var total = 0;
    		 $.when(newMessage(),anonymousReportCount(),anonymousMarketCount()).done(function() {
    			 totalReport();
    			 bellSet();
    	    }); 
    	});
    	
   		function bellSet(){
   	  		var newCnt=$('.new-list').find('.new').length;
   	  		if(newCnt>0){
   	  			$('#navbarDropdownNotification').addClass('notification-indicator');
   	  			$('#navbarDropdownNotification').addClass('notification-indicator-primary');
   	  		}
     	 }
   		
   		function newMessage(){
       		return $.ajax({
       			url:"<c:url value='/message/newMessageAjax'/>",
       		   	type:"post",
       		   	dataType:"json",
       		   	success:function(res){
       		   		$('#newMessage').text(res);
       		   		$('#totalMessage').text(res);
       		   		messageInfo(res);
       		    },error:function(xhr, status, error){
       		    	alert(status+" : "+error);
       		   	}
       		});
       	}
   		
   		function anonymousReportCount(){
       		return $.ajax({
       			url:"<c:url value='/report/anonymous/countAjax'/>",
       		   	type:"post",
       		   	dataType:"json",
       		   	success:function(res){
       		   		$('#reportCount').text(res);
       		   		anonymousReportInfo(res);
       		    },error:function(xhr, status, error){
       		    	alert(status+" : "+error);
       		   	}
       		});
       	}
   		
   		function anonymousMarketCount(){
       		return $.ajax({
       			url:"<c:url value='/report/anonymous/countMarketAjax'/>",
       		   	type:"post",
       		   	dataType:"json",
       		   	success:function(res){
       		   		$('#marketCount').text(res);
       		   		anonymousMarketReportInfo(res);
       		    },error:function(xhr, status, error){
       		    	alert(status+" : "+error);
       		   	}
       		});
       	}
   		
   		
   		function totalReport(){
   			var cnt1=$('#marketCount').text();
   			cnt1=parseInt(cnt1);
   			var cnt2=$('#reportCount').text();
   			cnt2=parseInt(cnt2);
   			$('#reportTotal').text(cnt1+cnt2);
   		}
   		
   		function messageInfo(cnt){
           	var str="";
           	var topstr="<div class='list-group-title border-bottom'>NEW</div>";
           	
            if(cnt>0){
           		str+="<div class='list-group-item new'>";
           	  	str+="<a class='notification notification-flush notification-unread' href='<c:url value='/message/messageList'/>'>";
	           	str+="<div class='notification-avatar'>";
	            str+="<div class='avatar avatar-2xl me-3'>";
	       		str+="<img class='rounded-circle' style='background-color:white;' src='<c:url value='/images/message.png'/>' alt='쪽지아이콘' />";
	           	str+="</div>";
	           	str+="</div>";
	           	str+="<div class='notification-body'>";
	           	str+="<p class='mb-1'>";
	           	str+="<strong>안읽은 메시지</strong> : "+cnt+"건이 있습니다.</p>";
	           	str+="</div></a></div>";
             }else{
             	return;
             }
             	
             if($('.new-list').find('.new').length==0){
             	$('.new-list').html(topstr);
             } 
             $('.new-list').append(str);
       	}
   		
   		function anonymousReportInfo(cnt){
           	var str="";
           	var topstr="<div class='list-group-title border-bottom'>NEW</div>";
           	
           	if(cnt>0){
          	  str+="<div class='list-group-item new'>";
          	  str+="<a class='notification notification-flush notification-unread' href='<c:url value='/report/anonymousReportList'/>'>";
          	  str+="<div class='notification-avatar'>";
          	  str+="<div class='avatar avatar-2xl me-3'>";
          	  str+="<img class='rounded-circle' style='background-color:white;' src='<c:url value='/images/reportCount.png'/>' alt='익명게시판 신고건' />";
          	  str+="</div>";
          	  str+="</div>";
          	  str+="<div class='notification-body'>";
          	  str+="<p class='mb-1'>";
          	  str+="<strong>익명게시판 신고</strong> : "+cnt+"건이 있습니다.</p>";
          	  str+="</div></a></div>";
           	}else{
           		return;
           	}
           	
           	if($('.new-list').find('.new').length==0){
           		$('.new-list').html(topstr);
           	} 
           	$('.new-list').append(str);
             
       	}
   		
   		function anonymousMarketReportInfo(cnt){
           	var str="";
           	var topstr="<div class='list-group-title border-bottom'>NEW</div>";
           	
           	if(cnt>0){
          	  str+="<div class='list-group-item new'>";
          	  str+="<a class='notification notification-flush notification-unread' href='<c:url value='/report/warningMarketList'/>'>";
          	  str+="<div class='notification-avatar'>";
          	  str+="<div class='avatar avatar-2xl me-3'>";
          	  str+="<img class='rounded-circle' style='background-color:white;' src='<c:url value='/images/reportCount.png'/>' alt='중고거래 신고건' />";
          	  str+="</div>";
          	  str+="</div>";
          	  str+="<div class='notification-body'>";
          	  str+="<p class='mb-1'>";
          	  str+="<strong>중고거래 신고</strong> : "+cnt+"건이 있습니다.</p>";
          	  str+="</div></a></div>";
           	}else{
           		return;
           	}
           	
           	if($('.new-list').find('.new').length==0){
           		$('.new-list').html(topstr);
           	} 
           	$('.new-list').append(str);
             
       	}
    </script>
  </head>
  <body>

    <!-- ===============================================-->
    <!--    Main Content-->
    <!-- ===============================================-->
    <main class="main" id="top">
      <div class="container" data-layout="container">
        <script>
          var isFluid = JSON.parse(localStorage.getItem('isFluid'));
          if (isFluid) {
            var container = document.querySelector('[data-layout]');
            container.classList.remove('container');
            container.classList.add('container-fluid');
          }
        </script>
        <nav class="navbar navbar-light navbar-vertical navbar-expand-xl">
          <script>
            var navbarStyle = localStorage.getItem("navbarStyle");
            if (navbarStyle && navbarStyle !== 'transparent') {
              document.querySelector('.navbar-vertical').classList.add(`navbar-${navbarStyle}`);
            }
          </script>
          <div class="d-flex align-items-center">
           <!-- <div class="toggle-icon-wrapper">
              <button class="btn navbar-toggler-humburger-icon navbar-vertical-toggle" data-bs-toggle="tooltip" data-bs-placement="left" title="Toggle Navigation">
              	<span class="navbar-toggle-icon"><span class="toggle-line"></span></span>
              </button>
            </div> 토글 버튼 봉인-->
            <a class="navbar-brand" href="<c:url value='/admin/main'/>">
              <div class="d-flex align-items-center py-3">
              	<img src="<c:url value='/adminfinallogo.png'/>" alt="" width="150" />
              </div>
            </a>
          </div>
          <!-- side nav -->
          <div class="collapse navbar-collapse" id="navbarVerticalCollapse">
            <div class="navbar-vertical-content scrollbar">
				<ul class="navbar-nav flex-column mb-3" id="navbarVerticalNav">
					<li class="nav-item">
            			<c:import url="/inc/empMain"></c:import>
					</li>
					<li class="nav-item"><!-- parent pages-->
						<a class="nav-link dropdown-indicator" href="#mypage" role="button" data-bs-toggle="collapse">
	                    	<div class="d-flex align-items-center">
	                    		<span class="nav-link-icon"><span class="fas fa-address-card"></span></span>
	                    		<span class="nav-link-text ps-1">사원 관리</span>
	                    	</div>
	                  	</a>
	                  	<ul class="nav collapse" id="mypage">
                    		<li class="nav-item"><!-- more inner pages-->
                    			<a class="nav-link " href="<c:url value='/admin/employee/employeeRegister'/>" role="button" data-toggle="collapse">
                        			<div class="d-flex align-items-center">
                        				<span class="nav-link-text ps-1">사원 등록</span>
                        			</div> 
                      			</a>
                    		</li>
                    		<li class="nav-item"><!-- more inner pages-->
                    			<a class="nav-link " href="<c:url value='/admin/employee/employeeList'/>" role="button" data-toggle="collapse">
                        			<div class="d-flex align-items-center">
                        				<span class="nav-link-text ps-1">사원 목록</span>
                        			</div> 
                      			</a>
                    		</li>
						</ul>
                  	</li>
                  	<li class="nav-item"><!-- parent pages-->
						<a class="nav-link dropdown-indicator" href="#a" role="button" data-bs-toggle="collapse">
	                    	<div class="d-flex align-items-center">
	                    		<span class="nav-link-icon"><span class="fas fa-user-check"></span></span>
	                    		<span class="nav-link-text ps-1">근태관리</span>
	                    	</div>
	                  	</a>
	                  	<ul class="nav collapse" id="a">
                    		<li class="nav-item"><!-- more inner pages-->
                    			<a class="nav-link " href="<c:url value='/admin/commute/allCommute'/>">
                        			<div class="d-flex align-items-center">
                        				<span class="nav-link-text ps-1">전사원 근태 관리</span>
                        			</div> 
                      			</a>
                    		</li>
						</ul>
                  	</li>
                  	<li class="nav-item"><!-- parent pages-->
						<a class="nav-link dropdown-indicator" href="#b" role="button" data-bs-toggle="collapse">
	                    	<div class="d-flex align-items-center">
	                    		<span class="nav-link-icon"><span class="fas fa-file-export"></span></span>
	                    		<span class="nav-link-text ps-1">전자결재</span>
	                    	</div>
	                  	</a>
	                  	<ul class="nav collapse" id="b">
                    		<li class="nav-item"><!-- more inner pages-->
                    			<a class="nav-link " href="<c:url value='/approval/confirmList/admin'/>">
                        			<div class="d-flex align-items-center">
                        				<span class="nav-link-text ps-1">결재 문서 관리</span>
                        			</div> 
                      			</a>
                    		</li>
                    		<li class="nav-item"><!-- more inner pages-->
                    			<a class="nav-link " href="<c:url value='/document/formList'/>">
                        			<div class="d-flex align-items-center">
                        				<span class="nav-link-text ps-1">문서 양식 관리</span>
                        			</div> 
                      			</a>
                    		</li>
						</ul>
                  	</li>
                  	<li class="nav-item"><!-- parent pages-->
						<a class="nav-link dropdown-indicator" href="#c" role="button" data-bs-toggle="collapse">
	                    	<div class="d-flex align-items-center">
	                    		<span class="nav-link-icon"><span class="fas fa-plug"></span></span>
	                    		<span class="nav-link-text ps-1">자원관리</span>
	                    	</div>
	                  	</a>
	                  	<ul class="nav collapse" id="c">
                    		<li class="nav-item"><!-- more inner pages-->
                    			<a class="nav-link " href="<c:url value='/admin/officeProduct/addOfficeProduct'/>">
                        			<div class="d-flex align-items-center">
                        				<span class="nav-link-text ps-1">자원 등록</span>
                        			</div> 
                      			</a>
                    		</li>
                    		<li class="nav-item"><!-- more inner pages-->
                    			<a class="nav-link" href="<c:url value='/admin/officeProduct/officeProductList?category=meetingRoom'/>">
                        			<div class="d-flex align-items-center">
                        				<span class="nav-link-text ps-1">자원 목록</span>
                        			</div> 
                      			</a>
                    		</li>
						</ul>
                  	</li>
                  	<li class="nav-item"><!-- parent pages-->
						<a class="nav-link dropdown-indicator" href="#e" role="button" data-bs-toggle="collapse">
	                    	<div class="d-flex align-items-center">
	                    		<span class="nav-link-icon"><span class="fas fa-envelope-open"></span></span>
	                    		<span class="nav-link-text ps-1">
		                    		쪽지
		                    		<span class="badge rounded-pill text-bg-primary" id="totalMessage"></span>
	                    		</span>
	                    	</div>
	                  	</a>
	                  	<ul class="nav collapse" id="e">
                    		<li class="nav-item"><!-- more inner pages-->
                    			<a class="nav-link " href="<c:url value='/message/messageWrite'/>">
                        			<div class="d-flex align-items-center">
                        				<span class="nav-link-text ps-1">쪽지 쓰기</span>
                        			</div> 
                      			</a>
                    		</li>
                    		<li class="nav-item"><!-- more inner pages-->
                    			<a class="nav-link " href="<c:url value='/message/messageList'/>">
                        			<div class="d-flex align-items-center">
                        				<span class="nav-link-text ps-1">
                        					쪽지함
                        					<span class="badge rounded-pill text-bg-primary" id="newMessage"></span>
                        				</span>
                        			</div> 
                      			</a>
                    		</li>
						</ul>
                  	</li>
                  	<li class="nav-item"><!-- parent pages-->
						<a class="nav-link dropdown-indicator" href="#f" role="button" data-bs-toggle="collapse">
	                    	<div class="d-flex align-items-center">
	                    		<span class="nav-link-icon"><span class="fas fa-download"></span></span>
	                    		<span class="nav-link-text ps-1">자료실 관리</span>
	                    	</div>
	                  	</a>
	                  	<ul class="nav collapse" id="f">
                    		<li class="nav-item"><!-- more inner pages-->
                    			<a class="nav-link " href="<c:url value='/admin/pds/management'/>">
                        			<div class="d-flex align-items-center">
                        				<span class="nav-link-text ps-1">파일 관리</span>
                        			</div> 
                      			</a>
                    		</li>
                    		<li class="nav-item"><!-- more inner pages-->
                    			<a class="nav-link " href="<c:url value='/admin/pds/boardManagement'/>">
                        			<div class="d-flex align-items-center">
                        				<span class="nav-link-text ps-1">게시글 목록</span>
                        			</div> 
                      			</a>
                    		</li>
						</ul>
                  	</li>
                  	<!-- label-->
                  	<div class="row navbar-vertical-label-wrapper mt-3 mb-2">
	                    <div class="col-auto navbar-vertical-label">
	                    	게시판
	                    </div>
	                    <div class="col ps-0">
	                      <hr class="mb-0 navbar-vertical-divider" />
	                    </div>
                  	</div>
                  	<li class="nav-item"><!-- parent pages-->
                  		<a class="nav-link" href="<c:url value='/admin/board/manageBoards'/>" role="button" data-toggle="collapse">
	                    	<div class="d-flex align-items-center">
	                    		<span class="nav-link-icon"><span class="fas fa-key"></span></span>
	                    		<span class="nav-link-text ps-1">게시판 관리</span>
	                    	</div>
	                  	</a>
	                  	<a class="nav-link" href="<c:url value='/admin/board/noticeList'/>" role="button" data-toggle="collapse">
	                    	<div class="d-flex align-items-center">
	                    		<span class="nav-link-icon"><span class="fas fa-thumbtack"></span></span>
	                   			<span class="nav-link-text ps-1">공지사항</span>
	                    	</div>
	                  	</a>
	                  	<a class="nav-link" href="<c:url value='/admin/qna/list'/>" role="button" data-toggle="collapse">
	                    	<div class="d-flex align-items-center">
	                    		<span class="nav-link-icon"><span class="fas fa-key"></span></span>
	                   			<span class="nav-link-text ps-1">Q&A</span>
	                    	</div>
	                  	</a>
						<a class="nav-link" href="<c:url value='/admin/board/faqList'/>" role="button" data-toggle="collapse">
	                    	<div class="d-flex align-items-center">
	                    		<span class="nav-link-icon"><span class="fas fa-question-circle"></span></span>
	                    		<span class="nav-link-text ps-1">FAQ</span>
	                    	</div>
	                  	</a>
                  	</li>
                  	<!-- label-->
                  	<div class="row navbar-vertical-label-wrapper mt-3 mb-2">
	                    <div class="col-auto navbar-vertical-label">
	                    	커뮤니티
	                    </div>
	                    <div class="col ps-0">
	                      <hr class="mb-0 navbar-vertical-divider" />
	                    </div>
                  	</div>
                  	<li class="nav-item"><!-- parent pages-->
						<a class="nav-link dropdown-indicator" href="#g" role="button" data-bs-toggle="collapse">
	                    	<div class="d-flex align-items-center">
	                    		<span class="nav-link-icon"><span class="fas fa-parachute-box"></span></span>
	                    		<span class="nav-link-text ps-1">동호회 관리</span>
	                    	</div>
	                  	</a>
	                  	<ul class="nav collapse" id="g">
                    		<li class="nav-item"><!-- more inner pages-->
                    			<a class="nav-link " href="<c:url value='/admin/adminclub/clubList'/>">
                        			<div class="d-flex align-items-center">
                        				<span class="nav-link-text ps-1">사내 동호회 현황</span>
                        			</div> 
                      			</a>
                    		</li>
                    		<li class="nav-item"><!-- more inner pages-->
                    			<a class="nav-link " href="<c:url value='/admin/adminclub/adminPayment'/>">
                        			<div class="d-flex align-items-center">
                        				<span class="nav-link-text ps-1">동호회 결제 관리</span>
                        			</div> 
                      			</a>
                    		</li>
                    		<li class="nav-item"><!-- more inner pages-->
                    			<a class="nav-link " href="<c:url value='/admin/adminclub/adminClubReport'/>">
                        			<div class="d-flex align-items-center">
                        				<span class="nav-link-text ps-1">신고함</span>
                        			</div> 
                      			</a>
                    		</li>
						</ul>
                  	</li>
                  	<li class="nav-item"><!-- parent pages-->
						<a class="nav-link dropdown-indicator" href="#h" role="button" data-bs-toggle="collapse">
	                    	<div class="d-flex align-items-center">
	                    		<span class="nav-link-icon"><span class="fas fa-carrot"></span></span>
	                    		<span class="nav-link-text ps-1">
	                    		신고글 관리
	                    		<span class="badge rounded-pill text-bg-primary" id="reportTotal"></span>
	                    		</span>
	                    	</div>
	                  	</a>
	                  	<ul class="nav collapse" id="h">
                    		<li class="nav-item"><!-- more inner pages-->
                    			<a class="nav-link " href="<c:url value='/report/anonymousReportList'/>">
                        			<div class="d-flex align-items-center">
                        				<span class="nav-link-text ps-1">
                        				익명게시판 신고함
                        				<span class="badge rounded-pill text-bg-primary" id="reportCount"></span>	
                        				</span>
                        			</div> 
                      			</a>
                    		</li>
                    		<li class="nav-item"><!-- more inner pages-->
                    			<a class="nav-link " href="<c:url value='/report/warningMarketList'/>">
                        			<div class="d-flex align-items-center">
                        				<span class="nav-link-text ps-1">
                        				중고거래 신고함
                        				<span class="badge rounded-pill text-bg-primary" id="marketCount"></span>	
                        				</span>
                        			</div> 
                      			</a>
                    		</li>
                    	</ul>
                  	</li>
			</div>
		  </div>
        </nav>
        <div class="content">
        <!-- top nav -->
          <nav class="navbar navbar-light navbar-glass navbar-top navbar-expand">
            <button class="btn navbar-toggler-humburger-icon navbar-toggler me-1 me-sm-3" type="button" data-bs-toggle="collapse" data-bs-target="#navbarVerticalCollapse" aria-controls="navbarVerticalCollapse" aria-expanded="false" aria-label="Toggle Navigation"><span class="navbar-toggle-icon"><span class="toggle-line"></span></span></button>
            <a class="navbar-brand me-1 me-sm-3" href="index.jsp">
              <div class="d-flex align-items-center"><img src="title.png" alt="" width="150" />
              </div>
            </a>
            <ul class="navbar-nav navbar-nav-icons ms-auto flex-row align-items-center">
              <li class="nav-item dropdown">
                <a class="nav-link px-0 fa-icon-wait" id="navbarDropdownNotification" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false" data-hide-on-body-scroll="data-hide-on-body-scroll">
                	<span class="fas fa-bell" data-fa-transform="shrink-6" style="font-size: 33px;"></span>
                </a>
                <div class="dropdown-menu dropdown-caret dropdown-caret dropdown-menu-end dropdown-menu-card dropdown-menu-notification dropdown-caret-bg" aria-labelledby="navbarDropdownNotification">
                  <div class="card bell card-notification shadow-none">
                    <div class="card-header">
                      <div class="row justify-content-between align-items-center">
                        <div class="col-auto">
                          <h6 class="card-header-title mb-0">알림</h6>
                        </div>
                      </div>
                    </div>
                    <div class="scrollbar-overlay" style="max-height:19rem">
                      <div class="list-group list-group-flush fw-normal fs--1">
                        <div class="list-group-item new-list">
                            <div class="notification-body p-3" align="center">
                              <p class="mb-1">
                              	<strong>새로운 알림이 없습니다.</strong> 
                              </p>
                            </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </li>
              <li class="nav-item dropdown px-1">
                <a class="nav-link p-1" role="button" href="<c:url value='/login/logout'/>">
                  <svg xmlns="http://www.w3.org/2000/svg" width="27" height="27" fill="currentColor" class="bi bi-box-arrow-right" viewBox="0 0 16 16">
  					<path fill-rule="evenodd" d="M10 12.5a.5.5 0 0 1-.5.5h-8a.5.5 0 0 1-.5-.5v-9a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 .5.5v2a.5.5 0 0 0 1 0v-2A1.5 1.5 0 0 0 9.5 2h-8A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h8a1.5 1.5 0 0 0 1.5-1.5v-2a.5.5 0 0 0-1 0v2z"/>
  					<path fill-rule="evenodd" d="M15.854 8.354a.5.5 0 0 0 0-.708l-3-3a.5.5 0 0 0-.708.708L14.293 7.5H5.5a.5.5 0 0 0 0 1h8.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3z"/>
				  </svg>	
				</a>
              </li>
            </ul>
          </nav>
          <!-- top end -->
          
       
