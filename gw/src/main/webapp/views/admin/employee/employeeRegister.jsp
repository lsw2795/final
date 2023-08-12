<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file='../../inc/adminTop.jsp'%>
<link rel="stylesheet" href="<c:url value='/css/adminempform.css'/>">
<script type="text/javascript" src="<c:url value='/js/employee.js'/>"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {

           var roadAddr = data.roadAddress; // 도로명 주소 변수
           var extraRoadAddr = ''; // 참고 항목 변수

           if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
               extraRoadAddr += data.bname;
           }
           if(data.buildingName !== '' && data.apartment === 'Y'){
              extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
           }
         
           document.getElementById('sample4_postcode').value = data.zonecode;
           document.getElementById("sample4_roadAddress").value = roadAddr;
           }
        }).open();
    }
    
    $(function(){
   		/* $("#empWrite").click(function() {
			if($('#chkPwd').val()!='Y'){
		        alert('패스워드 확인을 해주세요.');
		        $('#pwd').focus();
		        return false;
		   }
   		}); */
   		
			var tel="";
			var tel1=$('#tel1').val();
			var tel2=$('#tel2').val();
			var tel3=$('#tel3').val();
			
			if(tel1!=null && tel1.isEmpty() && tel2!=null && !tel2.isEmpty() && tel3!=null && !tel3.isEmpty()){
			      tel=tel1+"-"+tel2+"-"+tel3;
			}
			$('#tel').val(tel);
			
			var email ="";
			var email1=$('#email1').val();
			var email2=$('#email2').val();
			var email3=$('#email3').val();
			
			if(email1!=null && !email1.isEmpty()){
			   if(email2.equals("etc")){
				  if(email3!=null && !email3.isEmpty()){
			      	email=email1+"@"+email3;
				  }
			   }else{
			      email = email1+"@"+email2;
			   }
			   $('#email').val(email);
			}	
		
    });
