<!-- 관리자 문서양식 관리 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../../inc/adminTop.jsp" %>
<script src="<c:url value='/js/formList.js'/>"></script>
<style>
	.admin-card {
    	background: white;
    	color: black;
	}
	
	a.btn {
   		background: white;
	}
</style>
<div class="container p-0">
	<div class="row g-0">
		<div class="col-lg-7 pe-lg-2 mb-3">
			<div class="card admin-card h-lg-100 overflow-hidden">
                <form name="frmSearch" method="post" action="<c:url value='/document/formList'/>" >
					<input type="hidden" name="currentPage" value="${pagingInfo.currentPage }">
					<div class="card-header bg-light">
						<div class="row align-items-center">
	                    	<div class="col pl-2">
	                      		전체 양식
	                    	</div>
		                    <div class="col-auto text-center p-1">
		                    	<select class="form-select" name="searchCondition">
		                    		<option value="form_name"
		                    			<c:if test="${param.searchCondition=='form_name' }">
		                    			selected='selected'
		                    			</c:if>
		                    		>문서종류</option>
		                    		<option value="deadline"
		                    			<c:if test="${param.searchCondition=='deadline' }">
		                    			selected='selected'
		                    			</c:if>	
		                    		>보존기한</option>
		                    		<option value="security_level"
		                    			<c:if test="${param.searchCondition=='security_level' }">
		                    			selected='selected'
		                    			</c:if>
		                    		>보안등급</option>
		                    	</select>
						    </div>
		                    <div class="col-auto text-center p-0">
		                    	<input class="form-control m-0" type="text" name="searchKeyword" value="${param.searchKeyword}" style="width: 80px;">
						    </div>
	                    	<div class="col-auto text-center p-1">
					        	<button class="form-control btn btn-primary" id="search" style="width: 80px">검색</button>
					        	<button class="form-control btn btn-primary" type="button" id="formDelete" style="width: 80px">삭제</button>
					        </div>
	                	</div>
					</div>
				</form>
            	<div class="card-body table-responsive scrollbar">
					<div class="table-responsive scrollbar" id="tableDiv">
						<form name="frmTable" method="post" action="<c:url value='/document/formDelete'/>">
							<table class="table table-hover overflow-hidden m-0" style="width: 100%">
								<thead>
							    	<tr class="align-middle" align="center">
									    <th width="5%" scope="col">
									      	<input type="checkbox" name="allCheck">
									    </th>
								      	<th width="35%" scope="col">문서종류</th>
								        <th width="30%" scope="col">보존기한</th>
								        <th width="30%" scope="col">보안등급</th>
							      	</tr>
							    </thead>
							    <tbody>
							    	<c:if test="${empty formList }">
										<tr align="center">
											<td colspan="4">문서 양식이 없습니다.</td>
										</tr>						    	
							    	</c:if>
							    	<c:if test="${!empty formList }">
								    	<c:forEach var="vo" items="${formList }">
								    		<tr align="center">
								    			<td>
								    				<input type="checkbox" name="delFormNo" value="${vo.documentNo }">
								    			</td>
								    			<td>
									    			<a href="#" onclick="editSet('${vo.documentNo }')" style="color: #5e6e82">
									    				${vo.formName }
									    			</a>
								    			</td>
								    			<td>${vo.deadline}년</td>
								    			<td>
									    			<c:if test="${vo.securityLevel<=2}">
										    			<span class="badge badge rounded-pill d-block p-2 badge-subtle-warning">
										    				${vo.securityLevel}등급
										    			</span>
									    			</c:if>
									    			<c:if test="${vo.securityLevel>2}">
										    			<span class="badge badge rounded-pill d-block p-2 badge-subtle-success">
										    				${vo.securityLevel}등급
										    			</span>
									    			</c:if>
								    			</td>
								    		</tr>
								    	</c:forEach>
							    	</c:if>
							    </tbody>
							</table>
						</form>
	                </div>
                </div>
                <div class="card-footer bg-light p-2" align="center">
					<c:if test="${pagingInfo.firstPage>1 }">
		     			<button class="btn btn-falcon-default btn-sm me-2" onclick="pageFunc(${pagingInfo.firstPage-1})" type="button" data-bs-toggle="tooltip" data-bs-placement="top" title="Prev">
		     				<span class="fas fa-chevron-left"></span>
		     			</button>
		     		</c:if>
		     		
		     		<c:forEach var="i" begin="${pagingInfo.firstPage }" end="${pagingInfo.lastPage }">
		     			<c:if test="${i == pagingInfo.currentPage }">
			     			<a class="btn btn-sm btn-falcon-default text-primary me-2" href="#!">${i }</a>
		     			</c:if>
		     			<c:if test="${i != pagingInfo.currentPage }">
			     			<a class="btn btn-sm btn-falcon-default me-2" onclick="pageFunc(${i})" href="#!">${i }</a>
		     			</c:if>
		     		</c:forEach>
		     		
		     		<c:if test="${pagingInfo.lastPage < pagingInfo.totalPage }">
		     			<button class="btn btn-falcon-default btn-sm" onclick="pageFunc(${pagingInfo.lastPage+1})" type="button" data-bs-toggle="tooltip" data-bs-placement="top" title="Next">
		     				<span class="fas fa-chevron-right"></span>
		     			</button>
		     		</c:if>
            	</div>
			</div>
		</div>
        <div class="col-lg-5 ps-lg-2 mb-3">
        	<div class="row g-0">
        		<div class="col-lg-12 pe-lg-2 mb-4">
	        		<form name="frmFormInsert" method="post" action="<c:url value='/document/formInsert'/>">
						<div class="card admin-card h-lg-100 overflow-hidden">
							<div class="card-header bg-light">
								<div class="row align-items-center">
			                    	<div class="col">
			                      		문서 양식 추가
			                    	</div>
			                    	<div class="col-auto text-center pe-x1">
				                      	<button class="form-control btn btn-primary" type="button" id="formInsert">추가하기</button>
				                    </div>
			                	</div>
							</div>
							<div class="card-body p-3">
								<div class="row gx-2">
									<div class="col-12 mb-3">
				                  		<label class="form-label" for="formName">
				               				양식명
				                    	</label>
				                    	<input class="form-control" name="formName" id="formName" type="text" placeholder="양식명을 입력하세요"/>
				                    </div>
									<div class="col-6 mb-3">
										<label class="form-label" for="securityLevel">
				               				보안등급
				                    	</label>
				                    	<select class="form-select" name="securityLevel" id="securityLevel" >
											<option value="0">선택하세요</option>
											<option value="1">매우높음</option>
											<option value="2">높음</option>
											<option value="3">보통</option>
											<option value="4">낮음</option>
										</select>
									</div>
									<div class="col-6 mb-3">
										<label class="form-label" for="deadline">
				               				보존기한
				                    	</label>
				                    	<select class="form-select" name="deadline" id="deadline" >
											<option value="0">선택하세요</option>
											<option value="1">1년</option>
											<option value="2">2년</option>
											<option value="3">3년</option>
										</select>
									</div>
								</div>
	                		</div>
						</div>
					</form>
				</div>
				<div class="col-lg-12 pe-lg-2 mt-2">
					<form name="frmFormEdit" action="<c:url value='/document/formEdit'/>">
						<div class="card admin-card h-lg-100 overflow-hidden">
							<div class="card-header bg-light">
								<div class="row align-items-center">
			                    	<div class="col">
			                      		문서 양식 수정
			                    	</div>
			                    	<div class="col-auto text-center pe-x1">
				                      	<button class="form-control btn btn-primary" type="button" id="btDisabled" style="width: 80px">수정</button>
				                      	<button class="form-control btn btn-primary" type="button" id="formEdit" style="width: 80px">확인</button>
				                    </div>
			                	</div>
							</div>
							<div class="card-body p-3">
								<div class="row gx-2">
									<div class="col-12 mb-3">
				                  		<label class="form-label" for="formName">
				               				양식명
				                    	</label>
				                    	<input class="form-control" name="formName" id="editFormName" type="text" placeholder="수정할 문서를 선택하세요" disabled="disabled" />
				                    	<input class="form-control" name="documentNo" id="editDocumentNo" type="hidden" />
				                    </div>
									<div class="col-6 mb-3">
										<label class="form-label" for="securityLevel">
				               				보안등급
				                    	</label>
				                    	<select class="form-select" name="securityLevel" id="editSecurityLevel" disabled="disabled">
											<option value="0">선택하세요</option>
											<option value="1">매우높음</option>
											<option value="2">높음</option>
											<option value="3">보통</option>
											<option value="4">낮음</option>
										</select>
									</div>
									<div class="col-6 mb-3">
										<label class="form-label" for="deadline">
				               				보존기한
				                    	</label>
				                    	<select class="form-select" name="deadline" id="editDeadline" disabled="disabled">
											<option value="0">선택하세요</option>
											<option value="1">1년</option>
											<option value="2">2년</option>
											<option value="3">3년</option>
										</select>
									</div>
								</div>
	                		</div>
						</div>
					</form>
				</div>
        	</div>  
        </div>
	</div>
</div>
<%@ include file = "../../inc/adminBottom.jsp" %>