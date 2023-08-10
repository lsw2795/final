<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../inc/top.jsp" %>
<link rel="stylesheet" href="<c:url value='/css/mypageempform.css'/>">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
</script>
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
						<div class="col-md-6 mypagespan">	 
							<input type="text" class="form-control" id="sample4_postcode" placeholder="우편번호" style="width: 70%;"/>
							<span class="mypagehyphen"></span>
							<input type="Button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" class="btn btn-primary" style="width: 30%;">
						</div>
						<div class="col-md-6 mypageempdiv10">
							<input type="text" class="form-control" id="sample4_roadAddress" placeholder="도로명주소" style="width: 100%;">
						</div>
						<div class="col-md-6 mypagespan mypageempdiv10">	
							<input type="text" class="form-control" id="sample4_jibunAddress" placeholder="지번주소" style="width: 80%;">
							<span class="mypagehyphen"></span>
							<input type="text" class="form-control" id="sample4_extraAddress" placeholder="참고항목" style="width: 20%;">
						</div>
						<div class="col-md-6 mypageempdiv10">	
							<span id="guide" style="color:#999;display:none"></span>
							<input type="text" class="form-control" id="sample4_detailAddress" placeholder="상세주소">
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