</script>
<div class="row g-0">
	<div class="col-lg-12 pe-lg-2 mb-3">
		<div class="card h-lg-100 overflow-hidden">
			<div class="card-header admindefault">
				<h5 class="mb-0 admindefault"><span class="fas fa-user" style="margin: 0 10px;"></span>사원 등록</h5>
			</div>
			<div class="card-body py-2 admindefault">
				<form name="frmWrite" method="post" enctype="multipart/form-data"
				action="<c:url value='/admin/employee/employeeRegister'/>">
					<div class="row mb-3 d-flex align-items-center">
					    <div class="col-md-auto adminempdiv3">
					        <label class="col-form-label adminemplabel" for="name">사원 이름</label>
					    </div>
					    <div class="col-md-6">
					        <input type="text" class="form-control admindefault" id="name" name="name"/>
					    </div>
					</div>
					<div class="row mb-3 d-flex align-items-center">
					    <div class="col-md-auto adminempdiv17">
					        <label class="col-form-label adminemplabel" for="ename">사원 영어이름</label>
					    </div>
					    <div class="col-md-6">
					        <input type="text" class="form-control admindefault" id="ename" name="ename"/>
					    </div>
					</div>
					<div class="row mb-3 d-flex align-items-center">
					    <div class="col-md-auto adminempdiv4">
							<label class="col-form-label adminemplabel">주민번호</label>
						</div>	 
						<div class="col-md-6 adminspan">							
							<input type="text" class="form-control admindefault" id="jumin1" name="jumin1" maxlength="6">
							<span class="adminhyphen">-</span>
							<input type="password" class="form-control admindefault" id="jumin2" name="jumin2" maxlength="7">
						</div>
					</div>
					<div class="row mb-3 d-flex align-items-center">
					    <div class="col-md-auto adminempdiv1">
							<label class="col-form-label adminemplabel" for="pwd">초기비밀번호</label>
						</div>
						<div class="col-md-6">
							<input type="password" class="form-control admindefault" id="pwd" placeholder="초기비밀번호는 사원의 생년월일 앞 6자리 입니다." />
						</div>
					</div>	
					<div class="row mb-3 d-flex align-items-center">
					    <div class="col-md-auto adminempdiv6">
							<label class="col-form-label adminemplabel" for="basic-form-gender">부서</label>
						</div>
						<div class="col-md-6 adminspan">
							 <select class="form-select admindefault" id="dept">
									<option value="">선택하세요</option>
									<!-- 반복 -->
						            <c:forEach var="deptVo" items="${deptList }">
						            	<option value="${deptVo.deptNo}">${deptVo.name}</option>
						            </c:forEach>
					            </select>
						</div>
					</div>
					<div class="row mb-3 d-flex align-items-center">
					    <div class="col-md-auto adminempdiv6">
							<label class="col-form-label adminemplabel" for="basic-form-gender">직위</label>
						</div>
						<div class="col-md-6 adminspan">
							 <select class="form-select admindefault" id="position">
								<option value="">선택하세요</option>
									<!-- 반복 -->
						            <c:forEach var="positionVo" items="${positionList }">
						            	<option value="${positionVo.positionNo}">${positionVo.positionName}</option>
						            </c:forEach>
					            </select>
						</div>
					</div>
					<div class="row mb-3 d-flex align-items-center">
					    <div class="col-md-auto adminempdiv6">
							<label class="col-form-label adminemplabel" for="basic-form-gender">권한</label>
						</div>
						
						<div class="col-md-6 adminspan">
							<div class="form-check">
		                        <label class="form-check-label mb-0" for="authorityFlagY">Y</label>
		                        <input type="radio" class="form-check-input" id="authorityFlagY"  name="authority" />
	                       </div>
	                       <span class="adminhyphen"></span>
	                       <div class="form-check">
		                        <label class="form-check-label mb-0" for="authorityFlagN">N</label>
		                        <input type="radio" class="form-check-input" id="authorityFlagN"  name="authority" checked="checked"/>
	                      </div>
						  <span class="adminhyphen"><small>(관리자 로그인 접근 권한 여부 선택란 입니다.)</small></span>
						</div>
					</div>
					<div class="row mb-3 d-flex align-items-center">
					    <div class="col-md-auto adminempdiv4">
							<label class="col-form-label adminemplabel">내선번호</label> 
						</div>	
						<div class="col-md-6 adminspan">							
							<input type="text" class="form-control admindefault" id="extensionNo1" name="extensionNo1" maxlength="4">
							<span class="adminhyphen">-</span>
							<input type="text" class="form-control admindefault" id="extensionNo2" name="extensionNo2" maxlength="4">
						</div>
					</div>
					<div class="row mb-3 d-flex align-items-center">
					    <div class="col-md-auto adminempdiv4">
							<label class="col-form-label adminemplabel">전화번호</label>
						</div> 
						<div class="col-md-6 adminspan">
					        <input type="text" class="form-control admindefault" id="tel1" name="tel1" style="width: 33%;" maxlength="3"/>
					        <span class="adminhyphen">-</span>
					        <input type="text" class="form-control admindefault" id="tel2" name="tel2" style="width: 33%;" maxlength="4" />
					        <span class="adminhyphen">-</span>
					        <input type="text" class="form-control admindefault" id="tel3" name="tel3" style="width: 33%;" maxlength="4" />
				    	</div>
					</div>
					<div class="row d-flex align-items-center">
					    <div class="col-md-auto adminempdiv6">
							<label class="col-form-label adminemplabel" for="address">주소</label>
						</div>
						<div class="col-md-6 adminspan">
							<input type="text" class="form-control admindefault" id="sample4_postcode" placeholder="우편번호" style="width: 65%;"/>
							<span class="adminhyphen"></span>
							<input type="Button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" class="btn btn-primary" style="width: 35%;">
						</div>
					</div>
				    <div class="row mb-3 d-flex align-items-center">
				    	<div class="col-md-auto adminempdiv16"></div>
					    <div class="col-md-6">
					        <input type="text" class="form-control admindefault" id="sample4_roadAddress" placeholder="도로명주소">
					        <input type="text" class="form-control admindefault" id="sample4_detailAddress" placeholder="상세주소">
					    </div>
				    </div>
					<div class="row mb-3 d-flex align-items-center">
					    <div class="col-md-auto adminempdiv5">
							<label class="col-form-label adminemplabel" for="hiredate">입사일</label>
						</div>
						<div class="col-md-6"> 
							<input type="date" class="form-control admindefault" id="hiredate" placeholder="달력을 눌러주세요."/>
						</div>
					</div>
					<div class="row mb-3 d-flex align-items-center">
					    <div class="col-md-auto adminempdiv6">
							<label class="col-form-label adminemplabel" for="annualSalary">연봉</label>
						</div>
						<div class="col-md-6 adminspan">  
							<input type="text" class="form-control admindefault" id="annualSalary" style="width: 85%"/>
							<span class="adminempspan">만원</span>
						</div>
					</div>
					<div class="row mb-3 d-flex align-items-center">
						<div class="col-md-auto adminempdiv5">
							<label class="col-form-label adminemplabel">이메일</label>
						</div>	 
						<div class="col-md-9 adminspan">							
							<input type="text" class="form-control admindefault" id="email1" name="email1" style="width: 31%">
							<span class="adminhyphen">@</span>
							<select class="form-select admindefault" name="email2" id="email2" title="이메일주소 뒷자리" style="width: 34%">
					            <option value="naver.com">naver.com</option>
					            <option value="hanmail.net">hanmail.net</option>
					            <option value="nate.com">nate.com</option>
					            <option value="gmail.com">gmail.com</option>
					            <option value="etc">직접입력</option>
					        </select>
					        <span class="adminhyphen"></span>
					        <input type="text" name="email3" id="email3" title="직접입력인 경우 이메일주소 뒷자리" 
					        	class="form-control admindefault" style="visibility:hidden; width: 35%">
						</div>
					</div>
					<div class="row mb-3 d-flex align-items-center">
						<div class="col-md-auto adminempdiv3">
							<label class="col-form-label adminemplabel">사원 사진</label>
						</div>
						<div class="col-md-6">	 
							<input type="file" class="form-control admindefault"/>
						</div>
					</div>
					<div style="text-align: center;">
					<input type="submit" value="등록" id="empWrite" class="btn btn-primary"/>
					<input type="button" value="취소" class="btn btn-primary"/>
					</div>
					 <input type ="text" name="chkPwd" id="chkPwd">
					 <input type ="text" name="tel" id="tel">
					 <input type ="text" name="email" id="email">
				</form>
			</div>
		</div>
	</div>
</div>
<%@ include file='../../inc/adminBottom.jsp'%>