<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 
사원뷰 - addressBook.jsp에 include지시자를 사용한 모달창 모음
작성자 : 송영은
작성일 : 2023.09
 -->         
<script type="text/javascript" src="<c:url value='/js/jquery-3.7.0.min.js'/>"></script>
<!-- Modal -->
<div class="modal fade" id="staticBackdrop4" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel4" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title fs-2 " id="staticBackdropLabel4">주소록 추가</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div class="mb-3 row">
		  <label class="col-sm-3 col-form-label" for="addrbookName1">이름</label>
		  <div class="col-sm-8">
			  <input class="form-control " id="addrbookName1" name="addrbookName" type="text"/>
			  <div class="mb-3 row"></div>
		  </div>
		  <label class="col-sm-3 col-form-label" for="addrbookTel">전화번호</label>
		  	<div class="col-sm-8 mypagespan">
		        <input type="text" class="form-control" id="addrbookTel1" style="width: 30%;" maxlength="3"/>
		        <span class="mypagehyphen">-</span>
		        <input type="text" class="form-control" id="addrbookTel2" style="width: 30%;" maxlength="4" />
		        <span class="mypagehyphen">-</span>
		        <input type="text" class="form-control" id="addrbookTel3" style="width: 30%;" maxlength="4" />
		 	</div>
		    	<div class="mb-3 row"></div>
		   <label class="col-sm-3 col-form-label" for="addrbookEmail">이메일</label>
		  	<div class="col-sm-8 mypagespan">
		  		<input type="text" class="form-control" id="addrbookEmail1" style="width: 38%">
				<span class="mypagehyphen">@</span>
				<select class="form-select" id="addrbookEmail2" title="이메일주소 뒷자리" style="width: 55%">
				    <option value="naver.com">naver.com</option>
				    <option value="hanmail.net">hanmail.net</option>
				    <option value="nate.com">nate.com</option>
				    <option value="gmail.com">gmail.com</option>
				    <option value="etc">직접입력</option>
				</select>
			</div>  
			<div class="mb-1"></div>
			<label class="col-sm-3 col-form-label" for="addrbookEmail3"></label>
		  	<div class="col-sm-8">
				<input type="text" id="addrbookEmail3" class="form-control" title="직접입력인 경우 이메일주소 뒷자리" style="visibility: hidden;">
		    	<div class="mb-3 row"></div>
		    </div>	
		 	 <label class="col-sm-3 col-form-label" for="addrbookComname1">회사</label>
		  	<div class="col-sm-8">
		    	<input class="form-control " id="addrbookComname1" name="addrbookComname1" type="text" />
		 		<div class="mb-3 row"></div>
		 	</div>
		 	 <label class="col-sm-3 col-form-label" for="addrbookDept1">부서</label>
		  	<div class="col-sm-8">
		    	<input class="form-control " id="addrbookDept1" name="addrbookDept" type="text" />
		 		<div class="mb-3 row"></div>
		 	</div>
		 	 <label class="col-sm-3 col-form-label" for="addbookRank1">직급</label>
			  <div class="col-sm-8">
			  	 <input class="form-control " id="addrbookRank1" name="addrbookRank" type="text"/>
			  </div>
		   </div>
      	</div>
      	<!-- 나뉜부분 hidden으로 합치기 -->
      	<input class="form-control " id="addrbookTel" name="addrbookTel" type="hidden"/>
      	<input class="form-control " id="addrbookEmail" name="addrbookEmail" type="hidden"/>
      <div class="modal-footer">
        <button type="button" id="btnAddrWrite" class="btn btn-primary">등록</button>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>

<!-- Modal -->
<div class="modal fade" id="staticBackdrop5" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel5" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title fs-2 " id="staticBackdropLabel5">주소록 수정</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div class="mb-3 row">
		  <label class="col-sm-3 col-form-label" for="addrbookName2">이름</label>
		  <div class="col-sm-8">
			  <div id="addrbookNameDiv"></div>
			  <div class="mb-3 row"></div>
		  </div>
		  <label class="col-sm-3 col-form-label" for="addrbookTel">전화번호</label>
			  <div class="col-sm-8 mypagespan" id="addrbookTelDiv"></div>
		      <div class="mb-3 row"></div>
		   <label class="col-sm-3 col-form-label" for="addrbookEmail">이메일</label>
		  	<div class="col-sm-8 mypagespan" id="addrbookEmailDiv"></div>  
			<div class="mb-1"></div>
			<label class="col-sm-3 col-form-label" for="addrbookEmail3"></label>
		  	<div class="col-sm-8" id="addrbookEmailDiv2"></div>	
	    	<div class="mb-3 row"></div>
		 	 <label class="col-sm-3 col-form-label" for="addrbookComname2">회사</label>
		  	<div class="col-sm-8">
		    	<div id="addrbookComnameDiv"></div>
		 		<div class="mb-3 row"></div>
		 	</div>
		 	 <label class="col-sm-3 col-form-label" for="addrbookDept2">부서</label>
		  	<div class="col-sm-8">
		    	<div id="addrbookDeptDiv"></div>
		 		<div class="mb-3 row"></div>
		 	</div>
		 	 <label class="col-sm-3 col-form-label" for="addbookRank2">직급</label>
			  <div class="col-sm-8">
		    	<div id="addrbookRankDiv"></div>
			  </div>
		   </div>
      	</div>
      
      <div class="modal-footer">
        <button type="button" id="btnAddrEdit" class="btn btn-primary">수정</button>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>
