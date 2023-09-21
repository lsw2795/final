<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!-- 관리자 비밀번호 찾기
	-LoginController
--> 
<html data-bs-theme="light" lang="en-US" dir="ltr">
<!-- ===============================================-->
    <!--    Document Title-->
    <!-- ===============================================-->
    <title>관리자 비밀번호 찾기</title>


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
      <div class="container" data-layout="container">
        <script>
          var isFluid = JSON.parse(localStorage.getItem('isFluid'));
          if (isFluid) {
            var container = document.querySelector('[data-layout]');
            container.classList.remove('container');
            container.classList.add('container-fluid');
          }
          
          /* 비번찾기 ajax */
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
      						location.href="<c:url value='/admin/login'/>";
      					}                   	
      	            },
      	            error:function(xhr,status,error){
      	                alert(status+" : "+error);
      	            } 
      	        });//ajax
			});
		}); 
          
          
        </script>
        <div class="row flex-center min-vh-100 py-6 text-center">
          <div class="col-sm-10 col-md-8 col-lg-6 col-xl-5 col-xxl-4"><a class="d-flex flex-center mb-4" href="<c:url value='/view/index.jsp'/>"><img src="<c:url value='/title.png'/>" alt="타이틀로고" width="300"/></a>
            <div class="card">
              <div class="card-body p-4 p-sm-5">
                <h5 class="mb-0">Forgot your password?</h5><small>Enter your email and we'll send you a email.<br></small>
                	<input class="form-control" type="text" name="empNo" id="empNo" placeholder="사원번호"/>
                	<input class="form-control" type="email" name="email" id="email" placeholder="Email address" />
                  <div class="mb-3"></div>
                  <button class="btn btn-primary d-block w-100 mt-3" id="btnSend" type="submit" name="submit">Send email</button>
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