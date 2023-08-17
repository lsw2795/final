<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../inc/top.jsp" %>
<script>

	function pageFunc(curPage){
		$('input[name="currentPage"]').val(curPage);
		$('form[name="frmSearch"]').submit();
	}
	
	function search(){
		$('input[name="currentPage"]').val('1');
		$('form[name="frmSearch"]').submit();
	}
	
	/* $.ajax({
		url:"<c:url value='/approval/confirmSearchAjax'/>",
		type:"post",
		dataType:"json",
		data:$('form[name=frmSearch]').serializeArray(),
		success:function(res){
				alert(res);
				window.close();
		},error:function(xhr, status, error){
			alert(status+" : "+error);
		}
	}); */
</script>
<div class="container p-0">
	<div class="col-12-lg pe-lg-2 mb-3">
		<div class="card h-lg-100 overflow-hidden">
			<div class="card-header bg-light">
				<div class="row g-3">
					<div class="col-md-10">
						결재 문서함
					</div>
					<div class="col-md-2" align="right">
						<button class="form-control btn btn-primary" onclick="search()">검색</button>
					</div>
				</div>
			</div>
			<div class="card-body">
				<form class="row g-3" name="frmSearch" action="<c:url value='/approval/confirmList'/>" >
				<input type="hidden" name="currentPage" value="">
					<div class="col-md-3">
						<label class="form-label" for="confirmDocumentNo">문서번호</label>
					    <input class="form-control" name="confirmDocumentNo" id="ConfirmDocumentNo" type="text" value="${confirmVO.confirmDocumentNo }" />
					</div>
					<div class="col-md-3">
					    <label class="form-label" for="createDate">작성일</label>
					    <input class="form-control" name="createDate" id="createDate" type="date" value="${confirmVO.createDate }" />
					</div>
					<div class="col-md-3">
					    <label class="form-label" for="startDate">시작일</label>
					    <input class="form-control" name="startDate" id="startDate" type="date" value="${confirmVO.startDate}"/>
					</div>
					<div class="col-md-3">
					    <label class="form-label" for="endDate">종료일</label>
					    <input class="form-control" name="endDate" id="endDate" type="date" value="${confirmVO.endDate}"/>
					</div>
					<div class="col-md-6">
					    <label class="form-label" for="confirmTitle">제목</label>
					    <input class="form-control" name="confirmTitle" id="confirmTitle" type="text" value="${confirmVO.confirmTitle}"/>
					</div>
					<div class="col-md-3">
					    <label class="form-label" for="documentNo">문서종류</label>
					    <select class="form-select" name="documentNo" >
					    	<option value="0" selected="selected">Choose...</option>
						    <option>...</option>
						</select>
					</div>
					<div class="col-md-3">
					    <label class="form-label" for="state">결재상태</label>
					    <select class="form-select" name="state" id="state">
						    <option value="0" selected="selected">Choose...</option>
						    <option>...</option>
						</select>
					</div>
				</form>
			</div>
		</div>
	</div>
	<div class="col-12-lg pe-lg-2 mb-3">
		<div class="card h-lg-100 overflow-hidden">
			<div class="card-body table-responsive scrollbar">
				<div class="table-responsive scrollbar">
					<table class="table table-hover table-striped overflow-hidden" style="width: 100%">
						<thead>
					    	<tr class="align-middle" align="center">
						      	<th width="20%" scope="col">문서번호</th>
						      	<th width="15%" scope="col">문서종류</th>
						        <th width="10%" scope="col">작성일</th>
						        <th width="15%" scope="col">기안자</th>
						        <th width="25%" scope="col">제목</th>
						        <th width="15%" scope="col">결재상태</th>
					      	</tr>
					    </thead>
					    <tbody>
					    <c:if test="${empty list }">
					    	<tr>
					    		<td colspan="6" align="center">작성한 결재 문서가 존재하지 않습니다.</td>
					    	</tr>
					    </c:if>
					   	<c:if test="${!empty list }">
					   	<c:forEach var="map" items="${list }">
							<tr class="align-middle" align="center" >
								<td class="text-nowrap">
							        ${map['CONFIRM_DOCUMENT_NO']}
							    </td>
							    <td class="text-nowrap">
							        ${map['FORM_NAME']}
							    </td>
							    <td class="text-nowrap">
							        <fmt:formatDate value="${map['CREATE_DATE']}" pattern="yy-MM-dd"/>
							    </td>
							    <td class="text-nowrap">
							    	<div class="d-flex align-items-center ms-4">
							            <div class="avatar avatar-xl">
							            	<img class="rounded-circle" src="<c:url value='../images/IMG_5487.jpg'/>" alt="" />
							            </div>
							            <div class="ms-2">${map['NAME']}</div>
							        </div>
							    </td>
							    <td class="text-nowrap" align="left">${map['CONFIRM_TITLE']}</td>
							    <td>
							    	<c:if test="${map['CONFIRM_STATE']==0 }">
							        	<span class="badge badge rounded-pill d-block p-2 badge-subtle-primary">
							        		검토대기<span class="ms-1 fas fa-user" data-fa-transform="shrink-2"></span>
							        	</span>
							        </c:if>
							        <c:if test="${map['CONFIRM_STATE']==1 }">
							        	<span class="badge badge rounded-pill d-block p-2 badge-subtle-primary">
							        		확인대기<span class="ms-1 fas fa-user" data-fa-transform="shrink-2"></span>
							        	</span>
							        </c:if>
							        <c:if test="${map['CONFIRM_STATE']==2 }">
							        	<span class="badge badge rounded-pill d-block p-2 badge-subtle-primary">
							        		합의대기<span class="ms-1 fas fa-user" data-fa-transform="shrink-2"></span>
							        	</span>
							        </c:if>
							        <c:if test="${map['CONFIRM_STATE']==3 }">
							        	<span class="badge badge rounded-pill d-block p-2 badge-subtle-primary">
							        		승인대기<span class="ms-1 fas fa-user" data-fa-transform="shrink-2"></span>
							        	</span>
							        </c:if>
							        <c:if test="${map['CONFIRM_STATE']==4 }">
							        	<span class="badge badge rounded-pill d-block p-2 badge-subtle-warning">
							        		반려<span class="ms-1 fas fa-ban" data-fa-transform="shrink-2"></span>
							        	</span>
							        </c:if>
							        <c:if test="${map['CONFIRM_STATE']==5 }">
							        	<span class="badge badge rounded-pill d-block p-2 badge-subtle-success">
								        	완료<span class="ms-1 fas fa-check" data-fa-transform="shrink-2"></span>
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
			<div class="card-footer border-top d-flex justify-content-center">
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
     			<button class="btn btn-falcon-default btn-sm" type="button" data-bs-toggle="tooltip" data-bs-placement="top" title="Next">
     				<span class="fas fa-chevron-right"></span>
     			</button>
     		</c:if>
   			</div>
		</div>
	</div>
</div>
<%@ include file = "../inc/bottom.jsp" %>