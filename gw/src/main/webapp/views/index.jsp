<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html data-bs-theme="light" lang="en-US" dir="ltr">

  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- ===============================================-->
    <!--    Document Title-->
    <!-- ===============================================-->
    <title>망하면 김채영 매달아놓기</title>

    <!-- ===============================================-->
    <!--    Favicons-->
    <!-- ===============================================-->
    <link rel="apple-touch-icon" sizes="180x180" href="<c:url value='/assets/img/favicons/apple-touch-icon.png'/>">
    <link rel="icon" type="image/png" sizes="32x32" href="<c:url value='/assets/img/favicons/favicon-32x32.png'/>">
    <link rel="icon" type="image/png" sizes="16x16" href="<c:url value='/assets/img/favicons/favicon-16x16.png'/>">
    <link rel="shortcut icon" type="image/x-icon" href="<c:url value='/assets/img/favicons/favicon.ico'/>">
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
            <div class="toggle-icon-wrapper">
              <button class="btn navbar-toggler-humburger-icon navbar-vertical-toggle" data-bs-toggle="tooltip" data-bs-placement="left" title="Toggle Navigation">
              	<span class="navbar-toggle-icon"><span class="toggle-line"></span></span>
              </button>
            </div>
            <a class="navbar-brand" href="index.jsp">
              <div class="d-flex align-items-center py-3">
              	<img src="title.png" alt="" width="150" />
              </div>
            </a>
          </div>
          <!-- side nav -->
          <div class="collapse navbar-collapse" id="navbarVerticalCollapse">
            <div class="navbar-vertical-content scrollbar">
				<ul class="navbar-nav flex-column mb-3" id="navbarVerticalNav">
				
					<li class="nav-item"><!-- parent pages-->
						<a class="nav-link dropdown-indicator" href="#mypage" role="button" data-bs-toggle="collapse">
	                    	<div class="d-flex align-items-center">
	                    		<span class="nav-link-icon"><span class="fas fa-address-card"></span></span>
	                    		<span class="nav-link-text ps-1">마이페이지</span>
	                    	</div>
	                  	</a>
	                  	<ul class="nav collapse show" id="mypage">
                    		<li class="nav-item"><!-- more inner pages-->
                    			<a class="nav-link " href="#">
                        			<div class="d-flex align-items-center">
                        				<span class="nav-link-text ps-1">내정보 수정</span>
                        			</div> 
                      			</a>
                    		</li>
                    		<li class="nav-item"><!-- more inner pages-->
                    			<a class="nav-link " href="#">
                        			<div class="d-flex align-items-center">
                        				<span class="nav-link-text ps-1">내가 쓴 글 관리</span>
                        			</div> 
                      			</a>
                    		</li>
                    		<li class="nav-item"><!-- more inner pages-->
                    			<a class="nav-link " href="#">
                        			<div class="d-flex align-items-center">
                        				<span class="nav-link-text ps-1">내 연차 관리</span>
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
                    			<a class="nav-link " href="#">
                        			<div class="d-flex align-items-center">
                        				<span class="nav-link-text ps-1">출/퇴근 현황</span>
                        			</div> 
                      			</a>
                    		</li>
                    		<li class="nav-item"><!-- more inner pages-->
                    			<a class="nav-link " href="#">
                        			<div class="d-flex align-items-center">
                        				<span class="nav-link-text ps-1">연차 휴가 신청</span>
                        			</div> 
                      			</a>
                    		</li>
                    		<li class="nav-item"><!-- more inner pages-->
                    			<a class="nav-link " href="#">
                        			<div class="d-flex align-items-center">
                        				<span class="nav-link-text ps-1">잔여 연차 현황</span>
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
                    			<a class="nav-link " href="#">
                        			<div class="d-flex align-items-center">
                        				<span class="nav-link-text ps-1">결재 문서 작성</span>
                        			</div> 
                      			</a>
                    		</li>
                    		<li class="nav-item"><!-- more inner pages-->
                    			<a class="nav-link " href="#">
                        			<div class="d-flex align-items-center">
                        				<span class="nav-link-text ps-1">결재 문서함</span>
                        			</div> 
                      			</a>
                    		</li>
                    		<li class="nav-item"><!-- more inner pages-->
                    			<a class="nav-link " href="#">
                        			<div class="d-flex align-items-center">
                        				<span class="nav-link-text ps-1">결재 문서 참조함</span>
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
                    			<a class="nav-link " href="#">
                        			<div class="d-flex align-items-center">
                        				<span class="nav-link-text ps-1">자원 예약</span>
                        			</div> 
                      			</a>
                    		</li>
                    		<li class="nav-item"><!-- more inner pages-->
                    			<a class="nav-link " href="#">
                        			<div class="d-flex align-items-center">
                        				<span class="nav-link-text ps-1">자원 예약 내역</span>
                        			</div> 
                      			</a>
                    		</li>
						</ul>
                  	</li>
                  	<li class="nav-item"><!-- parent pages-->
						<a class="nav-link dropdown-indicator" href="#d" role="button" data-bs-toggle="collapse">
	                    	<div class="d-flex align-items-center">
	                    		<span class="nav-link-icon"><span class="fas fa-calendar-alt"></span></span>
	                    		<span class="nav-link-text ps-1">캘린더</span>
	                    	</div>
	                  	</a>
	                  	<ul class="nav collapse" id="d">
                    		<li class="nav-item"><!-- more inner pages-->
                    			<a class="nav-link " href="#">
                        			<div class="d-flex align-items-center">
                        				<span class="nav-link-text ps-1">내 일정 관리</span>
                        			</div> 
                      			</a>
                    		</li>
						</ul>
                  	</li>
                  	<li class="nav-item"><!-- parent pages-->
						<a class="nav-link dropdown-indicator" href="#e" role="button" data-bs-toggle="collapse">
	                    	<div class="d-flex align-items-center">
	                    		<span class="nav-link-icon"><span class="fas fa-envelope-open"></span></span>
	                    		<span class="nav-link-text ps-1">쪽지</span>
	                    	</div>
	                  	</a>
	                  	<ul class="nav collapse" id="e">
                    		<li class="nav-item"><!-- more inner pages-->
                    			<a class="nav-link " href="#">
                        			<div class="d-flex align-items-center">
                        				<span class="nav-link-text ps-1">쪽지 쓰기</span>
                        			</div> 
                      			</a>
                    		</li>
                    		<li class="nav-item"><!-- more inner pages-->
                    			<a class="nav-link " href="#">
                        			<div class="d-flex align-items-center">
                        				<span class="nav-link-text ps-1">보낸 쪽지함</span>
                        			</div> 
                      			</a>
                    		</li>
                    		<li class="nav-item"><!-- more inner pages-->
                    			<a class="nav-link " href="#">
                        			<div class="d-flex align-items-center">
                        				<span class="nav-link-text ps-1">받은 쪽지함</span>
                        			</div> 
                      			</a>
                    		</li>
						</ul>
                  	</li>
                  	<li class="nav-item"><!-- parent pages-->
						<a class="nav-link dropdown-indicator" href="#f" role="button" data-bs-toggle="collapse">
	                    	<div class="d-flex align-items-center">
	                    		<span class="nav-link-icon"><span class="fas fa-download"></span></span>
	                    		<span class="nav-link-text ps-1">자료실</span>
	                    	</div>
	                  	</a>
	                  	<ul class="nav collapse" id="f">
                    		<li class="nav-item"><!-- more inner pages-->
                    			<a class="nav-link " href="#">
                        			<div class="d-flex align-items-center">
                        				<span class="nav-link-text ps-1">파일 다운로드</span>
                        			</div> 
                      			</a>
                    		</li>
                    		<li class="nav-item"><!-- more inner pages-->
                    			<a class="nav-link " href="#">
                        			<div class="d-flex align-items-center">
                        				<span class="nav-link-text ps-1">다운로드 파일 관리</span>
                        			</div> 
                      			</a>
                    		</li>
						</ul>
                  	</li>
                  	<!-- label-->
                  	<div class="row navbar-vertical-label-wrapper mt-3 mb-2">
	                    <div class="col-auto navbar-vertical-label">
	                    	사내게시판
	                    </div>
	                    <div class="col ps-0">
	                      <hr class="mb-0 navbar-vertical-divider" />
	                    </div>
                  	</div>
                  	<li class="nav-item"><!-- parent pages-->
						<a class="nav-link" href="#" role="button" data-bs-toggle="collapse">
	                    	<div class="d-flex align-items-center">
	                    		<span class="nav-link-icon"><span class="fas fa-thumbtack"></span></span>
	                    		<span class="nav-link-text ps-1">공지사항</span>
	                    	</div>
	                  	</a>
						<a class="nav-link" href="#" role="button" data-bs-toggle="collapse">
	                    	<div class="d-flex align-items-center">
	                    		<span class="nav-link-icon"><span class="fas fa-key"></span></span>
	                    		<span class="nav-link-text ps-1">Q&A</span>
	                    	</div>
	                  	</a>
						<a class="nav-link" href="#" role="button" data-bs-toggle="collapse">
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
	                    		<span class="nav-link-text ps-1">동호회</span>
	                    	</div>
	                  	</a>
	                  	<ul class="nav collapse" id="g">
                    		<li class="nav-item"><!-- more inner pages-->
                    			<a class="nav-link " href="#">
                        			<div class="d-flex align-items-center">
                        				<span class="nav-link-text ps-1">동호회 등록</span>
                        			</div> 
                      			</a>
                    		</li>
                    		<li class="nav-item"><!-- more inner pages-->
                    			<a class="nav-link " href="#">
                        			<div class="d-flex align-items-center">
                        				<span class="nav-link-text ps-1">동호회 게시판</span>
                        			</div> 
                      			</a>
                    		</li>
                    		<li class="nav-item"><!-- more inner pages-->
                    			<a class="nav-link " href="#">
                        			<div class="d-flex align-items-center">
                        				<span class="nav-link-text ps-1">동호회 결제</span>
                        			</div> 
                      			</a>
                    		</li>
						</ul>
                  	</li>
                  	<li class="nav-item"><!-- parent pages-->
						<a class="nav-link dropdown-indicator" href="#h" role="button" data-bs-toggle="collapse">
	                    	<div class="d-flex align-items-center">
	                    		<span class="nav-link-icon"><span class="fas fa-carrot"></span></span>
	                    		<span class="nav-link-text ps-1">중고거래</span>
	                    	</div>
	                  	</a>
	                  	<ul class="nav collapse" id="h">
                    		<li class="nav-item"><!-- more inner pages-->
                    			<a class="nav-link " href="#">
                        			<div class="d-flex align-items-center">
                        				<span class="nav-link-text ps-1">거래게시판</span>
                        			</div> 
                      			</a>
                    		</li>
                    		<li class="nav-item"><!-- more inner pages-->
                    			<a class="nav-link " href="#">
                        			<div class="d-flex align-items-center">
                        				<span class="nav-link-text ps-1">추가</span>
                        			</div> 
                      			</a>
                    		</li>
						</ul>
                  	</li>
                  	<li class="nav-item"><!-- parent pages-->
						<a class="nav-link dropdown-indicator" href="#i" role="button" data-bs-toggle="collapse">
	                    	<div class="d-flex align-items-center">
	                    		<span class="nav-link-icon"><span class="fas fa-paper-plane"></span></span>
	                    		<span class="nav-link-text ps-1">피드</span>
	                    	</div>
	                  	</a>
	                  	<ul class="nav collapse" id="i">
                    		<li class="nav-item"><!-- more inner pages-->
                    			<a class="nav-link " href="#">
                        			<div class="d-flex align-items-center">
                        				<span class="nav-link-text ps-1">익명게시판</span>
                        			</div> 
                      			</a>
                    		</li>
                    		<li class="nav-item"><!-- more inner pages-->
                    			<a class="nav-link " href="#">
                        			<div class="d-flex align-items-center">
                        				<span class="nav-link-text ps-1">추가</span>
                        			</div> 
                      			</a>
                    		</li>
						</ul>
                  	</li>
				</ul>
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
              <li class="nav-item d-none d-sm-block">
                <a class="nav-link px-0 notification-indicator notification-indicator-warning notification-indicator-fill fa-icon-wait" href="app/e-commerce/shopping-cart.jsp"><span class="fas fa-shopping-cart" data-fa-transform="shrink-7" style="font-size: 33px;"></span><span class="notification-indicator-number">1</span></a>
              </li>
              <li class="nav-item dropdown">
                <a class="nav-link notification-indicator notification-indicator-primary px-0 fa-icon-wait" id="navbarDropdownNotification" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false" data-hide-on-body-scroll="data-hide-on-body-scroll"><span class="fas fa-bell" data-fa-transform="shrink-6" style="font-size: 33px;"></span></a>
                <div class="dropdown-menu dropdown-caret dropdown-caret dropdown-menu-end dropdown-menu-card dropdown-menu-notification dropdown-caret-bg" aria-labelledby="navbarDropdownNotification">
                  <div class="card card-notification shadow-none">
                    <div class="card-header">
                      <div class="row justify-content-between align-items-center">
                        <div class="col-auto">
                          <h6 class="card-header-title mb-0">Notifications</h6>
                        </div>
                        <div class="col-auto ps-0 ps-sm-3"><a class="card-link fw-normal" href="#">Mark all as read</a></div>
                      </div>
                    </div>
                    <div class="scrollbar-overlay" style="max-height:19rem">
                      <div class="list-group list-group-flush fw-normal fs--1">
                        <div class="list-group-title border-bottom">NEW</div>
                        <div class="list-group-item">
                          <a class="notification notification-flush notification-unread" href="#!">
                            <div class="notification-avatar">
                              <div class="avatar avatar-2xl me-3">
                                <img class="rounded-circle" src="assets/img/team/1-thumb.png" alt="" />
                              </div>
                            </div>
                            <div class="notification-body">
                              <p class="mb-1"><strong>Emma Watson</strong> replied to your comment : "Hello world ð"</p>
                              <span class="notification-time"><span class="me-2" role="img" aria-label="Emoji">ð¬</span>Just now</span>
                            </div>
                          </a>
                        </div>
                        <div class="list-group-item">
                          <a class="notification notification-flush notification-unread" href="#!">
                            <div class="notification-avatar">
                              <div class="avatar avatar-2xl me-3">
                                <div class="avatar-name rounded-circle"><span>AB</span></div>
                              </div>
                            </div>
                            <div class="notification-body">
                              <p class="mb-1"><strong>Albert Brooks</strong> reacted to <strong>Mia Khalifa's</strong> status</p>
                              <span class="notification-time"><span class="me-2 fab fa-gratipay text-danger"></span>9hr</span>
                            </div>
                          </a>
                        </div>
                        <div class="list-group-title border-bottom">EARLIER</div>
                        <div class="list-group-item">
                          <a class="notification notification-flush" href="#!">
                            <div class="notification-avatar">
                              <div class="avatar avatar-2xl me-3">
                                <img class="rounded-circle" src="assets/img/icons/weather-sm.jpg" alt="" />
                              </div>
                            </div>
                            <div class="notification-body">
                              <p class="mb-1">The forecast today shows a low of 20&#8451; in California. See today's weather.</p>
                              <span class="notification-time"><span class="me-2" role="img" aria-label="Emoji">ð¤ï¸</span>1d</span>
                            </div>
                          </a>
                        </div>
                        <div class="list-group-item">
                          <a class="border-bottom-0 notification-unread  notification notification-flush" href="#!">
                            <div class="notification-avatar">
                              <div class="avatar avatar-xl me-3">
                                <img class="rounded-circle" src="assets/img/logos/oxford.png" alt="" />
                              </div>
                            </div>
                            <div class="notification-body">
                              <p class="mb-1"><strong>University of Oxford</strong> created an event : "Causal Inference Hilary 2019"</p>
                              <span class="notification-time"><span class="me-2" role="img" aria-label="Emoji">âï¸</span>1w</span>
                            </div>
                          </a>
                        </div>
                        <div class="list-group-item">
                          <a class="border-bottom-0 notification notification-flush" href="#!">
                            <div class="notification-avatar">
                              <div class="avatar avatar-xl me-3">
                                <img class="rounded-circle" src="assets/img/team/10.jpg" alt="" />
                              </div>
                            </div>
                            <div class="notification-body">
                              <p class="mb-1"><strong>James Cameron</strong> invited to join the group: United Nations International Children's Fund</p>
                              <span class="notification-time"><span class="me-2" role="img" aria-label="Emoji">ðâ</span>2d</span>
                            </div>
                          </a>
                        </div>
                      </div>
                    </div>
                    <div class="card-footer text-center border-top"><a class="card-link d-block" href="app/social/notifications.jsp">View all</a></div>
                  </div>
                </div>
              </li>
              <li class="nav-item dropdown px-1">
                <a class="nav-link fa-icon-wait nine-dots p-1" id="navbarDropdownMenu" role="button" data-hide-on-body-scroll="data-hide-on-body-scroll" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  <svg xmlns="http://www.w3.org/2000/svg" width="16" height="43" viewBox="0 0 16 16" fill="none">
                    <circle cx="2" cy="2" r="2" fill="#6C6E71"></circle>
                    <circle cx="2" cy="8" r="2" fill="#6C6E71"></circle>
                    <circle cx="2" cy="14" r="2" fill="#6C6E71"></circle>
                    <circle cx="8" cy="8" r="2" fill="#6C6E71"></circle>
                    <circle cx="8" cy="14" r="2" fill="#6C6E71"></circle>
                    <circle cx="14" cy="8" r="2" fill="#6C6E71"></circle>
                    <circle cx="14" cy="14" r="2" fill="#6C6E71"></circle>
                    <circle cx="8" cy="2" r="2" fill="#6C6E71"></circle>
                    <circle cx="14" cy="2" r="2" fill="#6C6E71"></circle>
                  </svg></a>
                <div class="dropdown-menu dropdown-caret dropdown-caret dropdown-menu-end dropdown-menu-card dropdown-caret-bg" aria-labelledby="navbarDropdownMenu">
                  <div class="card shadow-none">
                    <div class="scrollbar-overlay nine-dots-dropdown">
                      <div class="card-body px-3">
                        <div class="row text-center gx-0 gy-0">
                          <div class="col-4">
                          	<a class="d-block hover-bg-200 px-2 py-3 rounded-3 text-center text-decoration-none" href="https://google.com/" target="_blank">
                          		<img class="rounded" src="assets/img/nav-icons/google.png" alt="" width="40" height="40" />
                              	<p class="mb-0 fw-medium text-800 text-truncate fs--2 pt-1">Google</p>
                            </a>
                          </div>
                          <div class="col-4">
                          	<a class="d-block hover-bg-200 px-2 py-3 rounded-3 text-center text-decoration-none" href="#!" target="_blank">
                          		<img class="rounded" src="assets/img/nav-icons/spotify.png" alt="" width="40" height="40" />
                              	<p class="mb-0 fw-medium text-800 text-truncate fs--2 pt-1">Spotify</p>
                            </a>
                          </div>
                          <div class="col-4">
                          	<a class="d-block hover-bg-200 px-2 py-3 rounded-3 text-center text-decoration-none" href="#!" target="_blank">
                          		<img class="rounded" src="assets/img/nav-icons/steam.png" alt="" width="40" height="40" />
                              	<p class="mb-0 fw-medium text-800 text-truncate fs--2 pt-1">Steam</p>
                            </a>
                          </div>
                          <div class="col-4">
                          	<a class="d-block hover-bg-200 px-2 py-3 rounded-3 text-center text-decoration-none" href="#!" target="_blank">
                          		<img class="rounded" src="assets/img/nav-icons/github-light.png" alt="" width="40" height="40" />
                              	<p class="mb-0 fw-medium text-800 text-truncate fs--2 pt-1">Github</p>
                            </a>
                          </div>
                          <div class="col-4">
                          	<a class="d-block hover-bg-200 px-2 py-3 rounded-3 text-center text-decoration-none" href="#!" target="_blank">
                          		<img class="rounded" src="assets/img/nav-icons/discord.png" alt="" width="40" height="40" />
                              	<p class="mb-0 fw-medium text-800 text-truncate fs--2 pt-1">Discord</p>
                            </a>
                          </div>
                          <div class="col-4">
                          	<a class="d-block hover-bg-200 px-2 py-3 rounded-3 text-center text-decoration-none" href="#!" target="_blank">
                          		<img class="rounded" src="assets/img/nav-icons/xbox.png" alt="" width="40" height="40" />
                             	<p class="mb-0 fw-medium text-800 text-truncate fs--2 pt-1">xbox</p>
                            </a>
                          </div>
                          <div class="col-12">
                            <hr class="my-3 mx-n3 bg-200" />
                          </div>
                          <div class="col-4">
                          	<a class="d-block hover-bg-200 px-2 py-3 rounded-3 text-center text-decoration-none" href="#!" target="_blank">
                          		<img class="rounded" src="assets/img/nav-icons/twitter.png" alt="" width="40" height="40" />
                              	<p class="mb-0 fw-medium text-800 text-truncate fs--2 pt-1">Twitter</p>
                            </a>
                          </div>
                          <div class="col-4">
                          	<a class="d-block hover-bg-200 px-2 py-3 rounded-3 text-center text-decoration-none" href="#!" target="_blank">
                          		<img class="rounded" src="assets/img/nav-icons/facebook.png" alt="" width="40" height="40" />
                              	<p class="mb-0 fw-medium text-800 text-truncate fs--2 pt-1">Facebook</p>
                            </a>
                          </div>
                          <div class="col-4">
                          	<a class="d-block hover-bg-200 px-2 py-3 rounded-3 text-center text-decoration-none" href="#!" target="_blank">
                          		<img class="rounded" src="assets/img/nav-icons/instagram.png" alt="" width="40" height="40" />
                              	<p class="mb-0 fw-medium text-800 text-truncate fs--2 pt-1">Instagram</p>
                            </a>
                          </div>
                          <div class="col-12"><a class="btn btn-outline-primary btn-sm mt-4" href="#!">Show more</a></div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </li>
            </ul>
          </nav>
          <!-- top end -->
          
       
		 <!-- bottom start -->
          <footer class="footer">
            <div class="row g-0 justify-content-between fs--1 mt-4 mb-3">
              <div class="col-12 col-sm-auto text-center">
                <p class="mb-0 text-600">Thank you for creating with Falcon <span class="d-none d-sm-inline-block">| </span><br class="d-sm-none" /> 2023 &copy; <a href="https://themewagon.com">Themewagon</a></p>
              </div>
              <div class="col-12 col-sm-auto text-center">
                <p class="mb-0 text-600">v3.17.0</p>
              </div>
            </div>
          </footer>
        </div>
      </div>
    </main>
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