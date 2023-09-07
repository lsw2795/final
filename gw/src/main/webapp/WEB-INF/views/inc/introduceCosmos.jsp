<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html data-bs-theme="light" lang="en-US" dir="ltr">

  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- ===============================================-->
    <!--    Document Title-->
    <!-- ===============================================-->
    <title>C O S M O S</title>

    <!-- ===============================================-->
    <!--    Favicons-->
    <!-- ===============================================-->
    <!-- jquery  -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,500,600,700%7cPoppins:300,400,500,600,700,800,900&amp;display=swap" rel="stylesheet">
    <link href="<c:url value='/vendors/simplebar/simplebar.min.css'/>" rel="stylesheet">
    <link href="<c:url value='/assets/css/theme-rtl.css'/>" rel="stylesheet" id="style-rtl">
    <link href="<c:url value='/assets/css/theme.css'/>" rel="stylesheet" id="style-default">
    <link href="<c:url value='/assets/css/user-rtl.css'/>" rel="stylesheet" id="user-style-rtl">
    <link href="<c:url value='/assets/css/user.css'/>" rel="stylesheet" id="user-style-default">
<script defer src="<c:url value='/js/index.js'/>"></script>
<script defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCaWtOJ2c9pcjC4J-t_RDSpIWRbPo6HaKs&callback=initMap">
</script>
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
   	$(function() {
    		$.when(confirmRecord(), newMessage()).done(function() {
    	        bellSet();
    	    });
    		  $('.nav-link').on('click', function() {
    		    // 해당 a 태그에 active 클래스 추가
    		    $(this).addClass('active');
    		    
    		    // 클릭한 a 태그를 제외한 다른 a 태그들의 active 클래스 제거
    		    $('.nav-link').not(this).removeClass('active');
    		  });
    		
		});
    	
    	function bellSet(){
    		var newCnt=$('.new-list').find('.new').length;
    		if(newCnt>0){
    			$('#navbarDropdownNotification').addClass('notification-indicator');
    			$('#navbarDropdownNotification').addClass('notification-indicator-primary');
    		}
    	}
    	
    	function confirmRecord(){
    		return $.ajax({
    			url:"<c:url value='/approval/recordAjax'/>",
    		   	type:"post",
    		   	dataType:"json",
    		   	success:function(res){
    		   		$('#confirm').text(res[0]);
    		   		$('#turn').text(res[1]);
    		   		$('#agree').text(res[2]);
    		   		$('#approval').text(res[0]+res[1]+res[2]);
    		   		approvalInfo(res[0],res[1],res[2]);
    		    },error:function(xhr, status, error){
    		    	alert(status+" : "+error);
    		   	}
    		});
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
    	
    	function approvalInfo(confirm,turn,agree){
        	var str="";
        	var topstr="<div class='list-group-title border-bottom'>NEW</div>";
        	var confirmStr="<strong>결재할 문서</strong> : "+confirm+"건이 있습니다.</p>";
        	var turnStr="<strong>반려된 문서</strong> : "+turn+"건이 있습니다.</p>";
        	var agreeStr="<strong>합의할 문서</strong> : "+agree+"건이 있습니다.</p>";
        	var turnUrl="<a class='notification notification-flush notification-unread' href='<c:url value='/approval/returnList'/>'>";
        	var agreeUrl="<a class='notification notification-flush notification-unread' href='<c:url value='/approval/deptAgreeList'/>'>";
        	var confirmUrl="<a class='notification notification-flush notification-unread' href='<c:url value='/approval/confirm/confirmList'/>'>";
        	var divstr="<div class='list-group-item new'>";	
        	var divstr2="<div class='notification-avatar'>";
        	divstr2+="<div class='avatar avatar-2xl me-3'>";
        	divstr2+="<img class='rounded-circle' src='<c:url value='/images/approval.png'/>' alt='쪽지아이콘' />";
        	divstr2+="</div>";
        	divstr2+="</div>";
        	divstr2+="<div class='notification-body'>";
        	divstr2+="<p class='mb-1'>";
        	
          	if(confirm>0 || turn>0 || agree>0){
	          	if(confirm>0){
		        	str+=divstr;
		        	str+=confirmUrl;
		        	str+=divstr2;
		        	str+=confirmStr;
		        	str+="</div></a></div>";
	          	}
	          	if(turn>0){
	          		str+=divstr;
		        	str+=turnUrl;
		        	str+=divstr2;
	          	  	str+=turnStr;
	          	  	str+="</div></a></div>";
	          	}
	          	if(agree>0){
	          		str+=divstr;
		        	str+=agreeUrl;
		        	str+=divstr2;
	          	  	str+=agreeStr;
	          	  	str+="</div></a></div>";
	          	}
          	}else{
          		return;
          	}
          	
          	if($('.new-list').find('.new').length==0){
          		$('.new-list').html(topstr);
          	} 
          	$('.new-list').append(str);
          
    	}
    	
    	function messageInfo(cnt){
        	var str="";
        	var topstr="<div class='list-group-title border-bottom'>NEW</div>";
        	
          	if(cnt>0){
        	  str+="<div class='list-group-item new'>";
        	  str+="<a class='notification notification-flush notification-unread' href='<c:url value='/message/messageList'/>'>";
        	  str+="<div class='notification-avatar'>";
        	  str+="<div class='avatar avatar-2xl me-3'>";
        	  str+="<img class='rounded-circle' src='<c:url value='/images/message.png'/>' alt='쪽지아이콘' />";
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
    	
    	function reservation(){
    		var str="";
        	var topstr="<div class='list-group-title border-bottom'>NEW</div>";
        	
        	if(cnt>0){
        		
        	}
    	}
    	
    	$(function() {
			$('#clubBtn').click(function() {
				if(confirm('동호회를 새로 개설하시겠습니까?')){
					
				}
			});
		});
</script>
<style type="text/css">
	img.absolute-size {
	  width: 86%; /* 원하는 절대 너비 */
	  height: 330px; /* 원하는 절대 높이 */
	}
	
	#map{
		width:700px;
		height:500px;
	}
	
	div#galaxy {
	    text-align: center;
	}
	
	
	div#introduce {
	    text-align: center;
	    font-weight: bold;
	    display: flex;
	    flex-wrap: nowrap;
	    flex-direction: row;
	    justify-content: center;
	}
	
	div#content {
	    font-style: italic;
	    padding: 30px 100px 30px 100px;
	    line-height: 1.5;
	}
	
	h3 {
	    line-height: 1.5;
	}
	
	div#address {
	    padding: 0 100px 0 100px;
	    display: flex;
	    justify-content: space-between;
	}
	
	strong {
	    color: #34588e;
	}
	
	.card {
	    padding: 30px 0 30px 0;
	}
