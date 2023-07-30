<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html data-bs-theme="light" lang="en-US" dir="ltr">

  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">


    <!-- ===============================================-->
    <!--    Document Title-->
    <!-- ===============================================-->
    <title>Falcon | Dashboard &amp; Web App Template</title>


    <!-- ===============================================-->
    <!--    Favicons-->
    <!-- ===============================================-->
    <link rel="apple-touch-icon" sizes="180x180" href="assets/img/favicons/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="assets/img/favicons/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="assets/img/favicons/favicon-16x16.png">
    <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicons/favicon.ico">
    <link rel="manifest" href="assets/img/favicons/manifest.json">
    <meta name="msapplication-TileImage" content="assets/img/favicons/mstile-150x150.png">
    <meta name="theme-color" content="#ffffff">
    <script src="assets/js/config.js"></script>
    <script src="vendors/simplebar/simplebar.min.js"></script>


    <!-- ===============================================-->
    <!--    Stylesheets-->
    <!-- ===============================================-->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,500,600,700%7cPoppins:300,400,500,600,700,800,900&amp;display=swap" rel="stylesheet">
    <link href="vendors/simplebar/simplebar.min.css" rel="stylesheet">
    <link href="assets/css/theme-rtl.css" rel="stylesheet" id="style-rtl">
    <link href="assets/css/theme.css" rel="stylesheet" id="style-default">
    <link href="assets/css/user-rtl.css" rel="stylesheet" id="user-style-rtl">
    <link href="assets/css/user.css" rel="stylesheet" id="user-style-default">
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
              <div class="d-flex align-items-center py-3"><img class="me-2" src="assets/img/icons/spot-illustrations/falcon.png" alt="" width="40" />
              	<span class="font-sans-serif">falcon</span>
              </div>
            </a>
          </div>
          <div class="collapse navbar-collapse" id="navbarVerticalCollapse">
            <div class="navbar-vertical-content scrollbar">
				<ul class="navbar-nav flex-column mb-3" id="navbarVerticalNav">
					<li class="nav-item"><!-- parent pages-->
						<a class="nav-link dropdown-indicator" href="#mypage" role="button" data-bs-toggle="collapse">
	                    	<div class="d-flex align-items-center">
	                    		<span class="nav-link-icon"><span class="fas fa-chart-pie"></span></span>
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
	                    		<span class="nav-link-icon"><span class="fas fa-chart-pie"></span></span>
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
	                    		<span class="nav-link-icon"><span class="fas fa-chart-pie"></span></span>
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
	                    		<span class="nav-link-icon"><span class="fas fa-chart-pie"></span></span>
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
	                    		<span class="nav-link-icon"><span class="fas fa-chart-pie"></span></span>
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
	                    		<span class="nav-link-icon"><span class="fas fa-chart-pie"></span></span>
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
	                    		<span class="nav-link-icon"><span class="fas fa-chart-pie"></span></span>
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
	                    		<span class="nav-link-icon"><span class="fas fa-chart-pie"></span></span>
	                    		<span class="nav-link-text ps-1">공지사항</span>
	                    	</div>
	                  	</a>
						<a class="nav-link" href="#" role="button" data-bs-toggle="collapse">
	                    	<div class="d-flex align-items-center">
	                    		<span class="nav-link-icon"><span class="fas fa-chart-pie"></span></span>
	                    		<span class="nav-link-text ps-1">Q&A</span>
	                    	</div>
	                  	</a>
						<a class="nav-link" href="#" role="button" data-bs-toggle="collapse">
	                    	<div class="d-flex align-items-center">
	                    		<span class="nav-link-icon"><span class="fas fa-chart-pie"></span></span>
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
	                    		<span class="nav-link-icon"><span class="fas fa-chart-pie"></span></span>
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
	                    		<span class="nav-link-icon"><span class="fas fa-chart-pie"></span></span>
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
	                    		<span class="nav-link-icon"><span class="fas fa-chart-pie"></span></span>
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
          <nav class="navbar navbar-light navbar-glass navbar-top navbar-expand">

            <button class="btn navbar-toggler-humburger-icon navbar-toggler me-1 me-sm-3" type="button" data-bs-toggle="collapse" data-bs-target="#navbarVerticalCollapse" aria-controls="navbarVerticalCollapse" aria-expanded="false" aria-label="Toggle Navigation"><span class="navbar-toggle-icon"><span class="toggle-line"></span></span></button>
            <a class="navbar-brand me-1 me-sm-3" href="index.jsp">
              <div class="d-flex align-items-center"><img class="me-2" src="assets/img/icons/spot-illustrations/falcon.png" alt="" width="40" /><span class="font-sans-serif"></span>
              </div>
            </a>
            <ul class="navbar-nav align-items-center d-none d-lg-block">
              <li class="nav-item">
                <div class="search-box" data-list='{"valueNames":["title"]}'>
                  <form class="position-relative" data-bs-toggle="search" data-bs-display="static">
                    <input class="form-control search-input fuzzy-search" type="search" placeholder="Search..." aria-label="Search" />
                    <span class="fas fa-search search-box-icon"></span>
                  </form>
                </div>
              </li>
            </ul>
            <ul class="navbar-nav navbar-nav-icons ms-auto flex-row align-items-center">
              <li class="nav-item px-2">
                <div class="theme-control-toggle fa-icon-wait">
                  <input class="form-check-input ms-0 theme-control-toggle-input" id="themeControlToggle" type="checkbox" data-theme-control="theme" value="dark" />
                  <label class="mb-0 theme-control-toggle-label theme-control-toggle-light" for="themeControlToggle" data-bs-toggle="tooltip" data-bs-placement="left" title="Switch to light theme"><span class="fas fa-sun fs-0"></span></label>
                  <label class="mb-0 theme-control-toggle-label theme-control-toggle-dark" for="themeControlToggle" data-bs-toggle="tooltip" data-bs-placement="left" title="Switch to dark theme"><span class="fas fa-moon fs-0"></span></label>
                </div>
              </li>
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
                          <div class="col-4"><a class="d-block hover-bg-200 px-2 py-3 rounded-3 text-center text-decoration-none" href="pages/user/profile.jsp" target="_blank">
                              <div class="avatar avatar-2xl"> <img class="rounded-circle" src="assets/img/team/3.jpg" alt="" /></div>
                              <p class="mb-0 fw-medium text-800 text-truncate fs--2">Account</p>
                            </a></div>
                          <div class="col-4"><a class="d-block hover-bg-200 px-2 py-3 rounded-3 text-center text-decoration-none" href="https://themewagon.com/" target="_blank"><img class="rounded" src="assets/img/nav-icons/themewagon.png" alt="" width="40" height="40" />
                              <p class="mb-0 fw-medium text-800 text-truncate fs--2 pt-1">Themewagon</p>
                            </a></div>
                          <div class="col-4"><a class="d-block hover-bg-200 px-2 py-3 rounded-3 text-center text-decoration-none" href="https://mailbluster.com/" target="_blank"><img class="rounded" src="assets/img/nav-icons/mailbluster.png" alt="" width="40" height="40" />
                              <p class="mb-0 fw-medium text-800 text-truncate fs--2 pt-1">Mailbluster</p>
                            </a></div>
                          <div class="col-4"><a class="d-block hover-bg-200 px-2 py-3 rounded-3 text-center text-decoration-none" href="#!" target="_blank"><img class="rounded" src="assets/img/nav-icons/google.png" alt="" width="40" height="40" />
                              <p class="mb-0 fw-medium text-800 text-truncate fs--2 pt-1">Google</p>
                            </a></div>
                          <div class="col-4"><a class="d-block hover-bg-200 px-2 py-3 rounded-3 text-center text-decoration-none" href="#!" target="_blank"><img class="rounded" src="assets/img/nav-icons/spotify.png" alt="" width="40" height="40" />
                              <p class="mb-0 fw-medium text-800 text-truncate fs--2 pt-1">Spotify</p>
                            </a></div>
                          <div class="col-4"><a class="d-block hover-bg-200 px-2 py-3 rounded-3 text-center text-decoration-none" href="#!" target="_blank"><img class="rounded" src="assets/img/nav-icons/steam.png" alt="" width="40" height="40" />
                              <p class="mb-0 fw-medium text-800 text-truncate fs--2 pt-1">Steam</p>
                            </a></div>
                          <div class="col-4"><a class="d-block hover-bg-200 px-2 py-3 rounded-3 text-center text-decoration-none" href="#!" target="_blank"><img class="rounded" src="assets/img/nav-icons/github-light.png" alt="" width="40" height="40" />
                              <p class="mb-0 fw-medium text-800 text-truncate fs--2 pt-1">Github</p>
                            </a></div>
                          <div class="col-4"><a class="d-block hover-bg-200 px-2 py-3 rounded-3 text-center text-decoration-none" href="#!" target="_blank"><img class="rounded" src="assets/img/nav-icons/discord.png" alt="" width="40" height="40" />
                              <p class="mb-0 fw-medium text-800 text-truncate fs--2 pt-1">Discord</p>
                            </a></div>
                          <div class="col-4"><a class="d-block hover-bg-200 px-2 py-3 rounded-3 text-center text-decoration-none" href="#!" target="_blank"><img class="rounded" src="assets/img/nav-icons/xbox.png" alt="" width="40" height="40" />
                              <p class="mb-0 fw-medium text-800 text-truncate fs--2 pt-1">xbox</p>
                            </a></div>
                          <div class="col-4"><a class="d-block hover-bg-200 px-2 py-3 rounded-3 text-center text-decoration-none" href="#!" target="_blank"><img class="rounded" src="assets/img/nav-icons/trello.png" alt="" width="40" height="40" />
                              <p class="mb-0 fw-medium text-800 text-truncate fs--2 pt-1">Kanban</p>
                            </a></div>
                          <div class="col-4"><a class="d-block hover-bg-200 px-2 py-3 rounded-3 text-center text-decoration-none" href="#!" target="_blank"><img class="rounded" src="assets/img/nav-icons/hp.png" alt="" width="40" height="40" />
                              <p class="mb-0 fw-medium text-800 text-truncate fs--2 pt-1">Hp</p>
                            </a></div>
                          <div class="col-12">
                            <hr class="my-3 mx-n3 bg-200" />
                          </div>
                          <div class="col-4"><a class="d-block hover-bg-200 px-2 py-3 rounded-3 text-center text-decoration-none" href="#!" target="_blank"><img class="rounded" src="assets/img/nav-icons/linkedin.png" alt="" width="40" height="40" />
                              <p class="mb-0 fw-medium text-800 text-truncate fs--2 pt-1">Linkedin</p>
                            </a></div>
                          <div class="col-4"><a class="d-block hover-bg-200 px-2 py-3 rounded-3 text-center text-decoration-none" href="#!" target="_blank"><img class="rounded" src="assets/img/nav-icons/twitter.png" alt="" width="40" height="40" />
                              <p class="mb-0 fw-medium text-800 text-truncate fs--2 pt-1">Twitter</p>
                            </a></div>
                          <div class="col-4"><a class="d-block hover-bg-200 px-2 py-3 rounded-3 text-center text-decoration-none" href="#!" target="_blank"><img class="rounded" src="assets/img/nav-icons/facebook.png" alt="" width="40" height="40" />
                              <p class="mb-0 fw-medium text-800 text-truncate fs--2 pt-1">Facebook</p>
                            </a></div>
                          <div class="col-4"><a class="d-block hover-bg-200 px-2 py-3 rounded-3 text-center text-decoration-none" href="#!" target="_blank"><img class="rounded" src="assets/img/nav-icons/instagram.png" alt="" width="40" height="40" />
                              <p class="mb-0 fw-medium text-800 text-truncate fs--2 pt-1">Instagram</p>
                            </a></div>
                          <div class="col-4"><a class="d-block hover-bg-200 px-2 py-3 rounded-3 text-center text-decoration-none" href="#!" target="_blank"><img class="rounded" src="assets/img/nav-icons/pinterest.png" alt="" width="40" height="40" />
                              <p class="mb-0 fw-medium text-800 text-truncate fs--2 pt-1">Pinterest</p>
                            </a></div>
                          <div class="col-4"><a class="d-block hover-bg-200 px-2 py-3 rounded-3 text-center text-decoration-none" href="#!" target="_blank"><img class="rounded" src="assets/img/nav-icons/slack.png" alt="" width="40" height="40" />
                              <p class="mb-0 fw-medium text-800 text-truncate fs--2 pt-1">Slack</p>
                            </a></div>
                          <div class="col-4"><a class="d-block hover-bg-200 px-2 py-3 rounded-3 text-center text-decoration-none" href="#!" target="_blank"><img class="rounded" src="assets/img/nav-icons/deviantart.png" alt="" width="40" height="40" />
                              <p class="mb-0 fw-medium text-800 text-truncate fs--2 pt-1">Deviantart</p>
                            </a></div>
                          <div class="col-4"><a class="d-block hover-bg-200 px-2 py-3 rounded-3 text-center text-decoration-none" href="app/events/event-detail.jsp" target="_blank">
                              <div class="avatar avatar-2xl">
                                <div class="avatar-name rounded-circle bg-primary-subtle text-primary"><span class="fs-2">E</span></div>
                              </div>
                              <p class="mb-0 fw-medium text-800 text-truncate fs--2">Events</p>
                            </a></div>
                          <div class="col-12"><a class="btn btn-outline-primary btn-sm mt-4" href="#!">Show more</a></div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>

              </li>
              <li class="nav-item dropdown"><a class="nav-link pe-0 ps-2" id="navbarDropdownUser" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  <div class="avatar avatar-xl">
                    <img class="rounded-circle" src="assets/img/team/3-thumb.png" alt="" />

                  </div>
                </a>
                <div class="dropdown-menu dropdown-caret dropdown-caret dropdown-menu-end py-0" aria-labelledby="navbarDropdownUser">
                  <div class="bg-white dark__bg-1000 rounded-2 py-2">
                    <a class="dropdown-item fw-bold text-warning" href="#!"><span class="fas fa-crown me-1"></span><span>Go Pro</span></a>

                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="#!">Set status</a>
                    <a class="dropdown-item" href="pages/user/profile.jsp">Profile &amp; account</a>
                    <a class="dropdown-item" href="#!">Feedback</a>

                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="pages/user/settings.jsp">Settings</a>
                    <a class="dropdown-item" href="pages/authentication/card/logout.jsp">Logout</a>
                  </div>
                </div>
              </li>
            </ul>
          </nav>
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
        <div class="modal fade" id="authentication-modal" tabindex="-1" role="dialog" aria-labelledby="authentication-modal-label" aria-hidden="true">
          <div class="modal-dialog mt-6" role="document">
            <div class="modal-content border-0">
              <div class="modal-header px-5 position-relative modal-shape-header bg-shape">
                <div class="position-relative z-1" data-bs-theme="light">
                  <h4 class="mb-0 text-white" id="authentication-modal-label">Register</h4>
                  <p class="fs--1 mb-0 text-white">Please create your free Falcon account</p>
                </div>
                <button class="btn-close btn-close-white position-absolute top-0 end-0 mt-2 me-2" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body py-4 px-5">
                <form>
                  <div class="mb-3">
                    <label class="form-label" for="modal-auth-name">Name</label>
                    <input class="form-control" type="text" autocomplete="on" id="modal-auth-name" />
                  </div>
                  <div class="mb-3">
                    <label class="form-label" for="modal-auth-email">Email address</label>
                    <input class="form-control" type="email" autocomplete="on" id="modal-auth-email" />
                  </div>
                  <div class="row gx-2">
                    <div class="mb-3 col-sm-6">
                      <label class="form-label" for="modal-auth-password">Password</label>
                      <input class="form-control" type="password" autocomplete="on" id="modal-auth-password" />
                    </div>
                    <div class="mb-3 col-sm-6">
                      <label class="form-label" for="modal-auth-confirm-password">Confirm Password</label>
                      <input class="form-control" type="password" autocomplete="on" id="modal-auth-confirm-password" />
                    </div>
                  </div>
                  <div class="form-check">
                    <input class="form-check-input" type="checkbox" id="modal-auth-register-checkbox" />
                    <label class="form-label" for="modal-auth-register-checkbox">I accept the <a href="#!">terms </a>and <a href="#!">privacy policy</a></label>
                  </div>
                  <div class="mb-3">
                    <button class="btn btn-primary d-block w-100 mt-3" type="submit" name="submit">Register</button>
                  </div>
                </form>
                <div class="position-relative mt-5">
                  <hr />
                  <div class="divider-content-center">or register with</div>
                </div>
                <div class="row g-2 mt-2">
                  <div class="col-sm-6"><a class="btn btn-outline-google-plus btn-sm d-block w-100" href="#"><span class="fab fa-google-plus-g me-2" data-fa-transform="grow-8"></span> google</a></div>
                  <div class="col-sm-6"><a class="btn btn-outline-facebook btn-sm d-block w-100" href="#"><span class="fab fa-facebook-square me-2" data-fa-transform="grow-8"></span> facebook</a></div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </main>
    <!-- ===============================================-->
    <!--    End of Main Content-->
    <!-- ===============================================-->


    <div class="offcanvas offcanvas-end settings-panel border-0" id="settings-offcanvas" tabindex="-1" aria-labelledby="settings-offcanvas">
      <div class="offcanvas-header settings-panel-header bg-shape">
        <div class="z-1 py-1" data-bs-theme="light">
          <div class="d-flex justify-content-between align-items-center mb-1">
            <h5 class="text-white mb-0 me-2"><span class="fas fa-palette me-2 fs-0"></span>Settings</h5>
            <button class="btn btn-primary btn-sm rounded-pill mt-0 mb-0" data-theme-control="reset" style="font-size:12px"> <span class="fas fa-redo-alt me-1" data-fa-transform="shrink-3"></span>Reset</button>
          </div>
          <p class="mb-0 fs--1 text-white opacity-75"> Set your own customized style</p>
        </div>
        <button class="btn-close btn-close-white z-1 mt-0" type="button" data-bs-dismiss="offcanvas" aria-label="Close"></button>
      </div>
      <div class="offcanvas-body scrollbar-overlay px-x1 h-100" id="themeController">
        <h5 class="fs-0">Color Scheme</h5>
        <p class="fs--1">Choose the perfect color mode for your app.</p>
        <div class="btn-group d-block w-100 btn-group-navbar-style">
          <div class="row gx-2">
            <div class="col-6">
              <input class="btn-check" id="themeSwitcherLight" name="theme-color" type="radio" value="light" data-theme-control="theme" />
              <label class="btn d-inline-block btn-navbar-style fs--1" for="themeSwitcherLight"> <span class="hover-overlay mb-2 rounded d-block"><img class="img-fluid img-prototype mb-0" src="assets/img/generic/falcon-mode-default.jpg" alt=""/></span><span class="label-text">Light</span></label>
            </div>
            <div class="col-6">
              <input class="btn-check" id="themeSwitcherDark" name="theme-color" type="radio" value="dark" data-theme-control="theme" />
              <label class="btn d-inline-block btn-navbar-style fs--1" for="themeSwitcherDark"> <span class="hover-overlay mb-2 rounded d-block"><img class="img-fluid img-prototype mb-0" src="assets/img/generic/falcon-mode-dark.jpg" alt=""/></span><span class="label-text"> Dark</span></label>
            </div>
          </div>
        </div>
        <hr />
        <div class="d-flex justify-content-between">
          <div class="d-flex align-items-start"><img class="me-2" src="assets/img/icons/left-arrow-from-left.svg" width="20" alt="" />
            <div class="flex-1">
              <h5 class="fs-0">RTL Mode</h5>
              <p class="fs--1 mb-0">Switch your language direction </p><a class="fs--1" href="documentation/customization/configuration.jsp">RTL Documentation</a>
            </div>
          </div>
          <div class="form-check form-switch">
            <input class="form-check-input ms-0" id="mode-rtl" type="checkbox" data-theme-control="isRTL" />
          </div>
        </div>
        <hr />
        <div class="d-flex justify-content-between">
          <div class="d-flex align-items-start"><img class="me-2" src="assets/img/icons/arrows-h.svg" width="20" alt="" />
            <div class="flex-1">
              <h5 class="fs-0">Fluid Layout</h5>
              <p class="fs--1 mb-0">Toggle container layout system </p><a class="fs--1" href="documentation/customization/configuration.jsp">Fluid Documentation</a>
            </div>
          </div>
          <div class="form-check form-switch">
            <input class="form-check-input ms-0" id="mode-fluid" type="checkbox" data-theme-control="isFluid" />
          </div>
        </div>
        <hr />
        <div class="d-flex align-items-start"><img class="me-2" src="assets/img/icons/paragraph.svg" width="20" alt="" />
          <div class="flex-1">
            <h5 class="fs-0 d-flex align-items-center">Navigation Position</h5>
            <p class="fs--1 mb-2">Select a suitable navigation system for your web application </p>
            <div>
              <select class="form-select form-select-sm" aria-label="Navbar position" data-theme-control="navbarPosition">
                <option value="vertical" data-page-url="modules/components/navs-and-tabs/vertical-navbar.jsp">Vertical</option>
                <option value="top" data-page-url="modules/components/navs-and-tabs/top-navbar.jsp">Top</option>
                <option value="combo" data-page-url="modules/components/navs-and-tabs/combo-navbar.jsp">Combo</option>
                <option value="double-top" data-page-url="modules/components/navs-and-tabs/double-top-navbar.jsp">Double Top</option>
              </select>
            </div>
          </div>
        </div>
        <hr />
        <h5 class="fs-0 d-flex align-items-center">Vertical Navbar Style</h5>
        <p class="fs--1 mb-0">Switch between styles for your vertical navbar </p>
        <p> <a class="fs--1" href="modules/components/navs-and-tabs/vertical-navbar.jsp#navbar-styles">See Documentation</a></p>
        <div class="btn-group d-block w-100 btn-group-navbar-style">
          <div class="row gx-2">
            <div class="col-6">
              <input class="btn-check" id="navbar-style-transparent" type="radio" name="navbarStyle" value="transparent" data-theme-control="navbarStyle" />
              <label class="btn d-block w-100 btn-navbar-style fs--1" for="navbar-style-transparent"> <img class="img-fluid img-prototype" src="assets/img/generic/default.png" alt="" /><span class="label-text"> Transparent</span></label>
            </div>
            <div class="col-6">
              <input class="btn-check" id="navbar-style-inverted" type="radio" name="navbarStyle" value="inverted" data-theme-control="navbarStyle" />
              <label class="btn d-block w-100 btn-navbar-style fs--1" for="navbar-style-inverted"> <img class="img-fluid img-prototype" src="assets/img/generic/inverted.png" alt="" /><span class="label-text"> Inverted</span></label>
            </div>
            <div class="col-6">
              <input class="btn-check" id="navbar-style-card" type="radio" name="navbarStyle" value="card" data-theme-control="navbarStyle" />
              <label class="btn d-block w-100 btn-navbar-style fs--1" for="navbar-style-card"> <img class="img-fluid img-prototype" src="assets/img/generic/card.png" alt="" /><span class="label-text"> Card</span></label>
            </div>
            <div class="col-6">
              <input class="btn-check" id="navbar-style-vibrant" type="radio" name="navbarStyle" value="vibrant" data-theme-control="navbarStyle" />
              <label class="btn d-block w-100 btn-navbar-style fs--1" for="navbar-style-vibrant"> <img class="img-fluid img-prototype" src="assets/img/generic/vibrant.png" alt="" /><span class="label-text"> Vibrant</span></label>
            </div>
          </div>
        </div>
        <div class="text-center mt-5"><img class="mb-4" src="assets/img/icons/spot-illustrations/47.png" alt="" width="120" />
          <h5>Like What You See?</h5>
          <p class="fs--1">Get Falcon now and create beautiful dashboards with hundreds of widgets.</p><a class="mb-3 btn btn-primary" href="https://themes.getbootstrap.com/product/falcon-admin-dashboard-webapp-template/" target="_blank">Purchase</a>
        </div>
      </div>
    </div>


    <!-- ===============================================-->
    <!--    JavaScripts-->
    <!-- ===============================================-->
    <script src="vendors/popper/popper.min.js"></script>
    <script src="vendors/bootstrap/bootstrap.min.js"></script>
    <script src="vendors/anchorjs/anchor.min.js"></script>
    <script src="vendors/is/is.min.js"></script>
    <script src="vendors/echarts/echarts.min.js"></script>
    <script src="vendors/fontawesome/all.min.js"></script>
    <script src="vendors/lodash/lodash.min.js"></script>
    <script src="https://polyfill.io/v3/polyfill.min.js?features=window.scroll"></script>
    <script src="vendors/list.js/list.min.js"></script>
    <script src="assets/js/theme.js"></script>

  </body>

</html>
