<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- Modal -->
<div class="modal fade" id="staticBackdrop1" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel1" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header admindefault">
        <h5 class="modal-title fs-5 admindefault" id="staticBackdropLabel1">부서 추가</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body admindefault">
        <div class="mb-3 row">
		  <label class="col-sm-3 col-form-label" for="staticEmail">부서 이름</label>
		  <div class="col-sm-8">
			  <input class="form-control admindefault" id="dept_name" name="dept_name" type="text"/>
			  <div class="mb-3 row"></div>
		  </div>
		  <label class="col-sm-3 col-form-label" for="inputPassword">부서장</label>
		  	<div class="col-sm-8">
		    	<input class="form-control admindefault" id="manager" name="manager" type="text" />
		    	<div class="mb-3 row"></div>
		 	</div>
		   <label class="col-sm-3 col-form-label" for="inputPassword">상위 부서</label>
		  	<div class="col-sm-8">
		    	<input class="form-control admindefault" id="upper_dept" name="upper_dept" type="text" />
		    	<div class="mb-3 row"></div>
		 	</div>
		 	 <label class="col-sm-3 col-form-label" for="inputPassword">부서 등급</label>
		  	<div class="col-sm-8">
		    	<input class="form-control admindefault" id="dept_level" name="dept_level" type="text" />
		 	</div>
		</div>
      </div>
      <div class="modal-footer admindefault">
        <button type="button" class="btn btn-primary">등록</button>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>

<!-- Modal -->
<div class="modal fade" id="staticBackdrop2" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel2" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header admindefault">
        <h5 class="modal-title fs-5 admindefault" id="staticBackdropLabel2">부서 수정</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body admindefault">
        <div class="mb-3 row">
          <div class="col-md-5">
	      <select class="form-select admindefault">
	      	<option value="">선택하세요</option>
	      </select>
	      </div>
	       <div class="mb-3 row"></div>
		  <label class="col-sm-3 col-form-label" for="staticEmail">부서 이름</label>
		  <div class="col-sm-8">
			  <input class="form-control admindefault" id="dept_name" name="dept_name" type="text"/>
			  <div class="mb-3 row"></div>
		  </div>
		  <label class="col-sm-3 col-form-label" for="inputPassword">부서장</label>
		  	<div class="col-sm-8">
		    	<input class="form-control admindefault" id="manager" name="manager" type="text" />
		    	<div class="mb-3 row"></div>
		 	</div>
		   <label class="col-sm-3 col-form-label" for="inputPassword">상위 부서</label>
		  	<div class="col-sm-8">
		    	<input class="form-control admindefault" id="upper_dept" name="upper_dept" type="text" />
		    	<div class="mb-3 row"></div>
		 	</div>
		 	 <label class="col-sm-3 col-form-label" for="inputPassword">부서 등급</label>
		  	<div class="col-sm-8">
		    	<input class="form-control admindefault" id="dept_level" name="dept_level" type="text" />
		 	</div>
		</div>
      </div>
      <div class="modal-footer admindefault">
        <button type="button" class="btn btn-primary">수정</button>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>

<!-- Modal -->
<div class="modal fade" id="staticBackdrop3" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel3" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header admindefault">
        <h5 class="modal-title fs-5 admindefault" id="staticBackdropLabel3">부서 삭제</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body admindefault">
       <div class="mb-3 row">
		  <label class="col-sm-3 col-form-label" for="staticEmail">부서 이름</label>
		  <div class="col-sm-8">
		  	   <select class="form-select admindefault">
	      	<option value="">선택하세요</option>
	      </select>
		  </div>
		</div>
      </div>
      <div class="modal-footer admindefault">
        <button type="button" class="btn btn-primary">삭제</button>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>