</style>
  </head>
  <body>

    <!-- ===============================================-->
    <!--    Main Content-->
    <!-- ===============================================-->
    <main class="main" id="top">
      <div class="container-lg" data-layout="container">
        <script>
          var isFluid = JSON.parse(localStorage.getItem('isFluid'));
          if (isFluid) {
            var container = document.querySelector('[data-layout]');
            container.classList.remove('container');
            container.classList.add('container-fluid');
          }
        </script>
        <div class="content">
        <!-- top nav -->
          <nav class="navbar navbar-light navbar-glass navbar-top">
            <div class = "container">
            <a class="navbar-brand me-1 me-sm-3" href="<c:url value='/'/>">
              <div class="d-flex align-items-center"><img src="title.png" alt="" width="150" />
              </div>
            </a>
            <ul class="navbar-nav navbar-nav-icons ms-auto flex-row align-items-center">
              <li>
				<button class="nav-link px-0 notification-indicator-warning notification-indicator-fill fa-icon-wait" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight" aria-controls="offcanvasRight">
					<span class="fas fa-newspaper" data-fa-transform="shrink-7" style="font-size: 33px;"></span>
				</button>
              </li>
              <li>
				<button class="nav-link px-0 notification-indicator-warning notification-indicator-fill fa-icon-wait" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight" aria-controls="offcanvasRight">
					<span class="fas fa-users" data-fa-transform="shrink-7" style="font-size: 33px;"></span>
				</button>
              </li>
              
              <li class="nav-item dropdown">
                <a class="nav-link px-0 fa-icon-wait" id="navbarDropdownNotification" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false" data-hide-on-body-scroll="data-hide-on-body-scroll">
                	<span class="fas fa-bell" data-fa-transform="shrink-6" style="font-size: 33px;"></span>
                </a>
                <div class="dropdown-menu dropdown-caret dropdown-caret dropdown-menu-end dropdown-menu-card dropdown-menu-notification dropdown-caret-bg" aria-labelledby="navbarDropdownNotification">
                  <div class="card card-notification shadow-none">
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
            </div>
          </nav>
          <!-- top end -->
<div class="card">
<div id = "introduce">
	<img src = "<c:url value='/images/planet.png'/>"style=width:40px;height:40px;">
	<h1 id = "title"><strong>ABOUT COSMOS</strong></h1>
</div>
<div id = "galaxy">
	<img src = "<c:url value='/images/galaxy.jpg'/>" class="absolute-size">
</div>
<div id="contentBox">
	<div id="content">
		<h3>Our vision is to enhance the future and make the world a better place. 
		<br>Join us in shaping the future</h3>
	</div>
	<div id="address">
		<div id="zip">
			<h4><strong>Address</strong></h4>
			<h4>54, Seocho-daero 77-gil, <br>
			Seocho-gu, Seoul,<br> 
			Republic of Korea</h4><br>
			<h4><strong>TEL</strong></h4>
			<h4>02-532-6500<br>
			(9:00 ~ 18:00)
			</h4><br>
			<h4><strong>ZIPCODE</strong></h4>
			<h4>06611</h4><br><br>
			
			<h4><strong>Since 1992..</strong></h4>
		</div>
		<div id="map" ></div>
	</div>
</div>
</div>
</body>
<%@ include file="../inc/bottom.jsp"%>