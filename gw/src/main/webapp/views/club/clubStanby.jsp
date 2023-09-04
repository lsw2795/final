<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file='../inc/top.jsp'%>
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
        <th scope="col">Name</th>
        <th scope="col">Club Title</th>
        <th scope="col">Date</th>
        <th scope="col">Status</th>
        <th scope="col">Approval</th>
        
      </tr>
    </thead>
    <tbody>
      <tr class="align-middle">
      	<td class="align-middle fs-0 py-3">
	  		<div class="form-check mb-0">
		     <input class="form-check-input" type="checkbox" id="table-view-tickets-0" data-bulk-select-row="data-bulk-select-row" />
			</div>
		</td>
        <td class="text-nowrap">
          <div class="d-flex align-items-center">
            <div class="avatar avatar-xl">
              <div class="avatar-name rounded-circle"><span>HG</span></div>
            </div>
            <div class="ms-2">홍길동</div>
          </div>
        </td>
        <td class="text-nowrap">club2</td>
        <td class="text-nowrap">2023-08-03</td>
        <td><span class="badge badge rounded-pill d-block p-2 badge-subtle-success">Completed<span class="ms-1 fas fa-check" data-fa-transform="shrink-2"></span></span>
        </td>
        <td>
          <button class="btn btn-falcon-primary btn-sm" type="button">승인</button>
        </td>
      </tr>
      
    </tbody>
  </table>
</div>
<%@ include file='../inc/bottom.jsp'%>