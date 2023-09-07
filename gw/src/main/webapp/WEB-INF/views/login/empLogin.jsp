<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html data-bs-theme="light" lang="en-US" dir="ltr">
<%
	//쿠키 읽어오기(사원번호 저장하기 체크)
	String ck_value="";
	Cookie[] ckArr = request.getCookies();
	if(ckArr!=null){
		for(int i=0; i<ckArr.length; i++){
			String ck_name=ckArr[i].getName();
			if(ck_name.equals("ck_empNo")){
				ck_value=ckArr[i].getValue();
				break;
			}
		}//for
	}
%>
<!-- ===============================================-->
    <!--    Document Title-->
    <!-- ===============================================-->
    <title>로그인</title>


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
    <link href="<c:url value='/vendors/simplebar/simplebar.min.css" rel="stylesheet'/>">
    <link href="<c:url value='/assets/css/theme-rtl.css" rel="stylesheet" id="style-rtl'/>">
    <link href="<c:url value='/assets/css/theme.css" rel="stylesheet" id="style-default'/>">
    <link href="<c:url value='/assets/css/user-rtl.css" rel="stylesheet" id="user-style-rtl'/>">
    <link href="<c:url value='/assets/css/user.css" rel="stylesheet" id="user-style-default'/>">
    
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
      <div class="container-fluid">
        <script>
          var isFluid = JSON.parse(localStorage.getItem('isFluid'));
          if (isFluid) {
            var container = document.querySelector('[data-layout]');
            container.classList.remove('container');
            container.classList.add('container-fluid');
          }
        </script>
		
        <div class="row min-vh-100 ">
          <div class="col-6 d-none d-lg-block position-relative">
            <div class="bg-holder" style="background-image:url('${pageContext.request.contextPath}/assets/img/generic/universe.jpg'); background-position: 50% 20%;">
            </div>
            <!--/.bg-holder-->
          </div>
          <div class="col-sm-10 col-md-6 px-sm-0 align-self-center mx-auto py-5">
            <div class="row justify-content-center g-0">
              <div class="col-lg-9 col-xl-8 col-xxl-6">
                <div class="card">
                  <div class="card-header text-center p-2"><a class="d-flex flex-center mb-4" href="<c:url value='/'/>"><img src="<c:url value='/adminfinallogo.png'/>" alt="타이틀로고" width="300"/></a></div>
                  <div class="card-body p-4">
                    <div class="row flex-between-center">
                      <div class="col-auto">
                        <h3>Login</h3>
                      </div>
                    </div>
                    <form name="loginform" method="post" action="<c:url value='/login/empLogin'/>">
                      <div class="mb-3">
                        <input class="form-control" id="empNo" name="empNo" type="text" value="${cookie.ck_empNo.value}"/>
                      </div>
                      <div class="mb-3">
                        <div class="d-flex justify-content-between">
                          <label class="form-label" for="split-login-password">Password</label>
                        </div>
                        <input class="form-control" name="pwd" id="split-login-password" type="password" />
                      </div>
                      <div class="row flex-between-center">
                        <div class="col-auto">
                          <div class="form-check mb-0">
                            <input class="form-check-input" type="checkbox" id="split-checkbox"
                            name="split_checkbox" 
                            	<c:if test="${!empty cookie.ck_empNo.value}"> 
            						checked="checked"
            					</c:if> 
                            />
                            <label class="form-check-label mb-0" for="split-checkbox">사원번호 저장하기</label>
                          </div>
                        </div>
                        <div class="col-auto"><a class="fs--1" href="<c:url value='/login/empForgotPwd'/>">Forgot Password?</a></div>
                      </div>
                      <div class="mb-3">
                        <button class="btn btn-primary d-block w-100 mt-3" type="submit" name="submit">Log in</button>
                      </div>
                      <div class="col-auto"><a class="fs--1" href="<c:url value='/admin/login'/>">Admin</a></div>
                    </form>
                  </div>
                </div>
              </div>
            </div>
          </div>
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
    <script src="<c:url value='/vendors/fontawesome/all.min.js'/>"></script>
    <script src="<c:url value='/vendors/lodash/lodash.min.js'/>"></script>
    <script src="https://polyfill.io/v3/polyfill.min.js?features=window.scroll"></script>
    <script src="<c:url value='/vendors/list.js/list.min.js'/>"></script>
    <script src="<c:url value='/assets/js/theme.js'/>"></script>

  </body>

</html>
    