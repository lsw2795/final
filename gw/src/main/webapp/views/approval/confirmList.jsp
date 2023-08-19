<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../inc/top.jsp" %>
<script type="text/javascript">
	function pageFunc(curPage){
		$('input[name="currentPage"]').val(curPage);
		$('form[name="frmSearch"]').submit();
	}
	
	function search(num){
		$('input[name="currentPage"]').val('1');
		if(num==1){
			$('form[name="frmSearch"]').prop('action',"<c:url value='/approval/confirm/confirmList'/>");
		}
		$('form[name="frmSearch"]').submit();
	}
	
	function approvalDetail(no,state,a){
		$.ajax({
	    	url:"<c:url value='/approval/updateStateAjax'/>",
	   		type:"post",
	   		dataType:"text",
	   		data:{
	   			confirmDocumentNo:no,
	   			confirmState:state
	   		},
	   		success:function(res){
	   			$(a).parent().parent().find('.state').text(res);
	    	},error:function(xhr, status, error){
	    		alert(status+" : "+error);
	   		}
	   	});
		window.open("<c:url value='/approval/approvalDetail?confirmDocumentNo="+no+"'/>","_blank","width=780, height=660");
	}
	
</script>
<div class="container p-0">
	<div class="col-12-lg pe-lg-2 mb-3">
		<div class="card h-lg-100 overflow-hidden">
			<div class="card-header bg-light">
				<div class="row g-3">
					<div class="col-md-10 listTitle">
					<c:if test="${title==0 }">
						결재 문서함
					</c:if>
					<c:if test="${title==1 }">
						결재 대기함
					</c:if>
					</div>
					<div class="col-md-2" align="right">
						<button class="form-control btn btn-primary" onclick="search(${title})">검색</button>
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
							<option value="0">선택하세요</option>
					    	<c:if test="${!empty formList }">
					    		<c:forEach var="formVo" items="${formList }">
							    	<option value="${formVo.documentNo }" 
							    		<c:if test="${formVo.documentNo==confirmVO.documentNo }">
							    		selected="selected"
							    		</c:if>
							    	>${formVo.formName }</option>
					    		</c:forEach>
					    	</c:if>
						</select>
					</div>
					<div class="col-md-3">
					    <label class="form-label" for="confirmState">결재상태</label>
					    <select class="form-select" name="confirmState" id="confirmState">
							<option value="0">선택하세요</option>
						    <c:if test="${!empty stateList }">
					    		<c:forEach var="stateVo" items="${stateList }">
							    	<option value="${stateVo.stateNo}" 
							    		<c:if test="${stateVo.stateNo==confirmVO.confirmState }">
							    		selected="selected"
							    		</c:if>
							    	>${stateVo.state }</option>
					    		</c:forEach>
					    	</c:if>
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
								<a style="color: black;" onclick="approvalDetail('${map['CONFIRM_DOCUMENT_NO']}','${map['CONFIRM_STATE'] }',this)" href="#">
							        ${map['CONFIRM_DOCUMENT_NO']}
								</a>
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
							            	<img class="rounded-circle" src="<c:url value='/images/IMG_5487.jpg'/>" alt="" />
							            </div>
							            <div class="ms-2">${map['NAME']}</div>
							        </div>
							    </td>
							    <td class="text-nowrap" align="left">${map['CONFIRM_TITLE']}</td>
							    <td>
							    	<c:if test="${map['STATE']=='반려' }">
							        	<span class="badge badge rounded-pill d-block p-2 badge-subtle-warning">
							        		<b class="state">${map['STATE']}</b><span class="ms-1 fas fa-ban" data-fa-transform="shrink-2"></span>
							        	</span>
							        </c:if> 
							        <c:if test="${map['STATE']=='완료' }">
							        	<span class="badge badge rounded-pill d-block p-2 badge-subtle-success">
								        	<b class="state">${map['STATE']}</b><span class="ms-1 fas fa-check" data-fa-transform="shrink-2"></span>
									    </span>
							        </c:if>
							        <c:if test="${map['STATE']!='완료' and map['STATE']!='반려' }">
							        	<span class="badge badge rounded-pill d-block p-2 badge-subtle-primary">
							        		<b class="state">${map['STATE']}</b><span class="ms-1 fas fa-user" data-fa-transform="shrink-2"></span>
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