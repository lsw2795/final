<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../../inc/adminTop.jsp" %>
<script type="text/javascript">
	$(function(){
		$('#formInsert').click(function(){
			$.ajax({
		    	url:"<c:url value='/document/formInsertAjax'/>",
		   		type:"post",
		   		dataType:"text",
		   		data:$('form[name=frmFormInsert]').serializeArray(),
		   		success:function(res){
			   		alert(res);
			   		location.reload();
		    	},error:function(xhr, status, error){
		    		alert(status+" : "+error);
		   		}
		   	});
		});
		
	
	});
		function pageFunc(curPage){
			$('input[name="currentPage"]').val(curPage);
			$('form[name="frmSearch"]').submit();
		}
</script>
<div class="container">
	<div class="row g-0">
		<div class="col-lg-6 pe-lg-2 mb-3">
			<div class="card h-lg-100 overflow-hidden">
				<div class="card-header bg-light">
					<div class="row align-items-center">
                    	<div class="col">
                      		<h6 class="mb-0">전체 문서 양식</h6>
                    	</div>
                    	<div class="col-auto text-center pe-x1">
				        	<button class="form-control btn btn-primary" id="formDelete">삭제하기</button>
				        </div>
                	</div>
				</div>
            	<div class="card-body table-responsive scrollbar">
					<div class="table-responsive scrollbar" id="tableDiv">
						<table class="table table-hover table-striped overflow-hidden m-0" style="width: 100%">
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
							    			<td>${vo.formName }</td>
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
	                </div>
                </div>
                <div class="card-footer bg-light p-2" align="center">
	                <form name="frmSearch" action="<c:url value='/document/formList'/>" >
						<input type="hidden" name="currentPage" value="">
					</form>
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
        <div class="col-lg-6 ps-lg-2 mb-3">
        	<div class="row g-0">
        		<div class="col-lg-12 pe-lg-2 mb-4">
	        		<form name="frmFormInsert" action="<c:url value='document/formInsert'/>">
						<div class="card h-lg-100 overflow-hidden">
							<div class="card-header bg-light">
								<div class="row align-items-center">
			                    	<div class="col">
			                      		<h6 class="mb-0">문서 양식 추가</h6>
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
				                    	<input class="form-control" name="formName" id="formName" type="text" placeholder="양식명을 입력하세요" />
				                    </div>
									<div class="col-6 mb-3">
										<label class="form-label" for="securityLevel">
				               				보안등급
				                    	</label>
				                    	<select class="form-select" name="securityLevel" >
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
				                    	<select class="form-select" name="deadline" >
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
					<form action="">
						<div class="card h-lg-100 overflow-hidden">
							<div class="card-header bg-light">
								<div class="row align-items-center">
			                    	<div class="col">
			                      		<h6 class="mb-0">문서 양식 수정</h6>
			                    	</div>
			                    	<div class="col-auto text-center pe-x1">
				                      	<button class="form-control btn btn-primary" id="formEdit">수정하기</button>
				                    </div>
			                	</div>
							</div>
							<div class="card-body p-3">
								<div class="row gx-2">
									<div class="col-12 mb-3">
				                  		<label class="form-label" for="formName">
				               				양식명
				                    	</label>
				                    	<input class="form-control" name="formName" id="formName" type="text" placeholder="양식명을 입력하세요" />
				                    </div>
									<div class="col-6 mb-3">
										<label class="form-label" for="securityLevel">
				               				보안등급
				                    	</label>
				                    	<select class="form-select" name="securityLevel" >
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
				                    	<select class="form-select" name="deadline" >
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