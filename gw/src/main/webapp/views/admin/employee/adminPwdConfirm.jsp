<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
             <label class="form-label" for="pwd">관리자 비밀번호</label>
             <input class="form-control admindefault" type="password" autocomplete="on" id="pwd" />
           </div>
	       <div class="modal-footer">
		        <button type="submit" class="btn btn-primary" id="btnadminPwd">확인</button>
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
	      </div>
      </div>
    </div>
  </div>
</div>