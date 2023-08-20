<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Modal -->
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content admindefault">
      <div class="modal-header">
        <h5 class="modal-title admindefault" id="staticBackdropLabel">관리자 비밀번호 확인</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      	 <label for="pwd">관리자 비밀번호</label>
         <input type="password" id="pwd" class="form-control admindefault">
      </div>
      <div class="modal-footer">
        <button type="submit" class="btn btn-primary" id="btnadminPwd">확인</button>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>
