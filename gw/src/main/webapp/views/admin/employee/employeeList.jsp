<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file='../../inc/adminTop.jsp'%>
<link rel="stylesheet" href="<c:url value='/css/adminempform.css'/>">
<script type="text/javascript">	
	$(function(){
		
		$('#btnDeptWrite').click(function(){
			var checkModal1=false;
	         if($('#dept_name1').val().length<1){
	            alert("부서이름을 입력하세요.");
	            $('#dept_name1').focus();
	            return false;
	         }
	         
	         if($('#manager1').val().length<1){
		            alert("부서장을 선택하세요.");
		            $('#manager1').focus();
		            return false;
		         }
	         
	         if($('#upper_dept1').val().length<1){
	            alert("상위 부서를 입력하세요.");
	            $('#upper_dept1').focus();
	            return false;
	         }
	         
	         if($('#dept_level1').val().length<1){
	            alert("부서 등급을 입력하세요.");
	            $('#dept_level1').focus();
	            return false;
	         }
	         
	         if (!validate_hp($('#upper_dept1').val())
	        		 || !validate_hp($('#dept_level1').val())) {
	            alert("상위 부서와 부서등급은 숫자만 입력 가능합니다.");
	            
	            if(!validate_hp($('#upper_dept1').val()){
	            	$('#upper_dept1').focus();
	            }else if(!validate_hp($('#dept_level1').val())){
	            	$('#dept_level1').focus();
	            }
	            return false;
	         }
	         checkModal1=true;
	         
	         if(checkModal1){
		         $.ajax({
		            url : "<c:url value='/admin/employee/ajaxDeptInsert'/>",
		            type:"post",
		            dataType : "text",
		            data:$('#insertDept').serializeArray(),
		            success: function(res){
		            	if(res>0){
			            	alert($('#dept_name1').val()+" 부서 생성이 완료되었습니다.");
			            	$('#staticBackdrop1').modal('hide'); 
	                   		location.href="<c:url value='/admin/employee/employeeList'/>";
		            	}
		            },
		            error:function(xhr, status, error){
		               alert(status+" : "+error);
		            }
		         });//ajax
	         }
		});
		
		$('#btnDeptEdit').click(function(){
			var checkModal2=false;
			if($('#dept_name2').val().length<1){
	            alert("수정할 부서이름을 선택하세요.");
	            $('#dept_name2').focus();
	            return false;
	         }
			
			if($('#newDept_name2').val().length<1){
	            alert("수정할 부서이름을 입력하세요.");
	            $('#newDept_name2').focus();
	            return false;
	         }
	         
	         if($('#manager2').val().length<1){
		            alert("부서장을 선택하세요.");
		            $('#manager2').focus();
		            return false;
		         }
	         
	         if($('#upper_dept2').val().length<1){
	            alert("상위 부서를 입력하세요.");
	            $('#upper_dept2').focus();
	            return false;
	         }
	         
	         if($('#dept_level2').val().length<1){
	            alert("부서 등급을 입력하세요.");
	            $('#dept_level2').focus();
	            return false;
	         }
	         
	         if (!validate_hp($('#upper_dept2').val())
	        		 || !validate_hp($('#dept_level2').val())) {
	            alert("상위 부서와 부서등급은 숫자만 입력 가능합니다.");
	            
	            if(!validate_hp($('#upper_dept2').val()){
	            	$('#upper_dept2').focus();
	            }else if(!validate_hp($('#dept_level2').val())){
	            	$('#dept_level2').focus();
	            }
	            return false;
	         }
	         checkModal2=true;
	         if(checkModal2){
		         $.ajax({
		            url : "<c:url value='/admin/employee/ajaxDeptEdit'/>",
		            type:"post",
		            dataType : "text",
		            data:$('#editDept').serializeArray(),
		            success: function(res){
		               
		            },
		            error:function(xhr, status, error){
		               alert(status+" : "+error);
		            }
		         });//ajax
	         }	
		});
		
		$('#btnDeptDelete').click(function(){
			alert('버튼3');
			
		});
		
	});


	function pageFunc(curPage){
		$('input[name="currentPage"]').val(curPage);
		$('form[name="frmPage"]').submit();
	}
	
	function submitForm() {
	    document.getElementById('frmSearch').submit();
	}
	
	function empDetail(empNo) {
	    window.open("<c:url value='/mypage/empDetail?empNo='/>"+empNo,'empDetail', 'width=320,height=550,top=300,left=700,location=yes,resizable=yes');
	}
	
	function messageWrite(empNo) {
	    window.location.href = "<c:url value='/message/messageWrite?empNo='/>"+empNo;
	}
</script>
<!-- 페이징 처리 관련 form -->
<form action="<c:url value='/admin/employee/employeeList'/>" 
	name="frmPage" method="post">
	<input type="hidden" name="currentPage">
	<input type="hidden" name="searchKeyword" value="${param.searchKeyword}">
	<input type="hidden" name="searchCondition" value="${param.searchCondition}">
</form>
<div class="row g-0">
	<div class="col-lg-7 col-xl-8 pe-lg-2 mb-3">
		<div class="card h-lg-100 overflow-hidden">
			<div class="card-header admindefault">
				<h5 class="mb-0 admindefault">
					<span class="fas fa-user" style="margin: 0 10px;"></span>사원목록
				</h5>
			</div>
			<div class="card-body py-2 admindefault">
				<div class="card" id="allContactTable">
					<div class="card-header border-bottom border-200 px-0 admindefault">
						<div class="d-lg-flex justify-content-between">
							<form name="frmSearch" method="post" action="<c:url value='/admin/employee/employeeList'/>">
								<div class="row flex-between-center gy-2 px-x1">
									<div class="col-auto pe-0 admindefault">
										<select name="searchCondition" class="admindefault adminempborder adminempsel">
											<option value="emp_no"
												<c:if test="${param.searchCondition=='emp_no'}">
								            		selected="selected"
								            	</c:if> 
											>사원번호</option>
											<option value="dept_name"
												<c:if test="${param.searchCondition=='dept_name'}">
								            		selected="selected"
								            	</c:if> 
											>부서</option>
											<option value="name"
												<c:if test="${param.searchCondition=='name'}">
								            		selected="selected"
								            	</c:if> 
											>이름</option>
											<option value="position_name"
												<c:if test="${param.searchCondition=='position_name'}">
								            		selected="selected"
								            	</c:if> 
											>직위</option>
										</select>
									</div>
									<div class="col-auto">
										<div class="input-group input-search-width admindefault">
											<input name="searchKeyword" value="${param.searchKeyword }" class="form-control shadow-none search admindefault"
												type="search" placeholder="검색어 입력" aria-label="search" />
											<button onclick="submitForm()"
												class="btn btn-sm btn-outline-secondary border-300 hover-border-secondary">
												<span class="fa fa-search fs--1"></span>
											</button>
										</div>
									</div>
								</div>
							</form>
							<div class="border-bottom border-200 my-3"></div>
							<div class="d-flex align-items-center justify-content-between justify-content-lg-end px-x1 admindefault">
								<div class="d-flex align-items-center admindefault"
									id="table-contact-replace-element">
								<a href="<c:url value='/admin/employee/employeeRegister'/>" class="btn btn-primary">사원 등록</a>
								</div>
							</div>
						</div>
					</div>
						<div class="admindefault searchEmpResult" style="padding: 10px 0 0 25px;">
							<c:if test="${!empty param.searchKeyword }">
							   <p>검색어 :${param.searchKeyword} , <span style="font-weight: bold; color: red;">${pagingInfo.totalRecord}</span> 건 검색되었습니다.</p>
							</c:if>   
						</div>
					<div class="card-body p-0 admindefault">
						<div class="table-responsive scrollbar admindefault">
							<table class="table table-sm table-hover">
								<colgroup>
									<col style="width: 20%;" />
									<col style="width: 15%;" />
									<col style="width: 15%;" />
									<col style="width: 15%;" />
									<col style="width: 17%;" />
									<col style="width: 18%;" />
								</colgroup>
								<thead class="adminempthead">
									<tr style="text-align: center;">
										<th class="py-2 fs-0 pe-2 sort align-middle" scope="col">사원번호</th>
										<th class="sort align-middle" scope="col">사원이름</th>
										<th class="sort align-middle" scope="col">부서</th>
										<th class="sort align-middle" scope="col">직위</th>
										<th class="sort align-middle" scope="col">내선번호</th>
										<th class="sort align-middle" scope="col">입사일</th>
									</tr>
								</thead>
								<tbody id="table-contact-body">
									<c:if test="${empty list }">
										<tr class="adminemptr">
											<td colspan="6" style="text-align: center">
											해당 임직원 목록이 없습니다.
											</td>
										</tr>
									</c:if>
									<c:if test="${!empty list }">
										<c:forEach var="map" items="${list }">
											<tr class="adminemptr">
												<td class="align-middle fs-0 py-3">${map['EMP_NO']}</td>
												<td class="align-middle"><a href="<c:url value='/admin/employee/employeeEdit?empNo=${map["EMP_NO"]}'/>">${map['NAME']}</a></td>
												<td class="align-middle">${map['DEPT_NAME']}</td>
												<td class="align-middle">${map['POSITION_NAME']}</td>
												<td class="align-middle">${map['EXTENSION_NO']}</td>
												<td class="align-middle">
												<fmt:formatDate value="${map['HIREDATE']}" pattern="yyyy-MM-dd"/> 
												</td>
											</tr>
										</c:forEach>
									</c:if>
								</tbody>
							</table>
						</div>
					</div>
					<div class="card-footer d-flex justify-content-center admindefault">
						<div class="divPage" id="divPage">
							<!-- 페이지 번호 추가 -->		
							<!-- 이전 블럭으로 이동 -->
							<c:if test="${pagingInfo.firstPage>1 }">
								<a href="#" id="prevPage" onclick="pageFunc(${pagingInfo.firstPage-1})">
									<img src="<c:url value='/images/first.JPG'/>">
								</a>
							</c:if>	
											
							<!-- [1][2][3][4][5][6][7][8][9][10] -->
							<c:forEach var="i" begin="${pagingInfo.firstPage }" end="${pagingInfo.lastPage }">		
								<c:if test="${i == pagingInfo.currentPage }">		
									<span id="curPage">${i}</span>
						        	</c:if>
								<c:if test="${i != pagingInfo.currentPage }">		
							         <a href="#" id="otherPage" onclick="pageFunc(${i})">${i}</a>
							    </c:if>   		
							</c:forEach>
							
							<!-- 다음 블럭으로 이동 -->
							<c:if test="${pagingInfo.lastPage < pagingInfo.totalPage }">
						         <a href="#" id="nextPage" onclick="pageFunc(${pagingInfo.lastPage+1})">
									<img src="<c:url value='/images/last.JPG'/>">
								</a>
							</c:if>
							<!--  페이지 번호 끝 -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="col-lg-5 col-xl-4 ps-lg-2 mb-3">
		<div class="offcanvas offcanvas-end offcanvas-filter-sidebar h-auto"
			aria-labelledby="allContactOffcanvasLabel">
			<div class="card admindefault">
				<div class="card-header admindefault">
					<h5 class="mb-0 admindefault">
						<span class="fas fa-users" style="margin: 0 10px;"></span>조직도관리
					</h5>
				</div>
				<div class="card-body">
					<div id="organization-chart">
						<c:if test="${empty deptList}">
				            비어있음
				        </c:if>
						<c:if test="${!empty deptList}">
							<c:forEach var="deptAllVo" items="${deptList}">
								<div class="mb-3 adminempdiv10">
									<button class="btn btn-sm btn-primary btnDept" type="button"
			                            data-bs-toggle="collapse" data-bs-target="#dept-${deptAllVo.deptVo.deptNo }"
			                            data-dept-no="${deptAllVo.deptVo.deptNo}">
			                        <span class="fas fa-plus" data-fa-transform="shrink-3"></span>
			                    </button>
			                    <span>${deptAllVo.deptVo.name }</span>
									<div class="collapse" id="dept-${deptAllVo.deptVo.deptNo }">
										<div class="list-group adminempdiv9">
											<c:forEach var="empMap" items="${deptAllVo.empList }">
		                                   		<button class="list-group-item-action adminempbtncss admindefault" onclick="empDetail(${empMap['EMP_NO']});">
		                                   			${empMap['EMP_NO']} ${empMap['NAME']} ${empMap['POSITION_NAME']}
		                                   		</button>
		                                	</c:forEach>
										</div>
									</div>
								</div>
							</c:forEach>
							</c:if>
					</div>
				</div>
				<div class="border-top border-200 py-x1">
					<div
						class="d-flex align-items-center justify-content-between px-x1 admindefault">
						<button class="btn btn-falcon-default btn-sm admindefault"
							type="button" data-bs-toggle="modal" data-bs-target="#staticBackdrop1">
							<span class="fas fa-plus" data-fa-transform="shrink-3"></span><span
								class="d-none d-sm-inline-block d-xl-none d-xxl-inline-block ms-1">부서
								추가</span>
						</button>
						<button class="btn btn-falcon-default btn-sm mx-2 admindefault"
							type="button" data-bs-toggle="modal" data-bs-target="#staticBackdrop2">
							<span class="fas fa-external-link-alt"
								data-fa-transform="shrink-3"></span><span
								class="d-none d-sm-inline-block d-xl-none d-xxl-inline-block ms-1">부서
								수정</span>
						</button>
						<button class="btn btn-falcon-default btn-sm admindefault"
							type="button" data-bs-toggle="modal" data-bs-target="#staticBackdrop3">
							<span class="fas fa-minus" data--transform="shrink-3"></span><span
								class="d-none d-sm-inline-block d-xl-none d-xxl-inline-block ms-1">부서
								삭제</span>
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<%@ include file='deptModal.jsp' %>
<%@ include file='../../inc/adminBottom.jsp'%>