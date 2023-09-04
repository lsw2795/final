<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file='../../inc/adminTop.jsp'%>
<!DOCTYPE html>

<div class="table-responsive scrollbar">
  <table class="table table-hover table-striped overflow-hidden">
    <thead>
      <tr>
      	<th>
      		<div class="check d-flex align-items-center">
                <input class="check-input" id="checkbox-bulk-table-tickets-select" type="checkbox" data-bulk-select='{"body":"table-ticket-body","actions":"table-ticket-actions"' />
            </div>
      	</th>
        <th scope="col">동호회명</th>
        <th scope="col">이름</th>
        <th scope="col">부서</th>
        <th scope="col">가입일</th>
        <th scope="col">결제확인</th>
        
      </tr>
    </thead>
    <tbody>
    <c:forEach var="map" items="${list }">
      <tr class="align-middle">
      	<td class="align-middle fs-0 py-3">
	  		<div class="form-check mb-0">
		     <input class="form-check-input" type="checkbox" id="table-view-tickets-0" data-bulk-select-row="data-bulk-select-row" />
			</div>
		</td>
        <td class="text-nowrap">${map['TITLE']}</td>
        <td class="text-nowrap">
          <div class="d-flex align-items-center">
            <div class="avatar avatar-xl">
              <div class="avatar-name rounded-circle">
	             <img src="<c:url value='/images/${map["IMAGE"]}'/>">
	          </div>
            </div>
            <div class="ms-2">${map['NAME'] }</div>
          </div>
        </td>
        <td class="text-nowrap">${map['DEPT_NAME'] }</td>
        <td class="text-nowrap"><fmt:formatDate value="${map['REGDATE']}" pattern="yyyy-MM-dd"/></td>
        <td>
        	<span class="badge badge rounded-pill d-block p-2 badge-subtle-success">완료<span class="ms-1 fas fa-check" data-fa-transform="shrink-2"></span></span>
        </td>
      </tr>
    </c:forEach>
    </tbody>
  </table>
</div>
<%@ include file='../../inc/adminBottom.jsp'%>