<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../inc/top.jsp" %>
<link rel="stylesheet" href="<c:url value='/css/mypageempform.css'/>">
<div class="row g-0">
	<div class="col-lg-12 pe-lg-2 mb-3">
		<div class="card h-lg-100 overflow-hidden">
			<div class="card-header">
				<h5 class="mb-0"><span class="fas fa-user" style="margin: 0 10px;"></span>내 정보 수정</h5>
			</div>
			<div class="card-body py-2">
				<form>
					<div class="row mb-3 d-flex align-items-center">
					    <div class="col-md-auto mypageempdiv3">
					        <label class="form-label mypageemplabel" for="name">사원 이름</label>
					    </div>
					    <div class="col-md-6">
					        <span class="mypageempspan">이름 고정</span>
					    </div> 
					</div>
						<div class="col-md-auto mypageempdiv8">
				        	<img src="<c:url value='/images/IMG_5487.jpg'/>" alt="사원 이미지" class="employeeimage">
				    	</div>
					<div class="row mb-3 d-flex align-items-center">
					    <div class="col-md-auto">
					        <label class="form-label mypageemplabel" for="ename">사원 영어이름</label>
					    </div>
					    <div class="col-md-6">
					       <span class="mypageempspan">사원영어이름 고정</span>
					    </div>
					</div>
					<div class="row mb-3 d-flex align-items-center">
					    <div class="col-md-auto mypageempdiv6">
							<label class="form-label mypageemplabel" for="basic-form-gender">부서</label>
						</div>
						<div class="col-md-6 mypagespan">
							<span class="mypageempspan">부서는 관리자만 수정가능</span>
						</div>
					</div>
					<div class="row mb-3 d-flex align-items-center">
					    <div class="col-md-auto mypageempdiv6">
							<label class="form-label mypageemplabel" for="basic-form-gender">직급</label>
						</div>
						<div class="col-md-6 mypagespan">
							 <span class="mypageempspan">직급은 관리자만 수정가능</span>
						</div>
					</div>
					
					<div class="row mb-3 d-flex align-items-center">
					    <div class="col-md-auto mypageempdiv4">
							<label class="form-label mypageemplabel">내선번호</label> 
						</div>	
						<div class="col-md-6 mypagespan">							
							<span class="mypageempspan">내선번호는 관리자만 수정가능</span>
						</div>
					</div>
					<div class="row mb-3 d-flex align-items-center">
					    <div class="col-md-auto mypageempdiv5">
							<label class="form-label mypageemplabel" for="hiredate">입사일</label>
						</div>
						<div class="col-md-6"> 
							<span class="mypageempspan">입사일 고정</span>
						</div>
					</div>
					<div class="row mb-3 d-flex align-items-center">
					    <div class="col-md-auto mypageempdiv4">
							<label class="form-label mypageemplabel">근속연수</label> 
						</div>	
						<div class="col-md-6 mypagespan">							
							<span class="mypageempspan">근속연수 고정</span>
						</div>
					</div>
					<div class="row mb-3 d-flex align-items-center">
					    <div class="col-md-auto mypageempdiv6">
							<label class="form-label mypageemplabel" for="annualSalary">연봉</label>
						</div>
						<div class="col-md-6">  
							<span class="mypageempspan">연봉은 관리자만 수정가능</span>
						</div>
					</div>
					<div class="row mb-3 d-flex align-items-center">
					    <div class="col-md-auto mypageempdiv4">
							<label class="form-label mypageemplabel" for="password">비밀번호</label>
						</div>
						
						<div class="col-md-8 mypagespan">	 
							<input type="text" class="form-control" id="password" style="width: 75%;"/>
							<span class="mypagehyphen"></span>
							<input type="Button" value="비밀번호 변경" id="btnpwdEdit" class="btn btn-primary" title="새창열림" style="width: 25%;">
						</div>
					</div>
					<div class="row mb-3 d-flex align-items-center">
					    <div class="col-md-auto">
							<label class="form-label mypageemplabel" for="password1">비밀번호 확인</label>
						</div>
						<div class="col-md-6">
							<input type="password" class="form-control" id="password1" />
						</div>
					</div>
					
					<div class="row mb-3 d-flex align-items-center">
					    <div class="col-md-auto mypageempdiv4">
							<label class="form-label mypageemplabel">전화번호</label>
						</div> 
						<div class="col-md-6 mypagespan">
					        <input type="text" class="form-control" id="tel1" name="tel1" style="width: 33%;" maxlength="3"/>
					        <span class="mypagehyphen">-</span>
					        <input type="text" class="form-control" id="tel2" name="tel2" style="width: 33%;" maxlength="4" />
					        <span class="mypagehyphen">-</span>
					        <input type="text" class="form-control" id="tel3" name="tel3" style="width: 33%;" maxlength="4" />
				    	</div>
					</div>
					<div class="row mb-3 d-flex align-items-center">
					    <div class="col-md-auto mypageempdiv6">
							<label class="form-label mypageemplabel" for="ename">주소</label>
						</div>
						<div class="col-md-8 mypagespan">	 
							<input type="text" class="form-control" id="address" placeholder="주소" style="width: 75%;"/>
							<span class="mypagehyphen"></span>
							<input type="Button" value="주소검색" id="btnAddress" class="btn btn-primary" title="새창열림" style="width: 25%;">
						</div>
					</div>
					
					<div class="row mb-3 d-flex align-items-center">
						<div class="col-md-auto mypageempdiv5">
							<label class="form-label mypageemplabel">이메일</label>
						</div>	 
						<div class="col-md-9 mypagespan">							
							<input type="text" class="form-control" id="email1" name="email1" style="width: 30%">
							<span class="mypagehyphen">@</span>
							<select class="form-select" name="email2" id="email2" title="이메일주소 뒷자리" style="width: 31%">
					            <option value="naver.com">naver.com</option>
					            <option value="hanmail.net">hanmail.net</option>
					            <option value="nate.com">nate.com</option>
					            <option value="gmail.com">gmail.com</option>
					            <option value="etc">직접입력</option>
					        </select>
					        <span class="mypagehyphen"></span>
					        <input type="text" name="email3" id="email3" title="직접입력인 경우 이메일주소 뒷자리" 
					        	class="form-control" style="visibility:visibility; width: 33%">
						</div>
					</div>
					
					<div class="row mb-3 d-flex align-items-center">
					    <div class="col-md-auto mypageempdiv4">
							<label class="form-label mypageemplabel">결혼여부</label>
						</div> 
						<div class="col-md-6 mypagespan">
					        <div class="form-check">
		                        <label class="form-check-label mb-0" for="">Y</label>
		                        <input type="radio" class="form-check-input" id=""  name="" />
	                       </div>
	                       <span class="mypagehyphen"></span>
	                       <div class="form-check">
		                        <label class="form-check-label mb-0" for="">N</label>
		                        <input type="radio" class="form-check-input" id=""  name="" checked="checked"/>
	                      </div>
				    	</div>
					</div>
					<div class="row mb-3 d-flex align-items-center">
					    <div class="col-md-auto mypageempdiv5">
							<label class="form-label mypageemplabel" for="">동호회</label>
						</div>
						<div class="col-md-6"> 
							<span class="mypageempspan">동호회가 있으면 나타남</span>
						</div>
					</div>
					
					<div style="text-align: center;">
					<input type="submit" value="수정" class="btn btn-primary"/>
					<input type="button" value="취소" class="btn btn-primary"/>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<%@ include file = "../inc/bottom.jsp" %>