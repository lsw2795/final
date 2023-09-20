<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file='../../inc/adminTop.jsp'%>
<link rel="stylesheet" href="<c:url value='/css/adminempform.css'/>">
<!DOCTYPE html>
<!-- 관리자 - 동호회비 목록
	-clubController
--> 
<div class="row gx-3">
   <div class="card admindefault" id="ticketsTable" data-list='{"valueNames":["client","subject","status","priority","agent"],"page":11,"pagination":true,"fallback":"tickets-table-fallback"}'>
     <div class="card-header admindefault border-bottom border-200 px-0">
		<div class="d-lg-flex justify-content-between">
            <div class="row flex-between-center gy-2 px-x1">
	              <div class="col-auto pe-0">
	                <h6 class="mb-0" style="color: black;">가입 및 개설 현황</h6>
	              </div>
	              <div class="col-auto pe-0">
	           			<form name="adminClubList" action='<c:url value='/admin/adminclub/adminPayment'/>' method="post">
	                  		<select name="searchCondition" class="form-select form-select-sm" aria-label="Bulk actions">
			                     <option value="manager"
			                     	<c:if test="${param.searchCondition=='manager'}">
			                     		selected = "selected"
			                     	</c:if>
			                     >동호회장</option>
			                     <option value="title"
			               		        <c:if test="${param.searchCondition=='title'}">
			                     		selected = "selected"
			                     	</c:if>
			                     >동호회명</option>
			                     <option value="name"
			                     	<c:if test="${param.searchCondition=='name'}">
			                     		selected = "selected"
			                     	</c:if>
			                     >가입자</option>
	                  		</select>
	                </div>
	              <div class="col-auto">
	                  <div class="input-group input-search-width">
	                    <input class="form-control form-control-sm shadow-none search" name="searchKeyword" type="search" placeholder="Search  by name" aria-label="search" />
	                    <button class="btn btn-sm btn-outline-secondary border-300 hover-border-secondary"><span class="fa fa-search fs--1"></span></button>
	                  </div>
	              </div>
          		</form>
        	</div>
       	 <div class="border-bottom border-200 my-3"></div>
         <button class="btn btn-sm btn-falcon-default d-xl-none" type="button" data-bs-toggle="offcanvas" data-bs-target="#ticketOffcanvas" aria-controls="ticketOffcanvas"><span class="fas fa-filter" data-fa-transform="shrink-4 down-1"></span><span class="ms-1 d-none d-sm-inline-block">Filter</span></button>
         <div class="bg-300 mx-3 d-none d-lg-block d-xl-none" style="width:1px; height:29px"></div>
         <div class="d-flex align-items-center" id="table-ticket-replace-element"></div>
    	</div>
  	</div>
		<div class="card-body p-0">
			<div class="table-responsive scrollbar">
			  <table class="table table-hover overflow-hidden">
			    <thead>
			      <tr>
			        <th scope="col">동호회장</th>
			        <th scope="col">동호회명</th>
			        <th scope="col">가입자</th>
			        <th scope="col">부서</th>
			        <th scope="col">가입일</th>
			        <th scope="col">결제확인</th>
			      </tr>
			    </thead>
			    <tbody>
			    <c:forEach var="map" items="${list }">
			      <tr class="align-middle">
			        <td class="text-nowrap">${map['MANAGER']}</td>
			        <td class="text-nowrap">${map['TITLE']}</td>
			        <td class="text-nowrap">
			          <div class="d-flex align-items-center">
			            <div class="avatar avatar-xl">
			              <div class="avatar-name rounded-circle">
				             <img src="<c:url value='/images/${map["IMAGE"]}'/>" class="avatar-name rounded-circle">
				          </div>
			            </div>
			            <div class="ms-2">${map['NAME'] }</div>
			          </div>
			        </td>
			        <td class="text-nowrap">${map['DEPT_NAME'] }</td>
			        <td class="text-nowrap"><fmt:formatDate value="${map['REGDATE']}" pattern="yyyy-MM-dd"/></td>
			        <td>
			        <c:if test="${!empty map['MERCHANT_NO']}">
			        	<span class="badge badge rounded-pill d-block p-2 badge-subtle-success">가입완료<span class="ms-1 fas fa-check" data-fa-transform="shrink-2"></span></span>
			        </c:if>
			        <c:if test="${empty map['MERCHANT_NO']}">
			        	<span class="badge badge rounded-pill d-block p-2 badge-subtle-warning">개설자<span class="ms-1 fas fa-user" data-fa-transform="shrink-2"></span></span>
			        </c:if>
			        </td>
			      </tr>
			    </c:forEach>
			    </tbody>
			  </table>
			  <div class="text-center d-none" id="tickets-table-fallback">
			      <p class="fw-bold fs-1 mt-3">No club found</p>
			  </div>
		 	</div>
		</div>
      <div class="card-footer">
       <div class="d-flex justify-content-center">
        <button class="btn btn-sm btn-falcon-default me-1" type="button" title="Previous" data-list-pagination="prev"><span class="fas fa-chevron-left"></span></button>
         <ul class="pagination mb-0"></ul>
        <button class="btn btn-sm btn-falcon-default ms-1" type="button" title="Next" data-list-pagination="next"><span class="fas fa-chevron-right"></span></button>
       </div>
  	 </div>
	</div>
</div>
<%@ include file='../../inc/adminBottom.jsp'%>