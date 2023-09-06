<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html data-bs-theme="light" lang="en-US" dir="ltr">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">


    <!-- ===============================================-->
    <!--    Document Title-->
    <!-- ===============================================-->
    <title>비밀번호 찾기</title>


    <!-- ===============================================-->
    <!--    Favicons-->
    <!-- ===============================================-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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
          
          /* 임시 비밀번호 메일로 보내기 */
          $(function(){
        	  
        	  $('#btnSend').click(function() {
        		  
        		if($("#email").val().length<1){
  					alert("이메일을 입력해주세요.");
  					$("#email").focus;
  					return false;
        		}
        		
  				if($("#empNo").val().length<1){
  					alert("사원번호를 입력해주세요.");
  					$("#empNo").focus;
  					return false;
  				}
        		 
  				var empNo=$('#empNo').val();
  				var email=$('#email').val();
  				//alert("사원번호 : "+empNo+"<br> 이메일: "+email+"");
        		//alert($.param($('#frmPwd').serializeArray()));
      			$.ajax({
      	            url: "<c:url value='/login/ajaxempForgotPwd'/>",
      	            type:'get',
      				data: {
      					empNo: empNo,
      					email: email
      				},
      				dataType:'json',
      	            success: function (res) {
      					if(res>0){
      						alert('임시 비밀번호 발송 완료! 메일 확인 후 로그인 해주세요.');
      						location.href="<c:url value='/'/>";
      					}                   	
      	            },
      	            error:function(xhr,status,error){
      	                alert(status+" : "+error);
      	            } 
      	        });//ajax
			});
		}); 
          
          
        </script>
        
        <div class="row min-vh-100 bg-100">
          <div class="col-6 d-none d-lg-block position-relative">
            <div class="bg-holder overlay" style="background-image:url(${pageContext.request.contextPath}/assets/img/generic/17.jpg);background-position: 50% 76%;">
            </div>
            <!--/.bg-holder-->

          </div>
          <div class="col-sm-10 col-md-6 px-sm-0 align-self-center mx-auto py-5">
            <div class="row justify-content-center g-0">
              <div class="col-lg-9 col-xl-8 col-xxl-6">
                <div class="card">
                  <div class="card-header text-center p-2"><a class="font-sans-serif fw-bolder fs-4 z-1 position-relative link-light" href="<c:url value='/login/empForgotPwd'/>" data-bs-theme="light"><img src="<c:url value='/adminfinallogo.png'/>" alt="타이틀로고" width="300"/></a></div>
                  <div class="card-body p-4">
                    <div class="text-center">
                      <h4 class="mb-0"> Forgot your password?</h4><small>Enter your email and we'll send you email.</small>
                     <!--  <form name="frmPwd" id="frmPwd" class="mb-3 mt-4"> -->
                        <input class="form-control" type="text" name="empNo" id="empNo" placeholder="사원번호"/>
                        <input class="form-control" type="email" name="email" id="email" placeholder="Email address" />
                        <div class="mb-3"></div>
                        <hr>
                        <div class="text-center small mt-2" id="checkMsg" style="color: red"></div>
                        <button class="btn btn-primary d-block w-100 mt-3" type="submit" id="btnSend" name="submit">Send email</button>
                    	<!-- </form> -->
                    </div>
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
    <script src="https://polyfill.io/v3/polyfill.min.js?features=window.scroll'/>"></script>
    <script src="<c:url value='/vendors/list.js/list.min.js'/>"></script>
    <script src="<c:url value='/assets/js/theme.js'/>"></script>

  </body>

</html>