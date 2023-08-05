<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file='../../inc/adminTop.jsp'%>
<link rel="stylesheet" href="<c:url value='/css/adminempform.css'/>">
<div class="row g-0">
	<div class="col-lg-12 pe-lg-2 mb-3">
		<div class="card h-lg-100 overflow-hidden">
			<div class="card-header admindefault">
				<h5 class="mb-0 admindefault"><span class="fas fa-user" style="margin: 0 10px;"></span>사원 등록</h5>
			</div>
			<div class="card-body py-2 admindefault">
				<form>
					<div class="row mb-3 d-flex align-items-center">
					    <div class="col-md-auto adminempdiv3">
					        <label class="form-label" for="name">사원 이름</label>
					    </div>
					    <div class="col-md-6">
					        <input type="text" class="form-control admindefault" id="name" />
					    </div>
					</div>
					<div class="row mb-3 d-flex align-items-center">
					    <div class="col-md-auto">
					        <label class="form-label" for="ename">사원 영어이름</label>
					    </div>
					    <div class="col-md-6">
					        <input type="text" class="form-control admindefault" id="ename" />
					    </div>
					</div>
					<div class="row mb-3 d-flex align-items-center">
					    <div class="col-md-auto adminempdiv4">
							<label class="form-label">주민번호</label>
						</div>	 
						<div class="col-md-6 adminspan">							
							<input type="text" class="form-control admindefault" id="jumin1" name="jumin1" maxlength="6">
							<span class="adminhyphen">-</span>
							<input type="password" class="form-control admindefault" id="jumin2" name="jumin2" maxlength="7">
						</div>
					</div>
					<div class="row mb-3 d-flex align-items-center">
					    <div class="col-md-auto adminempdiv1">
							<label class="form-label" for="password">초기비밀번호</label>
						</div>
						<div class="col-md-6">
							<input type="password" class="form-control admindefault" id="password" placeholder="초기비밀번호는 사원의 생년월일 앞 6자리 입니다." />
						</div>
					</div>	
					<div class="row mb-3 d-flex align-items-center">
					    <div class="col-md-auto adminempdiv6">
							<label class="form-label" for="basic-form-gender">부서</label>
						</div>
						<div class="col-md-6 adminspan">
							 <select class="form-select admindefault" id="dept">
								<option selected="selected">선택하세요</option>
								<option value="">영업팀</option>
								<option value="">인사팀</option>
								<option value="">경리팀</option>
								<option value="">디자인팀</option>
							</select>
						</div>
					</div>
					<div class="row mb-3 d-flex align-items-center">
					    <div class="col-md-auto adminempdiv6">
							<label class="form-label" for="basic-form-gender">직급</label>
						</div>
						<div class="col-md-6 adminspan">
							 <select class="form-select admindefault" id="dept">
								<option selected="selected">선택하세요</option>
								<option value="">사원</option>
								<option value="">대리</option>
								<option value="">차장</option>
								<option value="">과장</option>
								<option value="">팀장</option>
								<option value="">부장</option>
								<option value="">임원</option>
								<option value="">사장</option>
							</select>
						</div>
					</div>
					<div class="row mb-3 d-flex align-items-center">
					    <div class="col-md-auto adminempdiv6">
							<label class="form-label" for="basic-form-gender">권한</label>
						</div>
						<div class="col-md-6 adminspan">
							<div class="form-check">
		                        <label class="form-check-label mb-0" for="">Y</label>
		                        <input type="radio" class="form-check-input" id=""  name="" />
	                       </div>
	                       <span class="adminhyphen"></span>
	                       <div class="form-check">
		                        <label class="form-check-label mb-0" for="">N</label>
		                        <input type="radio" class="form-check-input" id=""  name="" checked="checked"/>
	                      </div>
						  <span class="adminhyphen"><small>(관리자 로그인 접근 권한 여부 선택란 입니다.)</small></span>
						</div>
					</div>
					<div class="row mb-3 d-flex align-items-center">
					    <div class="col-md-auto adminempdiv4">
							<label class="form-label">내선번호</label> 
						</div>	
						<div class="col-md-6 adminspan">							
							<input type="text" class="form-control admindefault" id="extensionNo1" name="extensionNo1" maxlength="4">
							<span class="adminhyphen">-</span>
							<input type="text" class="form-control admindefault" id="extensionNo2" name="extensionNo2" maxlength="4">
						</div>
					</div>
					<div class="row mb-3 d-flex align-items-center">
					    <div class="col-md-auto adminempdiv4">
							<label class="form-label">전화번호</label>
						</div> 
						<div class="col-md-6 adminspan">
					        <input type="text" class="form-control admindefault" id="tel1" name="tel1" style="width: 33%;" maxlength="3"/>
					        <span class="adminhyphen">-</span>
					        <input type="text" class="form-control admindefault" id="tel2" name="tel2" style="width: 33%;" maxlength="4" />
					        <span class="adminhyphen">-</span>
					        <input type="text" class="form-control admindefault" id="tel3" name="tel3" style="width: 33%;" maxlength="4" />
				    	</div>
					</div>
					<div class="row mb-3 d-flex align-items-center">
					    <div class="col-md-auto adminempdiv6">
							<label class="form-label" for="ename">주소</label>
						</div>
						<div class="col-md-8 adminspan">	 
							<input type="text" class="form-control admindefault" id="address" placeholder="주소" style="width: 75%;"/>
							<span class="adminhyphen"></span>
							<input type="Button" value="주소검색" id="btnAddress" class="btn btn-primary" title="새창열림" style="width: 25%;">
						</div>
					</div>
					<div class="row mb-3 d-flex align-items-center">
					    <div class="col-md-auto adminempdiv5">
							<label class="form-label" for="hiredate">입사일</label>
						</div>
						<div class="col-md-6"> 
							<input type="date" class="form-control admindefault" id="hiredate" placeholder="달력을 눌러주세요."/>
						</div>
					</div>
					<div class="row mb-3 d-flex align-items-center">
					    <div class="col-md-auto adminempdiv6">
							<label class="form-label" for="annualSalary">연봉</label>
						</div>
						<div class="col-md-7 adminspan">  
							<input type="text" class="form-control admindefault" id="annualSalary" style="width: 85%"/>
							<span class="adminempspan">만원</span>
						</div>
					</div>
					<div class="row mb-3 d-flex align-items-center">
						<div class="col-md-auto adminempdiv5">
							<label class="form-label">이메일</label>
						</div>	 
						<div class="col-md-9 adminspan">							
							<input type="text" class="form-control admindefault" id="email1" name="email1" style="width: 31%">
							<span class="adminhyphen">@</span>
							<select class="form-select admindefault" name="email2" id="email2" title="이메일주소 뒷자리" style="width: 31.5%">
					            <option value="naver.com">naver.com</option>
					            <option value="hanmail.net">hanmail.net</option>
					            <option value="nate.com">nate.com</option>
					            <option value="gmail.com">gmail.com</option>
					            <option value="etc">직접입력</option>
					        </select>
					        <span class="adminhyphen"></span>
					        <input type="text" name="email3" id="email3" title="직접입력인 경우 이메일주소 뒷자리" 
					        	class="form-control admindefault" style="visibility:visibility; width: 33%">
						</div>
					</div>
					<div class="row mb-3 d-flex align-items-center">
						<div class="col-md-auto adminempdiv3">
							<label class="form-label">사원 사진</label>
						</div>
						<div class="col-md-6">	 
							<input type="file" class="form-control admindefault"/>
						</div>
					</div>
					<div style="text-align: center;">
					<input type="submit" value="등록" class="btn btn-primary"/>
					<input type="button" value="취소" class="btn btn-primary"/>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<%@ include file='../../inc/adminBottom.jsp'%>