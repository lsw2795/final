<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 
관리자뷰 - employeeRegister.jsp에 include지시자를 사용한 모달창 모음
작성자 : 송영은
작성일 : 2023.08
 -->     
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="<c:url value='/js/jquery-3.7.0.min.js'/>"></script> 
<div class="modal fade" id="deleteEmp-modal" tabindex="-1" role="dialog" aria-labelledby="deleteEmp-modal-label" aria-hidden="true">
   <div class="modal-dialog mt-6" role="document">
     <div class="modal-content border-0">
       <div class="modal-header px-5 position-relative modal-shape-header bg-shape">
         <div class="position-relative z-1" data-bs-theme="light">
 			<h4 class="mb-0 text-white" id="deleteEmp-modal-label">퇴사자 등록</h4>
         </div>
         <button class="btn-close btn-close-white position-absolute top-0 end-0 mt-2 me-2" data-bs-dismiss="modal" aria-label="Close"></button>
       </div>
       <div class="modal-body py-4 px-5 admindefault">
          <div class="mb-3">
             <label class="form-label" for="retiredate">퇴사 일자</label>
             <input class="form-control admindefault" name="retiredate" type="date" autocomplete="on" id="retiredate" />
           </div>
	       <div class="modal-footer">
		        <button type="submit" class="btn btn-primary" id="updateRetiredate">확인</button>
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
	      </div>
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="authentication-modal" tabindex="-1" role="dialog" aria-labelledby="authentication-modal-label" aria-hidden="true">
   <div class="modal-dialog mt-6" role="document">
     <div class="modal-content border-0">
       <div class="modal-header px-5 position-relative modal-shape-header bg-shape">
         <div class="position-relative z-1" data-bs-theme="light">
 			<h4 class="mb-0 text-white" id="authentication-modal-label">관리자 비밀번호 확인</h4>
         </div>
         <button class="btn-close btn-close-white position-absolute top-0 end-0 mt-2 me-2" data-bs-dismiss="modal" aria-label="Close"></button>
       </div>
       <div class="modal-body py-4 px-5 admindefault">
          <div class="mb-3">
             <label class="form-label" for="adminPwd">관리자 비밀번호</label>
             <input class="form-control admindefault" type="password" autocomplete="on" id="adminPwd" />
           </div>
	       <div class="modal-footer">
		        <button type="submit" class="btn btn-primary" id="btnadminPwd">확인</button>
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
	      </div>
      </div>
    </div>
  </div>
</div>


<div class="modal fade" id="authentication-modal2" tabindex="-1" role="dialog" aria-labelledby="authentication-modal-label2" aria-hidden="true">
   <div class="modal-dialog mt-6" role="document">
     <div class="modal-content border-0">
       <div class="modal-header px-5 position-relative modal-shape-header bg-shape">
         <div class="position-relative z-1" data-bs-theme="light">
 			<h4 class="mb-0 text-white" id="authentication-modal-label2">관리자 비밀번호 확인</h4>
         </div>
         <button class="btn-close btn-close-white position-absolute top-0 end-0 mt-2 me-2" data-bs-dismiss="modal" aria-label="Close"></button>
       </div>
       <div class="modal-body py-4 px-5 admindefault">
          <div class="mb-3">
             <label class="form-label" for="adminPwd2">관리자 비밀번호</label>
             <input class="form-control admindefault" type="password" autocomplete="on" id="adminPwd2" />
           </div>
	       <div class="modal-footer">
		        <button type="submit" class="btn btn-primary" id="btnadminPwd2">확인</button>
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
	      </div>
      </div>
    </div>
  </div>
</div>
