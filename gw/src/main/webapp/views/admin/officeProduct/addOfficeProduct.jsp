<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file='../../inc/adminTop.jsp'%>
<link rel="stylesheet" href="<c:url value='/css/adminempform.css'/>">
<script type="text/javascript" src="<c:url value='/js/employee.js'/>"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
	$(function(){
		$("#empWrite").hide();
		$('#btnadminPwd').click(function(){ //모달에 있는 클릭버튼
			 $.ajax({
	            url : "<c:url value='/ajaxPwdCheck'/>",
	            type:"get",
	            dataType : "text",
	            data:"pwd="+$('#pwd').val(),
	            success: function(res){
	               $('#adminPwdChkFlag').val(res);
	               
	               if($('#adminPwdChkFlag').val()>0){
	                  	  alert("관리자 확인이 완료되었습니다.");
	                  	 $('#authentication-modal').modal('hide'); 
	                  	 $('#confirmForm').hide(); // confirmForm 버튼 숨기기
	                     $('#empWrite').show();    // empWrite 버튼 보이기
	               }else{
	                  alert('관리자 비밀번호가 일치하지 않습니다.');
	               }
	            },
	            error:function(xhr, status, error){
	               alert(status+" : "+error);
	            }
	         });//ajax
		});
		
		$('#btCancel').click(function(){
			location.href="<c:url value='/admin/employee/employeeList'/>";
		});
	});
</script>
<c:if test="${!empty param.empNo}">
	<c:set var="pageTitle" value="사원 정보 수정"/>
	<c:set var="btLabel" value="수정"/>
	<c:set var="url" value="/admin/employee/employeeEdit"/>
	<c:set var="empNo" value="${param.empNo}"/>	
</c:if>
<c:if test="${empty param.empNo}">
	<c:set var="pageTitle" value="사원 등록"/>
	<c:set var="btLabel" value="등록"/>
	<c:set var="url" value="/admin/employee/employeeRegister"/>
	<c:set var="empNo" value="0" />	
</c:if>

