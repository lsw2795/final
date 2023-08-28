<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file='../../inc/adminTop.jsp'%>
<!DOCTYPE html>

<div class="table-responsive scrollbar">
  <table class="table table-hover table-striped overflow-hidden">
    <thead>
      <tr>
        <th scope="col">Name</th>
        <th scope="col">Title</th>
        <th scope="col">Date</th>
        <th scope="col">Status</th>
        <th scope="col">Delete</th>
      </tr>
    </thead>
    <tbody>
    <!-- 반복 시작  -->
    <c:forEach var="map" items="${list }">
      <tr class="align-middle">
        <td class="text-nowrap">
          <div class="d-flex align-items-center">
            <div class="avatar avatar-xl">
              <div class="avatar-name rounded-circle"><span>${map['IMAGE']}</span></div>
            </div>
            <div class="ms-2">${map['NAME']}</div>
          </div>
        </td>
        <td class="text-nowrap">${map['TITLE']}</td>
        <td class="text-nowrap"><fmt:formatDate value="${map['REGDATE']}" pattern="yyyy-MM-dd"/></td>
        <td>
        	<span class="badge badge rounded-pill d-block p-2 badge-subtle-success">
        		${map['REPORT_STATUS']}
        		<span class="ms-1 fas fa-check" data-fa-transform="shrink-2"></span>
        	</span>
        </td>
        <td>
          <button class="btn btn-falcon-primary btn-sm" type="button">삭제</button>
        </td>
      </tr>
    </c:forEach>
	<!-- 반복 끝 -->
    </tbody>
  </table>
  <div class="text-center d-none" id="contact-table-fallback">
     <p class="fw-bold fs-1 mt-3">신고 게시물이 없습니다.</p>
 </div>
</div>
	<div class="card-footer d-flex justify-content-center">
        <button class="btn btn-sm btn-falcon-default me-1" type="button" title="Previous" data-list-pagination="prev"><span class="fas fa-chevron-left"></span></button>
           <ul class="pagination mb-0"></ul>
        <button class="btn btn-sm btn-falcon-default ms-1" type="button" title="Next" data-list-pagination="next"><span class="fas fa-chevron-right"></span></button>
    </div>
<%@ include file='../../inc/adminBottom.jsp'%>








