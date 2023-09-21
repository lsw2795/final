<!-- 사용자 결재문서함 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file = "../inc/top.jsp" %>
<script src="<c:url value='/js/approval.js'/>"></script>
<div class="container p-0">
	<div class="col-12-lg pe-lg-2 mb-3">
		<div class="card h-lg-100 overflow-hidden">
			<div class="card-header bg-light">
				<div class="row g-3">
					<div class="col-md-10 listTitle">
						<c:if test="${title==0 }">
							나의 문서함
						</c:if>
						<c:if test="${title==1 }">
							결재 대기함
						</c:if>
						<c:if test="${title==2 }">
							합의 문서함
						</c:if>
						<c:if test="${title==3 }">
							결재 완료함
						</c:if>
						<c:if test="${title==4}">
							결재 문서 참조함
						</c:if>
						<c:if test="${title==5 }">
							반려함
						</c:if>
					</div>
					<div class="col-md-2" align="right">
						<button class="form-control btn btn-primary" onclick="search(${title})">검색</button>
					</div>
				</div>
			</div>
			<div class="card-body">
				<form class="row g-3" method="post" name="frmSearch" action="<c:url value='/approval/confirmList'/>" >
					<input type="hidden" name="currentPage" value="">
					<div class="col-md-4">
						<label class="form-label" for="confirmDocumentNo">문서번호</label>
					    <input class="form-control" name="confirmDocumentNo" id="ConfirmDocumentNo" type="text" value="${confirmVO.confirmDocumentNo }" />
					</div>
					<div class="col-md-4">
					    <label class="form-label" for="createDate">작성일</label>
					    <input class="form-control" name="createDate" id="createDate" type="date" value="${confirmVO.createDate }" />
					</div>
					<div class="col-md-4">
					    <label class="form-label" for="documentNo">문서종류</label>
					    <select class="form-select" name="documentNo" >
							<option value="0">선택하세요</option>
					    	<c:if test="${!empty formList }">
					    		<c:forEach var="formVo" items="${formList }">
							    	<option value="${formVo.documentNo }" 
							    		<c:if test="${formVo.documentNo==confirmVO.documentNo }">
							    		selected="selected"
							    		</c:if>
							    	>
								    	<c:if test="${formVo.formDelFlag=='N' }">
								    		${formVo.formName }
								    	</c:if>
								    	<c:if test="${formVo.formDelFlag=='Y' }">
								    		(삭제된 양식)${formVo.formName }
								    	</c:if>
							    	</option>
					    		</c:forEach>
					    	</c:if>
						</select>
					</div>
					<c:if test="${title==0 or title==5 }">
						<div class="col-md-8">
						    <label class="form-label" for="confirmTitle">제목</label>
						    <input class="form-control" name="confirmTitle" id="confirmTitle" type="text" value="${confirmVO.confirmTitle}"/>
						</div>
					</c:if>
					<c:if test="${title!=0 and title!=5 }">
						<div class="col-md-4">
						    <label class="form-label" for="confirmTitle">제목</label>
						    <input class="form-control" name="confirmTitle" id="confirmTitle" type="text" value="${confirmVO.confirmTitle}"/>
						</div>
						<div class="col-md-4">
						    <label class="form-label" for="empName">기안자</label>
						    <input class="form-control" name="searchKeyword" id="searchKeyword" type="text" value="${confirmVO.searchKeyword}"/>
						</div>
					</c:if>
					<div class="col-md-4">
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
	<form name="frmList" method="post" action="<c:url value='/approval/deleteConfirm'/>" >
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
												<a onclick="approvalDetail('${map['CONFIRM_DOCUMENT_NO']}','${map['CONFIRM_STATE'] }',this,'${title }')"
													style="color: black;" href="#">
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
										            	<img class="rounded-circle" src="<c:url value='/images/${map["IMAGE"]}'/>" alt="" />
										            </div>
										            <div class="ms-2">${map['NAME']}</div>
										        </div>
										    </td>
										    <td class="text-nowrap" align="left">
											    <c:if test="${map['CONFIRM_TITLE'].length()>20 }">
												 	${fn:substring(map['CONFIRM_TITLE'],0,20) }...
												</c:if>
												<c:if test="${map['CONFIRM_TITLE'].length()<=20 }">
						                    		${map['CONFIRM_TITLE']}
												</c:if>
										    </td>
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
	   			<c:if test="${title==6 }">
		   			<button class="btn btn-sm btn-falcon-default text-primary" type="button" id="deleteConfirm">삭제</button>
	   			</c:if>
			</div>
		</div>
	</form>
</div>
<%@ include file = "../inc/bottom.jsp" %>