<div class="row g-0">
	<div class="col-lg-12 pe-lg-2 mb-3">
		<div class="card h-lg-100 overflow-hidden">
			<div class="card-header admindefault">
				<h5 class="mb-0 admindefault"><span class="fas fa-user" style="margin: 0 10px;"></span>${pageTitle }</h5>
			</div>
			<div class="card-body py-2 admindefault">
				<form name="frmWrite" method="post" enctype="multipart/form-data"
				action="<c:url value='${url }'/>">
					<c:if test="${!empty param.empNo}">
					<div class="row mb-3 d-flex align-items-center">
					    <div class="col-md-auto adminempdiv3">
					        <label class="col-form-label adminemplabel" for="name">사원 번호</label>
					    </div>
					    <div class="col-md-6">
					    	<span class="adminempspan">${map['EMP_NO']}</span>
					    </div>
					</div>
					</c:if>				
					<div class="row mb-3 d-flex align-items-center">
					    <div class="col-md-auto adminempdiv3">
					        <label class="col-form-label adminemplabel" for="name">사원 이름</label>
					    </div>
					    <div class="col-md-6">
					        <input type="text" value="${map['NAME']}" class="form-control admindefault" id="name" name="name"/>
					    </div>
					</div>
					<c:if test="${empty param.empNo}">
					<div class="col-md-auto adminempdiv8 col-md-6 d-flex justify-content-end" id="imagePriview">
					 <img src="<c:url value='/images/person.png'/>" class="img-fluid">
			    	</div>
			    	</c:if>
			    	<c:if test="${!empty param.empNo}">
					<div class="col-md-auto adminempdiv8 col-md-6 d-flex justify-content-end" id="imagePriview">
					 <img src="<c:url value='/images/${map["IMAGE"]}'/>" class="img-fluid">
			    	</div>
			    	</c:if>
					<div class="row mb-3 d-flex align-items-center">
					    <div class="col-md-auto adminempdiv17">
					        <label class="col-form-label adminemplabel" for="ename">사원 영문이름</label>
					    </div>
					    <div class="col-md-6">
					        <input type="text" value="${map['ENAME']}" class="form-control admindefault" id="ename" name="ename"/>
					    </div>
					</div>
					<div class="row mb-3 d-flex align-items-center">
					    <div class="col-md-auto adminempdiv4">
							<label class="col-form-label adminemplabel">주민번호</label>
						</div>	 
						<div class="col-md-6 adminspan">							
							<input type="text" class="form-control admindefault" 
							id="jumin1" name="jumin1" maxlength="6">
							<span class="adminhyphen">-</span>
							<input type="password" class="form-control admindefault" 
							id="jumin2" name="jumin2" maxlength="7">
						</div>
					</div>
					<div class="row mb-3 d-flex align-items-center">
						<div class="col-md-auto adminempdiv3">
							<label class="col-form-label adminemplabel" for="imageUpload">사원 사진</label>
						</div>
						<div class="col-md-6">	 
							<input type="file" class="form-control admindefault" name="imageUpload" id="imageUpload"/>
						</div>
					</div>
					<c:if test="${empty param.empNo}">
					<div class="row mb-3 d-flex align-items-center">
					    <div class="col-md-auto adminempdiv17">
							<label class="col-form-label adminemplabel" for="pwd">초기 비밀번호</label>
						</div>
						<div class="col-md-6">
							<input type="password" class="form-control admindefault" id="pwd" name="pwd" placeholder="초기비밀번호는 사원의 생년월일 앞 6자리 입니다." />
						</div>
					</div>
					</c:if>	
					<div class="row mb-3 d-flex align-items-center">
					    <div class="col-md-auto adminempdiv6">
							<label class="col-form-label adminemplabel" for="basic-form-gender">부서</label>
						</div>
						<div class="col-md-6 adminspan">
							 <select class="form-select admindefault" id="dept" name="deptNo">
									<option value="">선택하세요</option>
									<!-- 반복 -->
						            <c:forEach var="deptVo" items="${deptList }">
						            	<option value="${deptVo.deptNo}"
						            		<c:if test="${deptVo.deptNo == map['DEPT_NO']}">
						            			selected="selected"
					            			</c:if>
						            	>${deptVo.name}</option>
						            </c:forEach>
					            </select>
						</div>
					</div>
					<div class="row mb-3 d-flex align-items-center">
					    <div class="col-md-auto adminempdiv6">
							<label class="col-form-label adminemplabel" for="basic-form-gender">직위</label>
						</div>
						<div class="col-md-6 adminspan">
							 <select class="form-select admindefault" id="position" name="positionNo">
								<option value="">선택하세요</option>
									<!-- 반복 -->
						            <c:forEach var="positionVo" items="${positionList }">
						            	<option value="${positionVo.positionNo}"
						            		<c:if test="${positionVo.positionNo == map['POSITION_NO']}">
						            			selected="selected"
						            		</c:if>
						            	>${positionVo.positionName}</option>
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
		                        <input type="radio" class="form-check-input" id="authorityFlagY" value="Y" name="authority" />
	                       </div>
	                       <span class="adminhyphen"></span>
	                       <div class="form-check">
		                        <label class="form-check-label mb-0" for="authorityFlagN">N</label>
		                        <input type="radio" class="form-check-input" id="authorityFlagN" value="N" name="authority" checked="checked"/>
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
							<input type="text" class="form-control admindefault" id="tel1" name="tel1" style="width: 33%;" maxlength="3"
			                       value="${tel1}"/>
			                <span class="adminhyphen">-</span>
			                <input type="text" class="form-control admindefault" id="tel2" name="tel2" style="width: 33%;" maxlength="4"
			                       value="${tel2}"/>
			                <span class="adminhyphen">-</span>
			                <input type="text" class="form-control admindefault" id="tel3" name="tel3" style="width: 33%;" maxlength="4"
			                       value="${tel3}"/>
				    	</div>
					</div>
					<div class="row d-flex align-items-center">
					    <div class="col-md-auto adminempdiv6">
							<label class="col-form-label adminemplabel" for="address">주소</label>
						</div>
						<div class="col-md-6 adminspan">
							<input type="text" class="form-control admindefault" id="sample4_postcode" placeholder="우편번호" style="width: 65%;"/>
							<span class="adminhyphen"></span>
							<input type="Button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" id="btnsearchAddress" class="btn btn-primary" style="width: 35%;">
						</div>
					</div>
				    <div class="row mb-3 d-flex align-items-center">
				    	<div class="col-md-auto adminempdiv16"></div>
					    <div class="col-md-6">
					        <input type="text" class="form-control admindefault" id="sample4_roadAddress" placeholder="도로명주소">
					        <input type="text" value="${map['ADDRESSDETAIL']}" class="form-control admindefault" name="addressdetail" id="sample4_detailAddress" placeholder="상세주소">
					    </div>
				    </div>
					<div class="row mb-3 d-flex align-items-center">
					    <div class="col-md-auto adminempdiv5">
							<label class="col-form-label adminemplabel" for="hiredate">입사일</label>
						</div>
						<div class="col-md-6"> 
						
						<c:if test="${empty param.empNo}">
							<input type="date" class="form-control admindefault" id="hiredate" name="hiredate" placeholder="달력을 눌러주세요."/>
					    </c:if>
					    <c:if test="${!empty param.empNo}">
					    	<span class="adminempspan">
								<fmt:formatDate value="${map['HIREDATE']}" pattern="yyyy년 MM 월 dd 일"/>
							</span>
					    </c:if>
						</div>
					</div>
					<div class="row mb-3 d-flex align-items-center">
					    <div class="col-md-auto adminempdiv6">
							<label class="col-form-label adminemplabel" for="annualSalary">연봉</label>
						</div>
						<div class="col-md-6 adminspan">  
							<input type="text" value="${map['ANNUAL_SALARY']}" class="form-control admindefault" id="annualSalary" name="annualSalary" style="width: 85%"/>
							<span class="adminempspan">만원</span>
						</div>
					</div>
					<div class="row mb-3 d-flex align-items-center">
						<div class="col-md-auto adminempdiv5">
							<label class="col-form-label adminemplabel">이메일</label>
						</div>	 
						<div class="col-md-9 adminspan">
						 <input type="text" class="form-control admindefault" id="email1" name="email1" style="width: 31%;"
				                       value="${email1}" />
		                <span class="adminhyphen">@</span>
		                <select class="form-select admindefault" name="email2" id="email2" title="이메일주소 뒷자리" style="width: 33%;">
		                    <option value="naver.com">naver.com</option>
		                    <option value="hanmail.net">hanmail.net</option>
		                    <option value="nate.com">nate.com</option>
		                    <option value="gmail.com">gmail.com</option>
		                    <option value="etc">직접입력</option>
		                </select>
		                <span class="adminhyphen"></span>
		                <input type="text" name="email3" id="email3" title="직접입력인 경우 이메일주소 뒷자리" 
		                       class="form-control admindefault" style="visibility: hidden; width: 35%;" value="${email3}" />
						</div>
					</div>
					<c:if test="${!empty param.empNo && !empty map['MARRIED']}">
					<div class="row mb-3 d-flex align-items-center">
					    <div class="col-md-auto adminempdiv3">
					        <label class="col-form-label adminemplabel" for="name">결혼 여부</label>
					    </div>
					    <div class="col-md-6">
					       <span class="adminempspan">${map['MARRIED']}</span>
					    </div>
					</div>
					</c:if>
					<c:if test="${!empty param.empNo}">
					<div class="row mb-3 d-flex align-items-center">
					    <div class="col-md-auto adminempdiv5">
							<label class="col-form-label adminemplabel" for="club">동호회</label>
						</div>
						<div class="col-md-6"> 
					    <c:if test="${empty map['CLUB_NO']}">
					    	<span class="adminempspan">미가입</span>
					    </c:if>
					    <c:if test="${!empty map['CLUB_NO']}">
							<span class="adminempspan">${map['TITLE']}</span>
						</c:if>
						</div>
					</div>
					</c:if>
					<div style="text-align: center;">
						<input type="button" id="confirmForm" value="${btLabel}" class="btn btn-primary"/>
						<input type="submit" id="empWrite" value="${btLabel}" class="btn btn-primary"/>
						<input type="button" value="취소" id="btCancel" class="btn btn-secondary"/>
					</div>
					
					<!-- hidden 처리 인풋태그들 -->
					<c:if test="${!empty param.empNo}">
						<input type="text" name="oldFileName" value="${map['IMAGE']}">
						<input type="hidden" name="empNo" value="${empNo}" />
					</c:if>
					 <input type="hidden" id="jumin" name="jumin" value="${map['JUMIN']}"/>
					 <input type="hidden" id="extensionNo" name="extensionNo" value="${map['EXTENSION_NO']}"/>
					 <input type="hidden" id="address" name="address" value="${map['ADDRESS']}"/>
					 <input type="hidden" id="tel" name="tel" value="${map['TEL']}"/>
					 <input type="hidden" id="email" name="email" value="${map['EMAIL']}"/>
					 <input type="hidden" id="authority" value="${map['AUTHORITY']}"/>	
					 <input type="hidden" id="adminPwdChkFlag"/>
				</form>
			</div>
		</div>
	</div>
</div>

<%@ include file='adminPwdConfirm.jsp' %>
<%@ include file='../../inc/adminBottom.jsp'%>