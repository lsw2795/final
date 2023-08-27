<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<script type="text/javascript">
	$(function(){
		$('#updateRetiredate').click(function(){
			var ConfirmFormCheck=false;
			if ($('#retiredate').val().length!=10) {
				alert("퇴사일자의 형식이 올바르지 않습니다. 퇴사일 형식 예시)2023-05-20");
				$('#retiredate').focus();
				return false;
			}
			$('#authentication-modal').modal('show'); 
		});
	});
</script>    
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
		        <button type="submit" data-bs-toggle="modal" data-bs-target="#deleteEmp" class="btn btn-primary" id="updateRetiredate">확인</button>
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
	      </div>
      </div>
    </div>
  </div>
</div>