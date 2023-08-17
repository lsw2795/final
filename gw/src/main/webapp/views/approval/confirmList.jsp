<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../inc/top.jsp" %>
<div class="container p-0">
	<div class="row g-0">
		<div class="col-12-lg pe-lg-2 mb-3">
			<div class="card h-lg-100 overflow-hidden">
				<div class="card-header bg-light">
				결재 문서함
				</div>
				<div class="card-body">
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
					      	<th width="10%" scope="col">문서종류</th>
					        <th width="10%" scope="col">작성일</th>
					        <th width="15%" scope="col">기안자</th>
					        <th width="35%" scope="col">제목</th>
					        <th width="10%" scope="col">결재상태</th>
					      </tr>
					    </thead>
					    <tbody>
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
			</div>
		</div>
	</div>
</div>
<%@ include file = "../inc/bottom.jsp" %>