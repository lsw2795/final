<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 
사원뷰 - 마이페이지 사원정보 수정 뷰
내용 : 모든 input태그 유효성검사(/js/employee2.js), 사원 정보 조회, 비밀번호 수정 이동 
	  비밀번호 일치시 수정 처리
컨트롤러 : com.ez.gw.employee.controller.EmployeeController  
작성자 : 송영은
작성일 : 2023.08
 -->     
<%@ include file = "../inc/top.jsp" %>
<link rel="stylesheet" href="<c:url value='/css/mypageempform.css'/>">
<script type="text/javascript" src="<c:url value='/js/employee2.js'/>"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
$(function(){
	//취소 버튼 클릭시 새로고침
	$('#empEditcancel').click(function(){
		location.reload();
	});
});
//비밀번호 수정 창 생성
function btnpwdEdit(empNo){
	 window.open("<c:url value='/mypage/pwdEdit?empNo='/>"+empNo,'pwdEdit','width=450,height=400,top=200,left=600,location=yes,resizable=yes');
}
</script>
<div class="row g-0">
	<div class="col-lg-12 pe-lg-2 mb-3">
		<div class="card h-lg-100 overflow-hidden">
			<div class="card-header">
				<h5 class="mb-0"><span class="fas fa-user" style="margin: 0 10px;"></span>
				내 정보 수정
				</h5>
				<small>개명 등의 기타 수정사항은 인사팀에 문의 바랍니다.</small>
			</div>
			<div class="card-body py-2">
				<form name="frmWrite" method="post" enctype="multipart/form-data"
				action="<c:url value='/mypage/empInfoEdit'/>">	
					<div class="row mb-3 d-flex align-items-center">
					    <div class="col-md-auto mypageempdiv3">
					        <label class="col-form-label mypageemplabel" for="name">사원 번호</label>
					    </div>
					    <div class="col-md-6">
					        <span class="mypageempspan">${map['EMP_NO']}</span>
					    </div> 
					</div>
					<div class="row mb-3 d-flex align-items-center">
					    <div class="col-md-auto mypageempdiv3">
					        <label class="col-form-label mypageemplabel" for="name">사원 이름</label>
					    </div>
					    <div class="col-md-6">
					        <span class="mypageempspan">${map['NAME']}</span>
					    </div> 
					</div>
					<div class="col-md-auto mypageempdiv8">
			        	<img src="<c:url value='/images/${map["IMAGE"]}'/>" alt="사원 이미지" class="employeeimage">
			    	</div>
					<div class="row mb-3 d-flex align-items-center">
					    <div class="col-md-auto mypageempdiv12">
					        <label class="col-form-label mypageemplabel" for="ename">사원 영어이름</label>
					    </div>
					    <div class="col-md-6">
					       <span class="mypageempspan">${map['ENAME']}</span>
					    </div>
					</div>
					<div class="row mb-3 d-flex align-items-center">
					    <div class="col-md-auto mypageempdiv4">
							<label class="col-form-label mypageemplabel">주민번호</label>
						</div>
						<div class="col-md-6">
					       <span class="mypageempspan" id="jumin">${map['JUMIN']}</span>
					    </div>
					</div>
						 
					<div class="row mb-3 d-flex align-items-center">
					    <div class="col-md-auto mypageempdiv6">
							<label class="col-form-label mypageemplabel" for="basic-form-gender">부서</label>
						</div>
						<div class="col-md-6 mypagespan">
							<span class="mypageempspan">${map['DEPT_NAME']}</span>
						</div>
					</div>
					<div class="row mb-3 d-flex align-items-center">
					    <div class="col-md-auto mypageempdiv6">
							<label class="col-form-label mypageemplabel" for="basic-form-gender">직급</label>
						</div>
						<div class="col-md-6 mypagespan">
							 <span class="mypageempspan">${map['POSITION_NAME']}</span>
						</div>
					</div>
					
					<div class="row mb-3 d-flex align-items-center">
					    <div class="col-md-auto mypageempdiv4">
							<label class="col-form-label mypageemplabel">내선번호</label> 
						</div>	
						<div class="col-md-6 mypagespan">							
							<span class="mypageempspan">${map['EXTENSION_NO']}</span>
						</div>
					</div>
					<div class="row mb-3 d-flex align-items-center">
					    <div class="col-md-auto mypageempdiv5">
							<label class="col-form-label mypageemplabel" for="hiredate">입사일</label>
						</div>
						<div class="col-md-6"> 
							<span class="mypageempspan">
								<fmt:formatDate value="${map['HIREDATE']}" pattern="yyyy년 MM 월 dd 일"/>
							</span>
						</div>
					</div>
					<c:if test="${!empty map['ANNUAL_YEAR']}">
					<div class="row mb-3 d-flex align-items-center">
					    <div class="col-md-auto mypageempdiv4">
							<label class="col-form-label mypageemplabel">근속연수</label> 
						</div>	
						<div class="col-md-6 mypagespan">							
							<span class="mypageempspan">${map['ANNUAL_YEAR']}</span>
						</div>
					</div>
					</c:if>
					<div class="row mb-3 d-flex align-items-center">
					    <div class="col-md-auto mypageempdiv6">
							<label class="col-form-label mypageemplabel" for="annualSalary">연봉</label>
						</div>
						<div class="col-md-6">
							<c:if test="${empty map['ANNUAL_SALARY']}">
								<span class="mypageempspan">
								연봉협상 예정
								</span>
							</c:if>	  
							<c:if test="${!empty map['ANNUAL_SALARY']}">
								<span class="mypageempspan">
									<fmt:formatNumber value="${map['ANNUAL_SALARY']}" pattern="#,###"/> 만
								</span>
							</c:if>
						</div>
					</div>
					<div class="row mb-3 d-flex align-items-center">
					    <div class="col-md-auto mypageempdiv4">
							<label class="col-form-label mypageemplabel" for="pwd">비밀번호</label>
						</div>
						
						<div class="col-md-8 mypagespan">	 
							<input type="password" class="form-control" id="pwd" name="pwd" style="width: 75%;"/>
							<span class="mypagehyphen"></span>
							
							<input type="Button" value="비밀번호 변경" onclick="btnpwdEdit(${map['EMP_NO']})" class="btn btn-primary" 
								title="새창열림" style="width: 25%;">
						</div>
					</div>
					<div class="row mb-3 d-flex align-items-center">
					    <div class="col-md-auto mypageempdiv12">
							<label class="col-form-label mypageemplabel" for="pwd2">비밀번호 확인</label>
						</div>
						<div class="col-md-6">
							<input type="password" class="form-control" id="pwd2" />
						</div>
					</div>
					
					<div class="row mb-3 d-flex align-items-center">
					    <div class="col-md-auto mypageempdiv4">
							<label class="col-form-label mypageemplabel">전화번호</label>
						</div> 
						<div class="col-md-6 mypagespan">
					        <input type="text" class="form-control" id="tel1" name="tel1" style="width: 33%;" maxlength="3"/>
					        <span class="mypagehyphen">-</span>
					        <input type="text" class="form-control" id="tel2" name="tel2" style="width: 33%;" maxlength="4" />
					        <span class="mypagehyphen">-</span>
					        <input type="text" class="form-control" id="tel3" name="tel3" style="width: 33%;" maxlength="4" />
				    	</div>
					</div>
					
					<div class="row d-flex align-items-center">
					    <div class="col-md-auto mypageempdiv6">
							<label class="col-form-label mypageemplabel" for="address">주소</label>
						</div>
						<div class="col-md-6 mypagespan mb-1">
							<input type="text" class="form-control" id="sample4_postcode" placeholder="우편번호" style="width: 65%;"/>
							<span class="mypagehyphen"></span>
							<input type="Button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" class="btn btn-primary" style="width: 35%;">
						</div>
					</div>
				    <div class="row mb-3 d-flex align-items-center">
				    	<div class="col-md-auto mypageempdiv10"></div>
					    <div class="col-md-6">
					        <input type="text" class="form-control" id="sample4_roadAddress" placeholder="도로명주소">
					        <div class="mb-1"></div>
					        <input type="text" class="form-control" name="addressdetail" id="sample4_detailAddress" value="${map['ADDRESSDETAIL']}" placeholder="상세주소">
					    </div>
				    </div>
					<div class="row mb-3 d-flex align-items-center">
						<div class="col-md-auto mypageempdiv5">
							<label class="col-form-label mypageemplabel">이메일</label>
						</div>	 
						<div class="col-md-9 mypagespan">
						<input type="text" class="form-control" id="email1" name="email1" style="width: 31%">
						<span class="mypagehyphen">@</span>
						<select class="form-select" name="email2" id="email2" title="이메일주소 뒷자리" style="width: 34%">
						    <option value="naver.com">naver.com</option>
						    <option value="hanmail.net">hanmail.net</option>
						    <option value="nate.com">nate.com</option>
						    <option value="gmail.com">gmail.com</option>
						    <option value="etc">직접입력</option>
						</select>
						<span class="mypagehyphen"></span>
						<input type="text" name="email3" id="email3" class="form-control" title="직접입력인 경우 이메일주소 뒷자리" style="visibility: hidden; width:35%;">
						</div>
					</div>
					
					<div class="row mb-3 d-flex align-items-center">
					    <div class="col-md-auto mypageempdiv4">
							<label class="col-form-label mypageemplabel">결혼여부</label>
						</div> 
						<div class="col-md-6 mypagespan">
					        <div class="form-check">
		                        <label class="form-check-label mb-0" for="marriedFlagY">Y</label>
		                        <input type="radio" class="form-check-input" id="marriedFlagY" value="Y" name="married" />
	                       </div>
	                       <span class="mypagehyphen"></span>
	                       <div class="form-check">
		                        <label class="form-check-label mb-0" for="marriedFlagN">N</label>
		                        <input type="radio" class="form-check-input" id="marriedFlagN" value="N" name="married"/>
	                      </div>
				    	</div>
					</div>
						<div class="row mb-3 d-flex align-items-center">
						    <div class="col-md-auto mypageempdiv5">
								<label class="col-form-label mypageemplabel" for="">동호회</label>
							</div>
							<div class="col-md-6"> 
								<c:if test="${empty map['CLUB_NO']}">
									<span class="mypageempspan">미가입</span>
								</c:if>
								<c:if test="${!empty map['CLUB_NO']}">
									<span class="mypageempspan">${map['TITLE']}</span>&nbsp;
									<a href="<c:url value='/club/outClub?empNo=${map["EMP_NO"]}'/>">
										<input type="Button" value="탈퇴" class="btn btn-primary btn-sm" style="width: 10%;">
									</a>
								</c:if>
							</div>
						</div>
					<div style="text-align: center;">
					<input type="submit" value="수정" id="empWrite" class="btn btn-primary"/>
					<input type="button" value="취소" id="empEditcancel" class="btn btn-secondary"/>
					</div>
					<!-- hidden 처리 인풋태그들 -->
					 <input type="hidden" id="tel" name="tel" value="${map['TEL']}"/>
					 <input type="hidden" id="email" name="email" value="${map['EMAIL']}"/>
					 <input type="hidden" id="address" name="address" value="${map['ADDRESS']}"/>
					 <input type="hidden" id="married" value="${map['MARRIED']}"/>
 				</form>
			</div>
		</div>
	</div>
</div>
<%@ include file = "../inc/bottom.jsp" %>