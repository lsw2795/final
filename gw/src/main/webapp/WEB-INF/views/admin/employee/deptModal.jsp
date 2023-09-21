<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 
관리자뷰 - employeeList.jsp에 include지시자를 사용한 모달창 모음
작성자 : 송영은
작성일 : 2023.09
 -->     
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="<c:url value='/js/jquery-3.7.0.min.js'/>"></script>
<!-- Modal -->
<div class="modal fade" id="staticBackdrop1" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel1" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header admindefault">
        <h5 class="modal-title fs-2 admindefault" id="staticBackdropLabel1">부서 추가</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <form id="insertDept">
      <div class="modal-body admindefault">
        <div class="mb-3 row">
		  <label class="col-sm-3 col-form-label" for="name1">부서 이름</label>
		  <div class="col-sm-8">
			  <input class="form-control admindefault" id="name1" name="name" type="text"/>
			  <div id="checkNameDiv"></div>
			  <div class="mb-3 row" id="checkDept1"></div>
		  </div>
		  <label class="col-sm-3 col-form-label" for="manager1">부서장</label>
		  	<div class="col-sm-8">
		    	<select class="form-select admindefault" id="manager1" name="manager">
			      	<option value="">선택하세요</option>
		      		<c:forEach var="managerMap" items="${managerList}">
						<option value="${managerMap['EMP_NO']}">${managerMap['NAME']}</option>
					</c:forEach>
			    </select>
		    	<div class="mb-3 row"></div>
		 	</div>
		   <label class="col-sm-3 col-form-label" for="upper_dept1">상위 부서</label>
		  	<div class="col-sm-8">
		  		<select class="form-select admindefault" id="upper_dept1" name="upperDept">
			      	<option value="0">없음</option>
		      		<c:forEach var="deptVo2" items="${deptList2}">
						<option value="${deptVo2.deptNo}">${deptVo2.name}</option>
					</c:forEach>
			    </select>
		    	<div class="mb-3 row"></div>
		 	</div>
		 	 <label class="col-sm-3 col-form-label" for="dept_level1">부서 등급</label>
		  	<div class="col-sm-8">
		    	<input class="form-control admindefault" id="dept_level1" name="deptLevel" type="text" />
		 	</div>
		</div>
      </div>
      </form>
      <div class="modal-footer admindefault">
        <button type="button" id="btnDeptWrite" class="btn btn-primary">등록</button>
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
        <h5 class="modal-title fs-2 admindefault" id="staticBackdropLabel2">부서 수정</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body admindefault">
        <div class="mb-3 row">
          <div class="col-md-5">
	      <select class="form-select admindefault" id="name2">
	      	<option value="">선택하세요</option>
	      	<c:forEach var="deptAllVo" items="${deptList}">
	      	<option value="${deptAllVo.deptVo.deptNo }">
	      	${deptAllVo.deptVo.name }</option>
	      	</c:forEach>
	      </select>
	      </div>
	       <div class="mb-3 row"></div>
		  <label class="col-sm-3 col-form-label" for="newname2">부서 이름</label>
		  <div class="col-sm-8">
		 	  <div id="deptNameDiv"></div>
			  <div class="mb-3 row"></div>
		  </div>
		  <label class="col-sm-3 col-form-label" for="manager2">부서장</label>
		  	<div class="col-sm-8">
		  		<div id="managerDiv"></div>
		    	<div class="mb-3 row"></div>
		 	</div>
		   <label class="col-sm-3 col-form-label" for="upper_dept2">상위 부서</label>
		  	<div class="col-sm-8">
		    	<div id="upperDeptDiv"></div>
		    	<div class="mb-3 row"></div>
		 	</div>
		 	 <label class="col-sm-3 col-form-label" for="dept_level2">부서 등급</label>
		  	<div class="col-sm-8">
		    	<div id="deptLevelDiv"></div>
		 	</div>
		</div>
      </div>
      <div class="modal-footer admindefault">
        <button type="button" id="btnDeptEdit" class="btn btn-primary">수정</button>
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
        <h5 class="modal-title fs-2 admindefault" id="staticBackdropLabel3">부서 삭제</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body admindefault">
       <div class="mb-3 row">
		  <label class="col-sm-3 col-form-label" for="staticEmail">부서 이름</label>
		  <div class="col-sm-8">
		  	<select class="form-select admindefault" id="name3">
	      	<option value="">선택하세요</option>
      		<c:forEach var="deptAllVo" items="${deptList}">
	      	<option value="${deptAllVo.deptVo.deptNo }">
	      	${deptAllVo.deptVo.name }</option>
	      	</c:forEach>
	      </select>
		  </div>
		</div>
      </div>
      <div class="modal-footer admindefault">
        <button type="button" id="btnDeptDelete" class="btn btn-primary">삭제</button>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>
