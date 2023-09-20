<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 
사원뷰 - 마이페이지 비밀번호 수정 뷰
내용 : AJAX를 이용한 기존 비밀번호 일치여부 확인, AJAX 비밀번호 수정 처리, 새 비밀번호 일치 여부 확인
컨트롤러 : com.ez.gw.employee.controller.EmployeeController  
작성자 : 송영은
작성일 : 2023.08
 -->     
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="<c:url value='/assets/css/theme.css'/>" rel="stylesheet" id="style-default">
<script type="text/javascript" src="<c:url value='/js/jquery-3.7.0.min.js'/>"></script>
<script type="text/javascript">
	$(function(){
		//새 비밀번호 일치 여부 확인 
		$('#newPwd2').keyup(function(){
		    if($('#newPwd').val() == $('#newPwd2').val()){
		        $('#pwdConfirm').text('새 비밀번호와 확인이 일치합니다.').css('color', 'green');
		    }else{
		        $('#pwdConfirm').text('새 비밀번호와 확인이 일치하지 않습니다.').css('color', 'red');
		    }
		});
		
		$('#btnEditPwd').click(function(){
	        //submit실행 막고 유효성 검사로 내려감. 유효성 검사 통과시 ajax 비밀번호 일치여부 조회  
			event.preventDefault();
	          
	         if($('#pwd').val().length<1){
	            alert("비밀번호를 입력하세요.");
	            $('#pwd').focus();
	            return false;
	         }
	         
	         if($('#newPwd').val().length<1){
	            alert("새 비밀번호를 입력하세요.");
	            $('#newPwd').focus();
	            return false;
	         }
	         
	         if($('#newPwd2').val().length<1){
	            alert("새 비밀번호 확인이 필요합니다. 입력바랍니다.");
	            $('#newPwd2').focus();
	            return false;
	         }
	         
	         if($('#newPwd').val() != $('#newPwd2').val()){
	            alert("새 비밀번호와 새 비밀번호 확인이 일치하지 않습니다. 확인바랍니다.");
	            $('#newPwd').focus();
	            return false;  
	         }
	         
	         if (!validate_hp($('#newPwd').val())
	               || !validate_hp($('#newPwd2').val())) {
	            alert("비밀번호 변경은 숫자만 가능합니다.");
	            $('#newPwd').focus();
	            return false;
	         }
	         
	         $.ajax({
	            url : "<c:url value='/ajaxPwdCheck'/>",
	            type:"get",
	            dataType : "text",
	            data:"pwd="+$('#pwd').val(),
	            success: function(res){
	               $('#pwdChkFlag').val(res);
	               
	               if($('#pwdChkFlag').val()>0){
	            	   //비밀번호 일치시 ajax 비밀번호 수정 진행
	                  if(confirm('변경하시겠습니까?')){
	                      //alert($.param($('#pwdEditfrm').serializeArray()));
				         $.ajax({
				            url : "<c:url value='/mypage/ajaxPwdEdit'/>",
				            type:'post',
				            data: $('#pwdEditfrm').serializeArray(),
				            dataType : 'json',
				            success: function(res){
				            	if(res>0){
					            	alert("비밀번호 수정이 완료되었습니다.");
					            	self.close();
				            	}else{
				            		alert("비밀번호 수정에 실패했습니다.");
				            	}
				            },
				            error:function(xhr, status, error){
				               alert(status+" : "+error);
				            }
				         });//ajax
	                  }
	               }else{
	                  alert('현재 비밀번호가 일치하지 않습니다.');
	               }
	            },
	            error:function(xhr, status, error){
	               alert(status+" : "+error);
	            }
	         });//ajax
		});
		
		$('input[type=button]').click(function(){
			self.close();
		});
	});
	
	function validate_hp(ph) {
		var pattern = new RegExp(/^[0-9]*$/g);
		return pattern.test(ph);
	}
/* 	function validate_userid(uid) {
		var pattern = new RegExp(/^[a-zA-Z0-9_]+$/g);
		return pattern.test(uid);
	} */
</script>
<style>
	body{
		background: #eff2f8;
	}
	.mb-3{
		padding: 0px 15px 0px 15px;
	}
</style>
<div>
  <div>
    <div>
    	<div>
      	 <h5 style="padding: 10px; margin-bottom:20px;">비밀번호 변경</h5>
       </div>
    </div>
      <div class="card-body" style="text-align: center; font-size: 20px;">
      	<form name="pwdEditfrm" id="pwdEditfrm" method="post" action="<c:url value='/mypage/pwdEdit'/>">	
				 <div class="mb-3">
                    <label class="form-label" for="pwd">현재 비밀번호</label>
                    <input class="form-control form-control-lg" type="password" id="pwd" placeholder="현재 비밀번호를 입력하세요."/>
                </div>
                <div class="mb-3">
                    <label class="form-label" for="newPwd">새 비밀번호</label>
                    <input class="form-control form-control-lg" type="password" name="pwd" id="newPwd" placeholder="새 비밀번호를 입력하세요."/>
                </div>
                <div class="mb-3">
                    <label class="form-label" for="newPwd2">새 비밀번호 확인</label>
                    <input class="form-control form-control-lg" type="password" id="newPwd2" placeholder="새 비밀번호를 다시 입력하세요." />
                </div>
				<div class="mb-4 mt-2" id="pwdConfirm"></div>
				<div class="card-footer text-center">
					<input type="submit" value="수정" id="btnEditPwd" class="btn btn-primary" />
					<input type="button" value="취소" class="btn btn-secondary"/>
				</div>
				<!-- hidden -->
				<input type="hidden" id="pwdChkFlag" />
			</form>	
    </div>
  </div>
  </div>