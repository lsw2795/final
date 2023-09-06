<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file='../../inc/adminTop.jsp'%>
<!DOCTYPE html>

<div class="table-responsive scrollbar">
  <table class="table table-hover table-striped overflow-hidden">
    <thead>
      <tr>
        <th scope="col">Name</th>
        <th scope="col">Club Title</th>
        <th scope="col">Date</th>
        <th scope="col">Status</th>
        <th scope="col">Approval</th>
        
      </tr>
    </thead>
    <tbody>
      <tr class="align-middle">
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
          <button class="btn btn-falcon-primary btn-sm" type="button">결제승인</button>
        </td>
      </tr>
      <tr class="align-middle">
        <td class="text-nowrap">
          <div class="d-flex align-items-center">
            <div class="avatar avatar-xl">
              <div class="avatar-name rounded-circle"><span>JC</span></div>
            </div>
            <div class="ms-2">정창모</div>
          </div>
        </td>
        <td class="text-nowrap">club2</td>
       <td class="text-nowrap">2023-08-03</td>
        <td><span class="badge badge rounded-pill d-block p-2 badge-subtle-success">Completed<span class="ms-1 fas fa-check" data-fa-transform="shrink-2"></span></span>
        </td>
        <td>
          <button class="btn btn-falcon-primary btn-sm" type="button">결제승인</button>
        </td>
      </tr>
      <tr class="align-middle">
        <td class="text-nowrap">
          <div class="d-flex align-items-center">
            <div class="avatar avatar-xl">
              <div class="avatar-name rounded-circle"><span>IS</span></div>
            </div>
            <div class="ms-2">임성완</div>
          </div>
        </td>
         <td class="text-nowrap">club3</td>
       <td class="text-nowrap">2023-08-03</td>
        <td><span class="badge badge rounded-pill d-block p-2 badge-subtle-primary">Processing<span class="ms-1 fas fa-redo" data-fa-transform="shrink-2"></span></span>
        </td>
        <td>
          <button class="btn btn-falcon-primary btn-sm" type="button">결제승인</button>
        </td>
      </tr>
      <tr class="align-middle">
        <td class="text-nowrap">
          <div class="d-flex align-items-center">
            <div class="avatar avatar-xl">
             <div class="avatar-name rounded-circle"><span>SY</span></div>
            </div>
            <div class="ms-2">송영은</div>
          </div>
        </td>
        <td class="text-nowrap">club4</td>
       	<td class="text-nowrap">2023-08-02</td>
        <td><span class="badge badge rounded-pill d-block p-2 badge-subtle-secondary">On Hold<span class="ms-1 fas fa-ban" data-fa-transform="shrink-2"></span></span>
        </td>
        <td>
          <button class="btn btn-falcon-primary btn-sm" type="button">결제승인</button>
        </td>
      </tr>
      <tr class="align-middle">
        <td class="text-nowrap">
          <div class="d-flex align-items-center">
            <div class="avatar avatar-xl">
              <div class="avatar-name rounded-circle"><span>CJ</span></div>
            </div>
            <div class="ms-2">최정윤</div>
          </div>
        </td>
         <td class="text-nowrap">club5</td>
       	<td class="text-nowrap">2023-08-01</td>
        <td><span class="badge badge rounded-pill d-block p-2 badge-subtle-warning">Pending<span class="ms-1 fas fa-stream" data-fa-transform="shrink-2"></span></span>
        </td>
        <td>
          <button class="btn btn-falcon-primary btn-sm" type="button">결제승인</button>
        </td>
      </tr>
    </tbody>
  </table>
</div>
<%@ include file='../../inc/adminBottom.jsp'%>