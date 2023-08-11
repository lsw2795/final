<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file='../../inc/adminTop.jsp'%>
<link rel="stylesheet" href="<c:url value='/css/adminempform.css'/>">
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
              /*   if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                } */

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                //document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
             /*    // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                } */

               /*  var guideTextBox = document.getElementById("guide");
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
                } */
            }
        }).open();
    }
</script>
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
					        <label class="col-form-label adminemplabel" for="name">사원 이름</label>
					    </div>
					    <div class="col-md-6">
					        <input type="text" class="form-control admindefault" id="name" />
					    </div>
					</div>
					<div class="row mb-3 d-flex align-items-center">
					    <div class="col-md-auto adminempdiv17">
					        <label class="col-form-label adminemplabel" for="ename">사원 영어이름</label>
					    </div>
					    <div class="col-md-6">
					        <input type="text" class="form-control admindefault" id="ename" />
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
							<label class="col-form-label adminemplabel" for="password">초기비밀번호</label>
						</div>
						<div class="col-md-6">
							<input type="password" class="form-control admindefault" id="password" placeholder="초기비밀번호는 사원의 생년월일 앞 6자리 입니다." />
						</div>
					</div>	
					<div class="row mb-3 d-flex align-items-center">
					    <div class="col-md-auto adminempdiv6">
							<label class="col-form-label adminemplabel" for="basic-form-gender">부서</label>
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
							<label class="col-form-label adminemplabel" for="basic-form-gender">직급</label>
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
						<!-- <input type="text" class="form-control admindefault" id="sample4_jibunAddress" placeholder="지번주소" style="width: 80%;"> -->
						<!-- <input type="text" class="form-control admindefault" id="sample4_extraAddress" placeholder="참고항목" style="width: 20%;"> -->
						<!-- <span id="guide" style="color:#999;display:none"></span> -->
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
							<select class="form-select admindefault" name="email2" id="email2" title="이메일주소 뒷자리" style="width: 33%">
					            <option value="naver.com">naver.com</option>
					            <option value="hanmail.net">hanmail.net</option>
					            <option value="nate.com">nate.com</option>
					            <option value="gmail.com">gmail.com</option>
					            <option value="etc">직접입력</option>
					        </select>
					        <span class="adminhyphen"></span>
					        <input type="text" name="email3" id="email3" title="직접입력인 경우 이메일주소 뒷자리" 
					        	class="form-control admindefault" style="visibility:visibility; width: 35%">
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
					<input type="submit" value="등록" class="btn btn-primary"/>
					<input type="button" value="취소" class="btn btn-primary"/>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<%@ include file='../../inc/adminBottom.jsp'%>